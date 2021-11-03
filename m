Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB9AC433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 23:28:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4676.1635982114942806572
 for <linux-safety@lists.elisa.tech>;
 Wed, 03 Nov 2021 16:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NqK+xbAv;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id k4so4136973plx.8
        for <linux-safety@lists.elisa.tech>;
 Wed, 03 Nov 2021 16:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTKeTpSaqg6qacJy2Lj1MJbb1IklmL+9TQLeEYwAHSw=;
        b=NqK+xbAv/t1zh1YXjbwXNlfQ8SItvNe51vJ0tF1nvaNegOY7xE1iF0r9tYozZcqRmt
         +jWyR10SfjGVDqek4/kDUw7BkZjfksCLmFym5wBvY9NjUtpEW+3SRJG3k1g0ycXTjoLJ
         eTSNL69Pt92n3Ub12qghamK44pFdSK31kGW4C1fYWCTCP1nsflrMrSRIseDvGQ9p6joh
         pCLCLv65VfZoSMKl+kYUvMWpV5L8yUFfa9NF5S9yTAQQHUZ3e+aL+TVZ/712twk+wyHO
         KQBuoijcViqh9Ewr2XF2OOnpqxROfkPbnk5teQ46qpwVJa1wWyU/vTUyTC9mMpp1fmTZ
         H5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTKeTpSaqg6qacJy2Lj1MJbb1IklmL+9TQLeEYwAHSw=;
        b=A2a77Vl9veocERIhKuC9sbZA+oEND9RiNImc2G9qzIEQYdMeRI7vu/6YyCBMO+TBib
         Pmr6Kn++h1zXI8JsODMsmpVZSmbADzkKEvDOXgLVrjGdRL+wU0K6pgH5iMZgLUSu+JHE
         8Dj13qtQwFjm8QZwMGklnRy4/ff65KpDRP1pLFWzerM5OpNBn08KiepK1KdrlF9NvC8Y
         VuVb3uDefvm7VLPseSAx13uOgZbF6rdXJj1ivAN4db98gVPZ57kGdBBzZobYo+dx8X4y
         nl7ailQB+Sk8D3WcaVa+vqxmQZqYB6V98vz/Fy5cu/jgOXzS8GNhtIZUgGxQqclXrWWL
         Ixzg==
X-Gm-Message-State: AOAM532u4SrwpfY1L8KYIPsa5gX7Fxxta7oLtnSgeDfpee02E/dSf/6L
	OWdQYhXiVQ4liNMZasPDNP6E4Mozsiw=
X-Google-Smtp-Source: 
 ABdhPJzOONsgvJ75M07O3ej9pW7+V/r7plAxHaLSPzW9DoG6X2iIFLlzd6QIAxnlJEjozPBSRIDhoA==
X-Received: by 2002:a17:90a:62c1:: with SMTP id
 k1mr17929460pjs.33.1635982113867;
        Wed, 03 Nov 2021 16:28:33 -0700 (PDT)
Received: from localhost.localdomain ([171.224.180.34])
        by smtp.gmail.com with ESMTPSA id
 a15sm3606225pfv.90.2021.11.03.16.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:28:33 -0700 (PDT)
From: Nghia Le <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech,
	lukas.bulwahn@gmail.com
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [PATCH] ipv6: remove useless assignment to newinet in
 tcp_v6_syn_recv_sock()
Date: Thu,  4 Nov 2021 06:27:22 +0700
Message-Id: <20211103232722.30999-1-nghialm78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Wed, 03 Nov 2021 23:28:35 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/261

The newinet value is initialized with inet_sk() in a block code starting
from checking condition of protocol to exiting by returning newsk
structure. Along the code path, newinet is never read. Thus, assignment
to newinet is wredundant and can be removed.

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 net/ipv6/tcp_ipv6.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 2cc9b0e53ad1..551fce49841d 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1263,7 +1263,6 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
 
 		inet_sk(newsk)->pinet6 = tcp_inet6_sk(newsk);
 
-		newinet = inet_sk(newsk);
 		newnp = tcp_inet6_sk(newsk);
 		newtp = tcp_sk(newsk);
 
-- 
2.25.1


