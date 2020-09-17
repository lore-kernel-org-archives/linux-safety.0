Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.11152.1600332261960644786
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 01:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aZA2NHxT;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id l9so1165848wme.3;
        Thu, 17 Sep 2020 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yH/NXxch2W9OqhIt3fMgAACXOX/ZWLlb86eM0pPGtAA=;
        b=aZA2NHxTEG5VngyLZ9oQoqeEfdr0xvBB3IXs1W4J6T7GrabRmYG7jH2qzIw7P8vNn1
         X4pqex11HKWPPG9lBn3/zN5nASgu0R5ddpLL3hCiHefbEZJVmMKB7Sjj3zdyj/AQExH6
         Ddbb24qm2B+9JTb013QMDWfP6b76Z95yrUmwN5TX5GquA8SyRc9CX/N718eZdsPQTixA
         kDQQK0tovtqrzp1fT8srGNJAI8lXbsYgZi5Uy+vlnQpZnXftBvOS5I7jP/BMIZeaRCw0
         lr/oaqxtD2LgAMwDm18nV9wT8eaxDI2k42MqQbHr5eisuMvBhj4LTGMAYDnPgUeLHaRl
         lnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yH/NXxch2W9OqhIt3fMgAACXOX/ZWLlb86eM0pPGtAA=;
        b=CpXZ2ZwtEXwqMbWaxRVt5/vi2Kuf+a/GCt1uX5CsJpyLku6/krLVMQjj0ya0WxKhU4
         6qb7rzUFNio5HVi0Bn7G/2ghQ55CiEB9vULsV7eWcXA8gXkA+9Ds0+vpEuPlknNbJRBn
         pjPa3f9QBnYQIdmeZ7chNATX2XHKl70C29OtHAuM5Wx5QUeaVifKS+D3/xzioDH6ZhE9
         aBuEc78U+biT+hWiXd1kUonE8CnjBSpASvhIRYODu5ykr9rZ+2F0seT7b9QdJlixMmqy
         HFkj/1nhI8WrE4J5g/kN+X83L6qM2fi3GIlGvZ6AEOE0FPkxdnb0b0JCbggYNIrzk6Wd
         PdvA==
X-Gm-Message-State: AOAM530Y8HLZhTaymNUw5PV5IC4q2ws5Ozdr5MAzRvfMsE6fK7rXHz4i
	bV8H+xaVqeDByCT77qYOfo9rPghjsLHy5iES
X-Google-Smtp-Source: ABdhPJzXoOe/RvqKz80JmqKJ/es/bp0aw5w+fGWylvDpJtL5K4lazcUV1s8XuplQt64hDYZrXNxLFg==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr8835185wmj.106.1600332259959;
        Thu, 17 Sep 2020 01:44:19 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2da3:1100:b83e:2569:25b7:30a0])
        by smtp.gmail.com with ESMTPSA id t17sm13527396wrx.82.2020.09.17.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:44:19 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: development-process@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] mm: vmscan: provide a change to the development-process group
Date: Thu, 17 Sep 2020 10:44:09 +0200
Message-Id: <20200917084409.26992-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

I think this change is needed for safety, whatever that might mean to you.

I am unqualified to really make a change here, as I have no clue what this
code does, nor what my change does, but sure, the testing and verification
reference process can now point out the required next steps in the
reference process to test this code and code change.

Good luck :)

Not intended for distribution to the general kernel mailing lists.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
I would like to submit such a patch, what do I need to do according to
the expected testing and verification recommendations for safety-related
systems?

Please help me. What do I need to compile, what test do I need to run,
which verification tool do I need to employ for this change?

Or even more basic: where would I even find that information?

 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 980155e257bf..aef8060efa8f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3893,7 +3893,7 @@ static int kswapd(void *p)
 					highest_zoneidx);
 
 		/* Read the new order and highest_zoneidx */
-		alloc_order = reclaim_order = READ_ONCE(pgdat->kswapd_order);
+		alloc_order = READ_ONCE(pgdat->kswapd_order);
 		highest_zoneidx = kswapd_highest_zoneidx(pgdat,
 							highest_zoneidx);
 		WRITE_ONCE(pgdat->kswapd_order, 0);
-- 
2.17.1
