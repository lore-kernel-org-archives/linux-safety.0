Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web08.9546.1605208387051185002
 for <linux-safety@lists.elisa.tech>;
 Thu, 12 Nov 2020 11:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jVBu+ceL;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id d142so6213219wmd.4
        for <linux-safety@lists.elisa.tech>; Thu, 12 Nov 2020 11:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pdSRw9mlDHitGPfQBRUv6P8lG2F84sSOXhcflYqXKJo=;
        b=jVBu+ceL7qUj6u8/X7xubAJKNSY5DbZ2HfkQRBgCL4jTPNrpsiFEiEAvT0tRY7qeK6
         mf6yNfh9nlT1CFl//UHXh1KCkjpuZfzIyaglUJ9+4xO22Wkk/myB5Fta9JH6OzvGHbOU
         eWWQ25wqiwH/kYN8X1sbRbZsGS5qAfha++XnYzyED9rqyYe0pTS55PPnZEgUTR05kmXz
         L2hCpOfrBaMw6Rg/zwikeUz1DrrAWGy7SHVFxf2V2SraMjdWu1C+Cmm/+MzzgvD7tQqP
         k9OtkUTWl+VM+G0bsyKUvh4KiqY14AuDPrQm3HtYkYBPTd7uFj8RXe++f7/H70PArCCv
         tCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pdSRw9mlDHitGPfQBRUv6P8lG2F84sSOXhcflYqXKJo=;
        b=DQ2Y5RM6yYXoRbxJ5O+fXYfNAWQ2acGe2Izm+4+No5qm7GldW8UkelGGRCFA2jXQId
         xp9LvY1KhblJwVhYclJJUTj8fzIxUlM7HEmBZwhYShfCtf+uQFzv+R/qXtBqGWAMxHaF
         Lj2WTtlupyUswvbh6bvUyv+ejN06/kSLFa+4a15IttaaQanRLSlwI09kw801tau+Ef0j
         PuU5EarcHDaaXwjFsHKUbhbpaKztlHE5wY6jk165DEev/lWgkqDqnBJalalp42k4Yjbg
         wbSvdayeHKTqa9bEhf7ljXGtfKS3pJCnCk7XBmAjfjo1GTmbCyNGYL0boLEmRmFJmJ3u
         O3Aw==
X-Gm-Message-State: AOAM532zHo8HU/h3hYu8bIjE16fa5rVrYOBYtZpXbYy9hY2RoaJRCzdf
	Q9g0mQN3IMBQf4Acn0THDDQ=
X-Google-Smtp-Source: ABdhPJzUNjkj5hW3jOV8Ulc6jJZ63ghMB8cNmQwlAyaNV3fB041ODIEjkkL9OKhKE9y1nzvTWuwP2g==
X-Received: by 2002:a1c:b0c4:: with SMTP id z187mr1066051wme.113.1605208385297;
        Thu, 12 Nov 2020 11:13:05 -0800 (PST)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d19:d300:649c:b988:4446:6d44])
        by smtp.gmail.com with ESMTPSA id 30sm427118wrd.88.2020.11.12.11.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:13:04 -0800 (PST)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: Tom Rix <trix@redhat.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] USB: storage: avoid use of uninitialized values in error path
Date: Thu, 12 Nov 2020 20:12:55 +0100
Message-Id: <20201112191255.13372-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

When usb_stor_bulk_transfer_sglist() returns with USB_STOR_XFER_ERROR, it
returns without writing to its parameter *act_len.

Further, the two callers of usb_stor_bulk_transfer_sglist():

    usb_stor_bulk_srb() and
    usb_stor_bulk_transfer_sg(),

use the passed variable partial without checking the return value. Hence,
the uninitialized value of partial is then used in the further execution
of those two functions.

Clang-analyzer detects this potential control and data flow and warns:

  drivers/usb/storage/transport.c:469:40:
    warning: The right operand of '-' is a garbage value
    [clang-analyzer-core.UndefinedBinaryOperatorResult]
          scsi_set_resid(srb, scsi_bufflen(srb) - partial);
                                                ^

  drivers/usb/storage/transport.c:495:15:
    warning: Assigned value is garbage or undefined
    [clang-analyzer-core.uninitialized.Assign]
                  length_left -= partial;
                              ^

When a transfer error occurs, the *act_len value is probably ignored by the
higher layers. But it won't hurt to set it to a valid number, just in case.

For the two early-return paths in usb_stor_bulk_transfer_sglist(), the
amount of data transferred is 0.  So if act_len is not NULL, set *act_len
to 0 in those paths. That makes clang-analyzer happy.

Proposal was discussed in this mail thread:

Link: https://lore.kernel.org/linux-usb/alpine.DEB.2.21.2011112146110.13119@felia/

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201112

I did some basic compile testing...

Alan, Greg, please pick this minor non-urgent clean-up patch.

 drivers/usb/storage/transport.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 238a8088e17f..5eb895b19c55 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -416,7 +416,7 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
 
 	/* don't submit s-g requests during abort processing */
 	if (test_bit(US_FLIDX_ABORTING, &us->dflags))
-		return USB_STOR_XFER_ERROR;
+		goto usb_stor_xfer_error;
 
 	/* initialize the scatter-gather request block */
 	usb_stor_dbg(us, "xfer %u bytes, %d entries\n", length, num_sg);
@@ -424,7 +424,7 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
 			sg, num_sg, length, GFP_NOIO);
 	if (result) {
 		usb_stor_dbg(us, "usb_sg_init returned %d\n", result);
-		return USB_STOR_XFER_ERROR;
+		goto usb_stor_xfer_error;
 	}
 
 	/*
@@ -452,6 +452,11 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
 		*act_len = us->current_sg.bytes;
 	return interpret_urb_result(us, pipe, length, result,
 			us->current_sg.bytes);
+
+usb_stor_xfer_error:
+	if (act_len)
+		*act_len = 0;
+	return USB_STOR_XFER_ERROR;
 }
 
 /*
-- 
2.17.1
