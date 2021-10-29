Return-Path: <SRS0=p+Z1=PR=lists.elisa.tech=bounce+72012+258+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2AEC433EF
	for <linux-safety@archiver.kernel.org>; Fri, 29 Oct 2021 16:00:49 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6204F610D2
	for <linux-safety@archiver.kernel.org>; Fri, 29 Oct 2021 16:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6204F610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id nvxlYY5279335xtLkZRxgHmK; Fri, 29 Oct 2021 09:00:48 -0700
X-Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.7271.1635523248673547941
 for <linux-safety@lists.elisa.tech>;
 Fri, 29 Oct 2021 09:00:48 -0700
X-Received: by mail-pj1-f52.google.com with SMTP id v1-20020a17090a088100b001a21156830bso10947564pjc.1
        for <linux-safety@lists.elisa.tech>; Fri, 29 Oct 2021 09:00:48 -0700 (PDT)
X-Gm-Message-State: yrdaP8NCDkqkmoMMSg10j6O2x5278000AA=
X-Google-Smtp-Source: ABdhPJwn92Mo32lRTbMVZGI5apBNvA3odbUODFVBZPRTEBMe7fzkorYNMhgr1ite8UdhJCFxWal22A==
X-Received: by 2002:a17:90a:eb03:: with SMTP id j3mr12136744pjz.149.1635523244836;
        Fri, 29 Oct 2021 09:00:44 -0700 (PDT)
X-Received: from localhost.localdomain ([171.224.177.172])
        by smtp.gmail.com with ESMTPSA id j15sm7496450pfh.35.2021.10.29.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 09:00:44 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech,
	lukas.bulwahn@gmail.com
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [linux-safety] [PATCH] io_uring: remove redundant assignment to ret in io_register_iowq_max_workers()
Date: Fri, 29 Oct 2021 22:59:36 +0700
Message-ID: <20211029155936.18094-1-nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1635523248;
 bh=fo40mPxPCYuXqNbqszKzl8lijmXTGopRFQ+Vqm7bNRs=;
 h=Cc:Date:From:Subject:To;
 b=UH/pgEX88cdqz17FQ4zxsTdu8n8EmdNxVHs8ztpWm3mjKykW8hTe/JmZEVNn1qF1t4x
 HfZxstT9zPoa5UpmllgC30OxcI3yN88zRpBFdkXqDtNLYqPxZab3xYT9RF1gFGTtfmtpN
 4+Q+S6wHU2lbcwEXpiAN2pgT7T3b3s42qSA=
Message-ID: <20211029155936.AIAuzzJrRDz95-HshlGW95_OKS185XM7pNZfw2dpQew@z>

After the assignment, no paths but only exit path 'err' using ret as
return value. However,before going to exit path 'err', ret is changed
as the return value of io_wq_max_workers(). Hence, the assignment is
redundant and can be removed.

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 fs/io_uring.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index acc05ff3aa19..d18f1f46ca83 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -10800,7 +10800,6 @@ static __cold int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
 	memcpy(ctx->iowq_limits, new_count, sizeof(new_count));
 	ctx->iowq_limits_set = true;
 
-	ret = -EINVAL;
 	if (tctx && tctx->io_wq) {
 		ret = io_wq_max_workers(tctx->io_wq, new_count);
 		if (ret)
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#258): https://lists.elisa.tech/g/linux-safety/message/258
Mute This Topic: https://lists.elisa.tech/mt/86680054/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


