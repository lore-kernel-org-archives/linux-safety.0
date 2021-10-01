Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262E8C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 17:57:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.939.1633111075137559764
 for <linux-safety@lists.elisa.tech>;
 Fri, 01 Oct 2021 10:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IaJ8wB7U;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id bb10so6828107plb.2
        for <linux-safety@lists.elisa.tech>;
 Fri, 01 Oct 2021 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUNLMNtvj5y9WHHRe0gwwIQYw8T1pKaAbP8J74JvI6s=;
        b=IaJ8wB7U0degp4mb/GPlY0mshVO3j6Ld2BoRh7Kf2wnKeEM8kz8mFOEMGoQO8aqfeH
         IvZ06pR5IOoJMLG9OgTukRjmIfWjNSSVOEa1F24Ew7upiM+Ktxz/USbfOv4cnW9iyTWY
         lcQTt9e8CiPFXs5EISUNJB7Ul06/S4AFYzJy7/SNFiPlRqcE+kl/pcMS4RCUnOshTJSw
         dKEb45U0Fka3ink+AfxbB58l1ecjvZjP9HQZE5y5wW8a5npOrcJa7cawf1yS2u4upz5G
         AjllP6WtNlG9O+j5vPx8bgSonuvV+z4FIimwoQYwx9VJ6JAPQfe52bPQKFz21sQGGIPK
         bHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUNLMNtvj5y9WHHRe0gwwIQYw8T1pKaAbP8J74JvI6s=;
        b=zQa5uTd3SvaMp8ZRroRDkHjnOJUfbzsBEzNn7nGV7J6m0Dl11FT+oL7qSRIZeGkoDP
         MPJy9bflbplT2F3MeoWMv7tZfKAINCa7SHd46FGCxWXgzr4GKPpcrgdfcPv+lYsYzN+p
         vFYGx1QMI770uetYGiJVrMGCObX1rnn2BIjVto/WDuQkH8S7+fUMmm02FKsAP5N35+he
         c6j5JvUyFYWW0Z6QcNDi/7R/i6mG0lU6cwa9IWLOfqVB8c/mljMBWVajZS5vzEAHe5jl
         sP8At6QilZwCzHUB5HzvbbqRcjhD4JLn5i9/XeOpBwMWFh0TLA9zzSVlXNKy9lMK/q/D
         DBLg==
X-Gm-Message-State: AOAM531nna71j7W5Dn/6cdRgqQhE6uglw3lQt7U6coll2ApGakE6639v
	1QA23KzP3cMjDoV+1RSrGHSQROXY+hl95cSi1Efwpw==
X-Google-Smtp-Source: 
 ABdhPJwJPwB3t8NGscaVmuZNFiL8II58rBtRebvF33yH+BLcmgoiS6DBALu/XifrV/Iq3Qpdr6DdBA==
X-Received: by 2002:a17:902:c406:b0:13b:7b40:9c5a with SMTP id
 k6-20020a170902c40600b0013b7b409c5amr10965386plk.81.1633111074158;
        Fri, 01 Oct 2021 10:57:54 -0700 (PDT)
Received: from ubuntu.localdomain ([171.224.177.7])
        by smtp.gmail.com with ESMTPSA id
 b10sm227317pfl.200.2021.10.01.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:57:53 -0700 (PDT)
From: Nghia Le <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>,
	lukas.bulwahn@gmail.com
Subject: [PATCH] mm/hugetlb.c: remove deadstore in demote_size_show()
Date: Sat,  2 Oct 2021 00:57:32 +0700
Message-Id: <20211001175732.75170-1-nghialm78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Fri, 01 Oct 2021 17:57:56 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/247

Deadstore was detected by CodeCheck tool (ELISA group)

Removed demote_size and relevant assignment in function demote_size_show()
to fix deadstore issue of which stored value to demote_size is never read

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 mm/hugetlb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 993efa70bce4..ef00e6ad0f6a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3706,11 +3706,9 @@ static ssize_t demote_size_show(struct kobject *kobj,
 					struct kobj_attribute *attr, char *buf)
 {
 	struct hstate *h;
-	unsigned long demote_size;
 	int nid;
 
 	h = kobj_to_hstate(kobj, &nid);
-	demote_size = h->demote_order;
 
 	return sysfs_emit(buf, "%lukB\n",
 			(unsigned long)(PAGE_SIZE << h->demote_order) / SZ_1K);
-- 
2.25.1


