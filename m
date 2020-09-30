Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.2051.1601492163856650390
 for <linux-safety@lists.elisa.tech>;
 Wed, 30 Sep 2020 11:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b6EwAUV3;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id l15so627846wmh.1
        for <linux-safety@lists.elisa.tech>; Wed, 30 Sep 2020 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IDr2wAtXJx0+neOn7cIZ0lFnMnpEYiTBO0RQFY8qdSQ=;
        b=b6EwAUV3SBWbRyEjBvMGJI9Yw3atuhQNUSec5P8hjLals34oO9CFdQiRZgnkfJ1wtH
         otRiPul539u1KKN6M8HJSdyooIa5xm8J/l4j/+asjrSuh0ASDjsUiuFpiSH7u//KrGxt
         IpbSs3HbVIOnia45FmBky++0lyy7uRk/7PZucZreLMHDVH4Rlm3hDirzHYzD7eqktHel
         8+y+hEbRp4TReaG6eb8EHhTvFX6w9kEDqW6+/qTvHBZvLX+tGbalBssPYao5opgjTCRW
         hC+XXXhLZGy6pR0MeGqhjgwQvoOPRo+bflcGw1sJFWamnHCtf416BFJ/6rVGmnUMTdGv
         1VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IDr2wAtXJx0+neOn7cIZ0lFnMnpEYiTBO0RQFY8qdSQ=;
        b=YN/TlPoTze/np/9PLGJyRqcocOt57oCHLaBAtVeVbXUV9ghT7SUaApXG01LQsBgCY8
         AlmwHs0J7PiIXIvMl/qDwEVFQfarWxwn2k95nS6fHNpsJ6iLStKNLVbHe2Asu+Ke4nZo
         eFuL6iQw4/At7WA4UxndfJmIBMlXdupAeR1aVdgBqcCMY8E175EhSLaBQslIGoj98Jcu
         rC6qcyivI6BqBbBDt3I09y4M9hSqKCdd5YbTIks0ZVUUNZ5pNaYaGZda9aRgSadFXSdL
         RrMGiQ6wrjZxeEJxoClbX6gUtLj2cIJd3JKSr1tGZrR3xeFt4bKJ4TbWKnGhRI3euL18
         cBzg==
X-Gm-Message-State: AOAM532/XY6Wj4oaRztRLfI/gKKaSM0dEKbActJsoh9fdTeDnc9/sJMr
	yV43LbE1SiuzDrnrvJ3Fmrk=
X-Google-Smtp-Source: ABdhPJz6jU82fHCmCavBCON5X8sKCcNR+NtXto749V07XtSAdZscMEHkP3ri32LD70Ul2sC3h2itBQ==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr4594827wmk.16.1601492162236;
        Wed, 30 Sep 2020 11:56:02 -0700 (PDT)
Return-Path: <sudipm.mukherjee@gmail.com>
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id u12sm4544040wrt.81.2020.09.30.11.56.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 11:56:01 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] proc: remove a pointless assignment
Date: Wed, 30 Sep 2020 19:53:59 +0100
Message-Id: <20200930185359.27526-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0

The variable 'env_start' has only been used for the if condition before
this assignment and is never read after this.
So, remove the assignement.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 fs/proc/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index aa69c35d904c..238925ff3a80 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -279,7 +279,7 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
 	 * only when it overflows into the environment area.
 	 */
 	if (env_start != arg_end || env_end < env_start)
-		env_start = env_end = arg_end;
+		env_end = arg_end;
 	len = env_end - arg_start;
 
 	/* We're not going to care if "*ppos" has high bits set */
-- 
2.11.0
