Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C14C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 16:00:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.7271.1635523248673547941
 for <linux-safety@lists.elisa.tech>;
 Fri, 29 Oct 2021 09:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QuIMOV3W;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso10947564pjc.1
        for <linux-safety@lists.elisa.tech>;
 Fri, 29 Oct 2021 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBbGrxCYXSvvl5o2Pm2O61wN1CxZCle9SS0RY/ps308=;
        b=QuIMOV3WgDdBAolBiri06aMCxJX9QMCEw6XDRh1NmXuNWBpquJ8TBXYRCN+Ns6+AJV
         klo1Q0bmuzQ3wFq9Hz9IwNBpqIjHqshxqmBT2YVmRgCxXexICxn6JQP6OVAIqh7YwT7R
         CiFO9f3QtE5R+ks1HvwwUx92syaokrdoFdXyYDTFgumqBgTkphl4azBeXSKubdqi/KVM
         3zRE+uBndpCKbKkV7FQ1XkcW9f2WEitSpY2+rxbS11BCModGtC1TcJZ+AF6y80pxMGF8
         qria4KztaQCZv5Zi/lWNyVXeMVtwH3BTy/Nqe2LgiieTb/ECI3W1yslub6rfXDJZqb4f
         UkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBbGrxCYXSvvl5o2Pm2O61wN1CxZCle9SS0RY/ps308=;
        b=Zj3fUTuymNL+Bt+IQHNXBbd8sjNZYqRxZEvv/YB82VARHrnZr+6hQ1kpmIwF+UALS8
         9wFg3uyVia/3EgPrJ/CXZApFH5lnKqr5WJlDjDdxcSm/NGd5JydrTXR15lpMSODnPNVz
         jHnn8+unJa3+PyPrzyApUH5XBdHZxHtQDIKyCjxSmgRzJ7WtqkEPZpRdF+bH34uqyezt
         bELb2vs3rxsAN21VVsowgfUG9TdUczNdxE2LqISsdGKhMmttPHfRC9mDBLIRb0cgzci8
         LAGQNtyXP4xPru6W4zHLzg8K4oUt7t4U8wlEUae4Nu6KxrvCGig3ZBS9J2W7zE7ELqPn
         JZeg==
X-Gm-Message-State: AOAM530Tkavl4M84hLA509pucythN2h1O8uEh1wumS37DNwubbqJ/ojr
	gabBai/klBMH0xpjg0LAZOl1zVFI/YUp3dld
X-Google-Smtp-Source: 
 ABdhPJwn92Mo32lRTbMVZGI5apBNvA3odbUODFVBZPRTEBMe7fzkorYNMhgr1ite8UdhJCFxWal22A==
X-Received: by 2002:a17:90a:eb03:: with SMTP id
 j3mr12136744pjz.149.1635523244836;
        Fri, 29 Oct 2021 09:00:44 -0700 (PDT)
Received: from localhost.localdomain ([171.224.177.172])
        by smtp.gmail.com with ESMTPSA id
 j15sm7496450pfh.35.2021.10.29.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 09:00:44 -0700 (PDT)
From: Nghia Le <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech,
	lukas.bulwahn@gmail.com
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [PATCH] io_uring: remove redundant assignment to ret in
 io_register_iowq_max_workers()
Date: Fri, 29 Oct 2021 22:59:36 +0700
Message-Id: <20211029155936.18094-1-nghialm78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Fri, 29 Oct 2021 16:00:49 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/258

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


