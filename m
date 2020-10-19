Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.1121.1603126451055590530
 for <linux-safety@lists.elisa.tech>;
 Mon, 19 Oct 2020 09:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X8N+ONqS;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id t9so470375wrq.11
        for <linux-safety@lists.elisa.tech>; Mon, 19 Oct 2020 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4lmFMYOZxcRqgHCoYqscVc1IJsvYhukG6eGMZy0DSbI=;
        b=X8N+ONqS1GbBuyAersXr8O8qsgMNOSB61u4wF73H4J7eb0Mx+bqT7iNmXU7pGaYA7B
         tyihFo9AtClzMCTQsSfAZ6Wp88Jh6bKhNx+fufjB5X45oBrdZPshMscNtNfvOj2ePlo2
         BUE+d0lXip0xZxPyFgkJkAsUtq7RJb9X2mA17L39PXv/Rrc/wEBh3pDcAahvEFR8XOdk
         SfqrNCDjmLMnQI/LDuFcM8DckS0nxCOU74a0BM94Om02yIDp8qZJyVoQ5ol2K91l4rST
         6ChBfwAyoTaxtr9M+bviRuP2ZNuM7yC2VgLRP59hbY9IU/NUjTVbKvnqz3/AhmTEvISQ
         pq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4lmFMYOZxcRqgHCoYqscVc1IJsvYhukG6eGMZy0DSbI=;
        b=FmPkj9TT1oy2x+99dlnOW61ZDE2TRattYe1KWdNOJo4aZ7qc9KYbkKQ0OWadqSRRu6
         XJ/x+YHH8UjCGmogk/5T9WfoFozt83RkXOa1JQMxFsOZ3rvT5F9kZRrZ4KJjf4Oulzdn
         +Vv+g5ZsY1JsB4ZinmYDiZOKXSAO2tdt0oWspRNFlRKzTrqDnNgE0EvIfT2tPpbRoIyt
         Cp9gtpq4rJW+CcMdG/o/CL/j7eS3ar9y+P5dNOxHwaj2y0Ob+VM1IOFscRUgqnsrFDEV
         CMVdIn8ZETlOiIC+Fp05nxQMlvffjplHLMrIyo5swzkCQQ6VxpzccaNg5J1+PrAGI2XJ
         5bfQ==
X-Gm-Message-State: AOAM531wfDT9XDK3itnzt9+TiSrVTLLee7vxTTQc4bxeobtXWrLsmCXZ
	eGlz2sFaRSuQgx0fMABJziBlWPd/WXs2eg==
X-Google-Smtp-Source: ABdhPJzz1tw+tlF9YXyGpI5YTYn6qrFFreWMowAEDuRlpOJHH75ycXo3sv5hkErByH/yksGbAzXDWw==
X-Received: by 2002:adf:fb8b:: with SMTP id a11mr104865wrr.407.1603126449283;
        Mon, 19 Oct 2020 09:54:09 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2df7:1800:3c8f:878f:cc06:9a83])
        by smtp.gmail.com with ESMTPSA id a3sm340660wrh.94.2020.10.19.09.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 09:54:08 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] ipv6: mcast: make annotations ip6_mc_msfget() consistent
Date: Mon, 19 Oct 2020 18:53:58 +0200
Message-Id: <20201019165358.28391-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit 931ca7ab7fe8 ("ip*_mc_gsfget(): lift copyout of struct group_filter
into callers") adjusted the type annotations of ip6_mc_msfget() at its
declaration, but missed the type annotations at its definition.

Hence, sparse complains on ./net/ipv6/mcast.c:

  mcast.c:550:5: error: symbol 'ip6_mc_msfget' redeclared with different type \
  (incompatible argument 3 (different address spaces))

Make ip6_mc_msfget() annotations consistent, which also resolves this
warning from sparse:

  mcast.c:607:34: warning: incorrect type in argument 1 (different address spaces)
  mcast.c:607:34:    expected void [noderef] __user *to
  mcast.c:607:34:    got struct __kernel_sockaddr_storage *p

No functional change. No change in object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
linux-safety developers, please review, test and confirm. Thanks.

 net/ipv6/mcast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index 8cd2782a31e4..6c8604390266 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -548,7 +548,7 @@ int ip6_mc_msfilter(struct sock *sk, struct group_filter *gsf,
 }
 
 int ip6_mc_msfget(struct sock *sk, struct group_filter *gsf,
-	struct sockaddr_storage *p)
+		  struct sockaddr_storage __user *p)
 {
 	int err, i, count, copycount;
 	const struct in6_addr *group;
-- 
2.17.1
