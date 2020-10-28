Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.7676.1603886039502470283
 for <linux-safety@lists.elisa.tech>;
 Wed, 28 Oct 2020 04:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rHSCGXVC;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id n15so5382116wrq.2
        for <linux-safety@lists.elisa.tech>; Wed, 28 Oct 2020 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YhwU+8BLpV9225RTD4hONYgLMtesha5JLBAdjHXbCcQ=;
        b=rHSCGXVCD6q+JxkS3NIuiDdRrHZIawiuivzjtGWeRf2wRCnkPLS/QAecdOZQELnFt6
         mKfK6KXmmCVTJ5RRJCS5az9bBLUZhojSm6Ng+0+tDwkojvYdJh5iDI39OEa8ProOQPeQ
         zKHGAWltHJv0EGKdUzsnwifTUmPXefXZ+UkymX1qAsLH6pfNFSrUSKw26YmKxO1ZRLLg
         DjuD1QRl/4SkKsoBpkPzw7upiYgL3tOdPjOM8ifniM2LXFdlMvxoRHCFtxBEsTKPpCdC
         P6dw9XD6F7nJTcY2Plff3wuBdwWTIhB9zYqBcVo7UPaUwN6CygFsRwP2QVH939b/3M/Q
         ABCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YhwU+8BLpV9225RTD4hONYgLMtesha5JLBAdjHXbCcQ=;
        b=H0AWe5czBVCdEdkOci3se8Nyzt5lViS7FWa1at7kjZrdbuxRZJuAahGTwYkCcizq4O
         AUD0mrEhbin2mc615gw2tgS1ZQg7QKB+PND6y9oF83gRy6OXkf85TAhhuISRHCEzsWFP
         dHzXMgBmlJJ3MFWKXeIN8hj2WrbA3KO1bt/81I4SYTPz3vztx9mqo8cbx8EMjMd1aOeI
         pKE5pZXcRmKRRkuVowc1g0jx9vxvBNXEqFnpcHealm7mp4dHfWrIf6rp9LNH55oUAPi3
         U5xpnNQPIxG043sC3vGcrxzdFx0FhB2YDUHZ2jX6WUJ2cen8XVm77JkSj57NNw75tCCF
         caVA==
X-Gm-Message-State: AOAM532AlM+JsRgFeBrRFnRG6QIHpZFa3tgnSw1zYPNbYK41gdiqQ9rQ
	IR4K4YFDH3PtZ8wNt7xrKYA=
X-Google-Smtp-Source: ABdhPJye0EMNguEkh0PcXJ7btOefLszJrY8XMh/7mC4zZNhsgK3FseLzVzx5vrNWW2xWJIeprYpd4w==
X-Received: by 2002:a5d:5548:: with SMTP id g8mr8460210wrw.364.1603886037722;
        Wed, 28 Oct 2020 04:53:57 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d7a:200:a915:6596:e9b0:4f60])
        by smtp.gmail.com with ESMTPSA id v123sm6029066wme.7.2020.10.28.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:53:56 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] ipv6: mcast: make annotations for ip6_mc_msfget() consistent
Date: Wed, 28 Oct 2020 12:53:49 +0100
Message-Id: <20201028115349.6855-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit 931ca7ab7fe8 ("ip*_mc_gsfget(): lift copyout of struct group_filter
into callers") adjusted the type annotations for ip6_mc_msfget() at its
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
applies cleanly on current master and next-20201028

David, Jakub, please pick this minor non-urgent clean-up patch.

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
