Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7377BC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.1209.1634838227467748714
 for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 10:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BtwoI3Ou;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id y1so918578plk.10
        for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hKOPC1WT6UGp3xz0tXMcay7XQvL7kV+v2d/lD6O0cRs=;
        b=BtwoI3Ou7yl9N+ku6KMmna+mkwjqMeyMYjCFf5RHP3u51D9lhoXGRfqDi0GahxFfOD
         VRm96ND0UQvh0sGCMo0JENma51o8JPCPp1jIWPIx9uSafzD6NbzBuEMEG2l04YQW+0IJ
         +0Dbvoc8NCZCVVE4qW2k+LceS6tuZiHO/9Tp3sDzn6+S5/Ycqkz66ShySvQi8wnxbnSP
         jUL8guAokMQP4H+B3/fiyt/6Z+oyHwWBw5ukiHJa82V9yJpD7JffHd3siTBt4ILzemMV
         WJ1CsoyGm4Pwg0BdFkjq+v7Hre5BeMERY7i/qaXQwREIwoa6tRhaLYQk4lprU4GpHyK7
         7nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hKOPC1WT6UGp3xz0tXMcay7XQvL7kV+v2d/lD6O0cRs=;
        b=UUe8oAeKOXOtchJvVbUhQFc+gk9jwJnAcA/5tHSmV63AWw98G5CVmeYmEr/qJQ4oeO
         qdukh2PPyUrDO3I8tCpyaaW5aLhtJvgVajGwmK6eIqTjJxWZ0YU+/jwuJ96g60WRHf9+
         O0+iqPLMfodY6nkyj/1yw5rH6GZZrzqoJPUpN6uNIuZAMVrpu0ZODAPx4iZ8QrBj8LHt
         8CfuXSoiZ+mYfEJehfrN6imjd8RgLq+xoaUiuAXKxPGK7BEKdqgLmid+2MJ0Rdt6V5EA
         R1bNkxnklMA2lUq+Tl/TR2BTwZR0cLIw2KOn//5ihTWmqnXiRroc6VPy5PvokBvNS0Hs
         5zZA==
X-Gm-Message-State: AOAM533ujG9ka8p1OXE6mf1stt12/a3OTylnqGdS9JLo0uXHr9j1Hem7
	/A4AB8u120yqSxaE7JBbXFY=
X-Google-Smtp-Source: 
 ABdhPJx3ze+65zxhqNUgJiP4rhscdYIoZJ5PcqBBQZB4kEsRbfVhAOUv/TwZArkaIZczum1ZS0qFYQ==
X-Received: by 2002:a17:902:ec85:b0:13f:fe5c:bc6d with SMTP id
 x5-20020a170902ec8500b0013ffe5cbc6dmr4002792plg.81.1634838226734;
        Thu, 21 Oct 2021 10:43:46 -0700 (PDT)
Received: from ubuntu.localdomain ([171.224.177.148])
        by smtp.gmail.com with ESMTPSA id
 x40sm7728096pfh.83.2021.10.21.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:43:46 -0700 (PDT)
From: Nghia Le <nghialm78@gmail.com>
To: lukas.bulwahn@gmail.com,
	linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [PATCH v2] ext4: remove useless resetting io_end_size in
 mpage_process_page()
Date: Fri, 22 Oct 2021 00:42:42 +0700
Message-ID: <20211021174242.20627-1-nghialm78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Thu, 21 Oct 2021 17:43:53 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/254
Message-ID: <20211021174242.CR6NSOJ5I0XXzepaVnr4z0i0QZX0zOsU6zD8vEj-A2o@z>

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


