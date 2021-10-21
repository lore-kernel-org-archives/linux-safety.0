Return-Path: <SRS0=yJQW=PJ=lists.elisa.tech=bounce+72012+252+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E298C433EF
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 00:50:19 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1460E61052
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 00:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1460E61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id yOCbYY5279335xF2lvzyO1lO; Wed, 20 Oct 2021 17:50:18 -0700
X-Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.2998.1634777418322315688
 for <linux-safety@lists.elisa.tech>;
 Wed, 20 Oct 2021 17:50:18 -0700
X-Received: by mail-pl1-f173.google.com with SMTP id g5so17341313plg.1
        for <linux-safety@lists.elisa.tech>; Wed, 20 Oct 2021 17:50:18 -0700 (PDT)
X-Gm-Message-State: iYckOhARr0yQ8NVbWHQHj2jbx5278000AA=
X-Google-Smtp-Source: ABdhPJy6CtL/15SuLAvY6rH7OZTRYN/uhFAXU4MkfJR0fdQn2xE1r1o8Z6+hvAjaPgTSDiTTE14oXw==
X-Received: by 2002:a17:902:ecc6:b0:13f:60d1:9360 with SMTP id a6-20020a170902ecc600b0013f60d19360mr2299982plh.9.1634777417339;
        Wed, 20 Oct 2021 17:50:17 -0700 (PDT)
X-Received: from ubuntu.localdomain ([171.224.177.148])
        by smtp.gmail.com with ESMTPSA id l11sm7002483pjg.22.2021.10.20.17.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 17:50:16 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>,
	lukas.bulwahn@gmail.com
Subject: [linux-safety] [PATCH] ext4/inode.c: remove dead stores in mpage_process_page()
Date: Thu, 21 Oct 2021 07:49:14 +0700
Message-ID: <20211021004914.17239-1-nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1634777418;
 bh=z6f1sxUQUBgV0miCQBToTb9zZPOiQJDSGp9nupwskiQ=;
 h=Cc:Date:From:Subject:To;
 b=AS8VDQQsU9zHsOgoSrDkKSCHdUpESsVcvptTkAOZHINPBR0ly2QMiuetzKSaPDHQD8y
 Y4dldEk2Wce42wKgjRk/EAMQxgLsfet+L9fSYAist+UsX1XhMbVwsZUl/7r0CDaTfrYm1
 7tA42282lpvol2WAb+U2ZyyO5SN0qgVzApo=
Message-ID: <20211021004914.lbiN6r9pb2A_m1f0V8KMK31Iu81EBq4rqIrzAdTdOP0@z>

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



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#252): https://lists.elisa.tech/g/linux-safety/message/252
Mute This Topic: https://lists.elisa.tech/mt/86480121/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


