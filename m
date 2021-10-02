Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4BFC433F5
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 11:53:55 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.9819.1633175634648473763
 for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 04:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lc42eXBC;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 66so11529058pgc.9
        for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 04:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1MyiOI+N5UBtlxA/N8Al/5+Vba/8FqMT5XKcAdzHxjg=;
        b=Lc42eXBCmPF5Y4gA2cpY1Bi5Ps6KbaOyJIaLoqSMdHCXPHzwZWnK2fFH1gQc8satZc
         ghoqrvzEtO7rkqrem2Hn4c2x2waFYd1wA/qTeiB1nwZQCdyy9qA4qCAYJbqlHl1gZXhB
         iOYx70Jgi3YSfeSMwPAvtpyjELfGwfgzBUJq5lz6uPh2uyjXoQqh8vgR1AU2/kiGWe7b
         9j5fMk07cHoUdYkDjacUP4xT/sS5OawsbFeijb0jL89dMOapwYOsMcqHrue9Cvf91DF2
         cKALElaoMmedD8K7B0x/4UFJIUGrR2mZtXyBlAWLWlRfhH38NIpSAosj1wjnaSRfQ9op
         KE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1MyiOI+N5UBtlxA/N8Al/5+Vba/8FqMT5XKcAdzHxjg=;
        b=GtzC/ltINB7Bq3y9zKw6m+gLSJYiTZAOc9j5FQsNU6UvaiwVLn4B1rNJ6auB62oOx/
         mo/r/lndBHa/nNlitPQrKLrflgQH4YwTeDMFBXysZpW99/BuT2C43oLzWPPlLYJHWxbM
         Px4G9SyhTP56oDWd+QjBbBmx3ayi+aRd0e8PWfxWR/Z37O80NWsGb90CE8tZuQ00s2O2
         W9MPN1RcymQGCqlaOIyJiRHH7hAuS2uo0ODTnojwa+Us+Gqjo/tgS2H4mqQvHXMYAlDc
         Hubn7iGFKP1wA4whUkMwrNK/xh6wxYjRoec9TvHKynMY+LRpNPcOVl6bzsymEKo1I1B7
         p7MQ==
X-Gm-Message-State: AOAM532/Gw+OQaHdGz1ZKuUXDO60/ICrBa+H49fuHEnQVZqTQt8+YEaV
	h8E+RjZrV3+EdqCgFTjUtXHprOKLn8xg0oNB7gE=
X-Google-Smtp-Source: 
 ABdhPJxloCUxTc56F/HOy43Q4SqA8F/BXNTNP9dx6SK/VutfKM4+n8gOq6ta+CANR1fSo2m/Ci/QtQ==
X-Received: by 2002:a65:6398:: with SMTP id h24mr2536932pgv.367.1633175633703;
        Sat, 02 Oct 2021 04:53:53 -0700 (PDT)
Received: from ubuntu.localdomain ([171.224.177.7])
        by smtp.gmail.com with ESMTPSA id
 y9sm8827901pfm.129.2021.10.02.04.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 04:53:53 -0700 (PDT)
From: Nghia Le <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>,
	lukas.bulwahn@gmail.com
Subject: [PATCH v2] mm/hugetlb.c: remove dead store in demote_size_show()
Date: Sat,  2 Oct 2021 18:53:47 +0700
Message-Id: <20211002115347.77994-1-nghialm78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Sat, 02 Oct 2021 11:53:55 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/249

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


