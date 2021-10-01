Return-Path: <SRS0=FrP2=OV=lists.elisa.tech=bounce+72012+247+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C125C433EF
	for <linux-safety@archiver.kernel.org>; Fri,  1 Oct 2021 17:57:56 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0E8061ABF
	for <linux-safety@archiver.kernel.org>; Fri,  1 Oct 2021 17:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0E8061ABF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id SMkBYY5279335xbZdM5N4Vt9; Fri, 01 Oct 2021 10:57:55 -0700
X-Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.939.1633111075137559764
 for <linux-safety@lists.elisa.tech>;
 Fri, 01 Oct 2021 10:57:55 -0700
X-Received: by mail-pl1-f176.google.com with SMTP id bb10so6828107plb.2
        for <linux-safety@lists.elisa.tech>; Fri, 01 Oct 2021 10:57:55 -0700 (PDT)
X-Gm-Message-State: 3qGahdFfJ59Iuy8e0c9peaRLx5278000AA=
X-Google-Smtp-Source: ABdhPJwJPwB3t8NGscaVmuZNFiL8II58rBtRebvF33yH+BLcmgoiS6DBALu/XifrV/Iq3Qpdr6DdBA==
X-Received: by 2002:a17:902:c406:b0:13b:7b40:9c5a with SMTP id k6-20020a170902c40600b0013b7b409c5amr10965386plk.81.1633111074158;
        Fri, 01 Oct 2021 10:57:54 -0700 (PDT)
X-Received: from ubuntu.localdomain ([171.224.177.7])
        by smtp.gmail.com with ESMTPSA id b10sm227317pfl.200.2021.10.01.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:57:53 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>,
	lukas.bulwahn@gmail.com
Subject: [linux-safety] [PATCH] mm/hugetlb.c: remove deadstore in demote_size_show()
Date: Sat,  2 Oct 2021 00:57:32 +0700
Message-ID: <20211001175732.75170-1-nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1633111075;
 bh=JbyZcVrhqYjaYOfTRB9ViPZ99brciemDVWMQPox1cts=;
 h=Cc:Date:From:Subject:To;
 b=S4wOr71vOuLCjzKRETzgwQ855SrUB/MP8uNVFDdtz3nhTR2MLVnzxNc51BTnnSJ97cE
 K46JNY9YjEzRhu3buWJriYVEstcPVxK2AS3om6lbaTNsu00Ikh0j6GBLcz/8vgBlFPhmj
 BFzzJFVr/i8zQHSNmXx0jqbfX9HlY6ZpnZc=
Message-ID: <20211001175732.AGaY1ihCJUgisiljxXXFQZ-fD6lRBxuG4r2jemW6G58@z>

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



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#247): https://lists.elisa.tech/g/linux-safety/message/247
Mute This Topic: https://lists.elisa.tech/mt/86006510/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


