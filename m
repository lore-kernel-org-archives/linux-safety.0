Return-Path: <SRS0=s55B=PJ=lists.elisa.tech=bounce+72012+254+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAE1C433F5
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:49 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465186112D
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 465186112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id tWX8YY5279335x4KfFZ7i3UY; Thu, 21 Oct 2021 10:43:47 -0700
X-Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.1209.1634838227467748714
 for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 10:43:47 -0700
X-Received: by mail-pl1-f177.google.com with SMTP id y1so918578plk.10
        for <linux-safety@lists.elisa.tech>; Thu, 21 Oct 2021 10:43:47 -0700 (PDT)
X-Gm-Message-State: jsGHhNZElU2grxK4cGhcWwBNx5278000AA=
X-Google-Smtp-Source: ABdhPJx3ze+65zxhqNUgJiP4rhscdYIoZJ5PcqBBQZB4kEsRbfVhAOUv/TwZArkaIZczum1ZS0qFYQ==
X-Received: by 2002:a17:902:ec85:b0:13f:fe5c:bc6d with SMTP id x5-20020a170902ec8500b0013ffe5cbc6dmr4002792plg.81.1634838226734;
        Thu, 21 Oct 2021 10:43:46 -0700 (PDT)
X-Received: from ubuntu.localdomain ([171.224.177.148])
        by smtp.gmail.com with ESMTPSA id x40sm7728096pfh.83.2021.10.21.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:43:46 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: lukas.bulwahn@gmail.com,
	linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [linux-safety] [PATCH v2] ext4: remove useless resetting io_end_size in mpage_process_page()
Date: Fri, 22 Oct 2021 00:42:42 +0700
Message-Id: <20211021174242.20627-1-nghialm78@gmail.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1634838227;
 bh=C2y8W+Ge94M8CopayxHNX3Nyl0bb4bSCRgBCb3zHhcM=;
 h=Cc:Date:From:Subject:To;
 b=kyU3wOBlCBbWL0kKsoPEECztHiYwQc5ywdueTOlNKSMW0/7yCwu4P1JwaQ5Nfli8ox5
 fQp0qbxjWOEx3iS47wInP6GtLa///3IIFCThxR7kfZTbI205/9Una7hPnkCgRH9DSwDrM
 42Uuahpq3w4h7e2YBjW+mjbhCyLrLv04cqg=

The command "make clang-analyzer" detects dead stores.

Do not reset io_end_size to 0 in the current paths, as the function
exists on those paths wihout further using io_end_sized.

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 fs/ext4/inode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 0f06305167d5..03efed2ed1ea 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2260,7 +2260,6 @@ static int mpage_process_page(struct mpage_da_data *mpd, struct page *page,
 			mpd->map.m_len = 0;
 			mpd->map.m_flags = 0;
 			io_end_vec->size += io_end_size;
-			io_end_size = 0;
 
 			err = mpage_process_page_bufs(mpd, head, bh, lblk);
 			if (err > 0)
@@ -2285,7 +2284,6 @@ static int mpage_process_page(struct mpage_da_data *mpd, struct page *page,
 	} while (lblk++, (bh = bh->b_this_page) != head);
 
 	io_end_vec->size += io_end_size;
-	io_end_size = 0;
 	*map_bh = false;
 out:
 	*m_lblk = lblk;
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#254): https://lists.elisa.tech/g/linux-safety/message/254
Mute This Topic: https://lists.elisa.tech/mt/86495840/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


