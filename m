Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20CDC433FE
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 00:50:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.2998.1634777418322315688
 for <linux-safety@lists.elisa.tech>;
 Wed, 20 Oct 2021 17:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBdYtU9K;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id g5so17341313plg.1
        for <linux-safety@lists.elisa.tech>;
 Wed, 20 Oct 2021 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Bm9eWaQHX2ERaAMuyZPzp92WP6cZnX7/DQL1uGCx8g=;
        b=RBdYtU9Kc6LqO5Pb1RHa3NCMPWCd4yJ4RsaiQOq6iXrKl94X88xPGOgdQBWNNaaq0B
         t4yToieMolaNPDE5vdN4vk+9mcpFN96WI9m+yayr8JbdcWVSqvyFtKLAAvozLOub7W5B
         b7Ivy8atBRbBgpEy0Mwn0lfi49fAlDA8KF5hM+WzeQAXDQSAEv5Nn/W3IX2UG62mIpIB
         9lk7yW5MXNSsOP0wvE6l1YYtbfKjRxGvRioghTmdarF0qc/vzmrM9aD7ma8X/kSFlzp6
         o7xi22ItCRRAXmGYJo/GfRUyUBKBrwBDPMFSRqlmqmOtvyPpQ3cTjMvuHGFriPFe/vf/
         Biuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Bm9eWaQHX2ERaAMuyZPzp92WP6cZnX7/DQL1uGCx8g=;
        b=iPjh6TXtnAhoJPgFZHtqM1A27sCj/cbVlM+jX3pWMDn2T5oT1Brrb+bysUxkaas1yM
         W9cMPA+OR0mkZ8Aw9J8x3kQmKUHncSq8PMdX5fz4btAO3Ay6dHhCI3ddisiWzDdqjMeM
         NaYMgjeXFqG/sLlbjlfJnW/TFFFtRCjDF1vmfM5Pjygz/cbMf5fv69g3pxldun6vRkRr
         //RkDqo80Z57xOX9qYesOjO3vlZuOkafoDN3TXRpivN6+L1XMOSVrK1tyrsMivRZvcxh
         BwJMnkKzqz/KIIOO0LpPfVTN7VtqkQwI8niKz2DKE/W7YuuihkxbfolehByX8gXTWKdb
         lADA==
X-Gm-Message-State: AOAM531SdRmEmfLvjV4kr18MVGwr+CvrKXW+gudefvGiXQSkSSAknne0
	Dn9+ehvSU6h6KJp9w+z1pg5ud/PAdAo0jkwJ
X-Google-Smtp-Source: 
 ABdhPJy6CtL/15SuLAvY6rH7OZTRYN/uhFAXU4MkfJR0fdQn2xE1r1o8Z6+hvAjaPgTSDiTTE14oXw==
X-Received: by 2002:a17:902:ecc6:b0:13f:60d1:9360 with SMTP id
 a6-20020a170902ecc600b0013f60d19360mr2299982plh.9.1634777417339;
        Wed, 20 Oct 2021 17:50:17 -0700 (PDT)
Received: from ubuntu.localdomain ([171.224.177.148])
        by smtp.gmail.com with ESMTPSA id
 l11sm7002483pjg.22.2021.10.20.17.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 17:50:16 -0700 (PDT)
From: Nghia Le <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>,
	lukas.bulwahn@gmail.com
Subject: [PATCH] ext4/inode.c: remove dead stores in mpage_process_page()
Date: Thu, 21 Oct 2021 07:49:14 +0700
Message-Id: <20211021004914.17239-1-nghialm78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Thu, 21 Oct 2021 00:50:19 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/252

The command "make clang-analyzer" detected dead stores.

Removed the all the assignments io_end_size=0 to fix dead stores, as
io_end_size is never read.

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


