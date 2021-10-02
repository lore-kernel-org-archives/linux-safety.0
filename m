Return-Path: <SRS0=yfvh=OW=lists.elisa.tech=bounce+72012+249+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E9CC433FE
	for <linux-safety@archiver.kernel.org>; Sat,  2 Oct 2021 11:53:56 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C71661AF7
	for <linux-safety@archiver.kernel.org>; Sat,  2 Oct 2021 11:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C71661AF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id PwlXYY5279335x2EkIOneQXc; Sat, 02 Oct 2021 04:53:55 -0700
X-Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.9819.1633175634648473763
 for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 04:53:54 -0700
X-Received: by mail-pg1-f173.google.com with SMTP id 66so11529058pgc.9
        for <linux-safety@lists.elisa.tech>; Sat, 02 Oct 2021 04:53:54 -0700 (PDT)
X-Gm-Message-State: 3eT12mqcLXgEWFiZYlWT0UvFx5278000AA=
X-Google-Smtp-Source: ABdhPJxloCUxTc56F/HOy43Q4SqA8F/BXNTNP9dx6SK/VutfKM4+n8gOq6ta+CANR1fSo2m/Ci/QtQ==
X-Received: by 2002:a65:6398:: with SMTP id h24mr2536932pgv.367.1633175633703;
        Sat, 02 Oct 2021 04:53:53 -0700 (PDT)
X-Received: from ubuntu.localdomain ([171.224.177.7])
        by smtp.gmail.com with ESMTPSA id y9sm8827901pfm.129.2021.10.02.04.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 04:53:53 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>,
	lukas.bulwahn@gmail.com
Subject: [linux-safety] [PATCH v2] mm/hugetlb.c: remove dead store in demote_size_show()
Date: Sat,  2 Oct 2021 18:53:47 +0700
Message-ID: <20211002115347.77994-1-nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1633175635;
 bh=K3icd7fKTufBrVFzuGaHfNbeV0NXEFMH5FbCRUVDN5E=;
 h=Cc:Date:From:Subject:To;
 b=N9nca/Al88i8KEp2HDq9QSN2QkVDlI5cpzy7zsGTJQePge308nZGOgwLIvVV6uhU62N
 pP9K5/x/FuXWuIwocxxXuGPIOiPX/hrMvHnBkqSTLcW3UTmXnmXNVXyW/LYGMvW2EMBBd
 ZVaZ4RJ0imiOIOJigb90HK1wBwa0ZiY7nhk=
Message-ID: <20211002115347.JGv-yRXcmXgCp7-l7J-26OX4itxtVISjrcjiXVFPmsU@z>

The command "make clang-analyzer" detected a dead store.

Remove demote_size and corresponding assignment in function
demote_size_show() to fix dead store, as demote_size is never read

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
View/Reply Online (#249): https://lists.elisa.tech/g/linux-safety/message/249
Mute This Topic: https://lists.elisa.tech/mt/86021091/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


