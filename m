Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web09.8916.1603891880819667457
 for <linux-safety@lists.elisa.tech>;
 Wed, 28 Oct 2020 06:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mg0c3Trr;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id gs25so7239173ejb.1
        for <linux-safety@lists.elisa.tech>; Wed, 28 Oct 2020 06:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5BWRuAigFz9km9p6yXg2RqfU876ueFRRadA3U73oXM0=;
        b=mg0c3Trr7UnelD/TS7jZb3IcNYeg9PUNHKBgqgm2EOd5jhChVWzR7Apqj6AK9Q1KcM
         tMxe2Td1CttKGmKE3XNu4yHzvYGc2d/3FPBr1E7Y33kuY17IGo9E+HePbnXDW1qhbzZf
         Mo2K88bcLPkj3qUuqSOJ62RsHUgRuZDO1xsh0Op1D/JeaiG4MEZ+W4Rm513htVXedB0b
         /NHjMeVlr8JNFxof3gbATzlE+7fDvqAm0BEIS8KcqBQ+MXPy4XkLAtJHm74dq5PgUmbr
         T5a2ETgU0vHk9mdGPq6gyauAO/i7Z60Hxli1OIslYELpFfZqe5XIgX2ZOsYacCET9rfi
         xfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5BWRuAigFz9km9p6yXg2RqfU876ueFRRadA3U73oXM0=;
        b=eelNGvGHZQQgj+3zrf73FN/WLLwlLTpfBPAqZQdFOLEbSfENnXxnrQYCZxmaAn904s
         jwMzhQG4ctA0zwTJc8eK7/7xRWmrjerNiie801s58IAZL20zCj6EZsk0LtpLyPtyx84s
         ecuJpzF+eXAkJkmak9jDnd8savp/k1Fqcm49cP90LuMEm9VWat5Q6dWhSf6Dm5C23sQx
         7pgc5OwfXidnHc1CLqWsaXR8/4oyxnATZ8svrrTEsDDKWzShwd8JiWqrqPoWmjt3IFn2
         zzs3KifsnBX7iRErbqS8Fj/ydcrKLTnHH7V0zC14LzvNfdleEMODSlYRj306QvFuZJDP
         CG4w==
X-Gm-Message-State: AOAM533YPoEtuHxg3V+m9y+hhmcpIa8+nnKetZ9RVErxgtnB/v+qKKjQ
	EIaaJPdVQBVZU9TtGVwpQXE=
X-Google-Smtp-Source: ABdhPJxxUMVps4Zr+8JbLjrzekWhd1FMxqWLG6CU91v4PGo6av3pY1PrmLW11eVHAE269DrpgpOWBw==
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr7365323ejf.357.1603891879235;
        Wed, 28 Oct 2020 06:31:19 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d7a:200:a915:6596:e9b0:4f60])
        by smtp.gmail.com with ESMTPSA id ce15sm3186691ejc.39.2020.10.28.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 06:31:18 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: David Airlie <airlied@linux.ie>
Cc: Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	clang-built-linux@googlegroups.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] agp: amd64: remove unneeded initialization
Date: Wed, 28 Oct 2020 14:31:06 +0100
Message-Id: <20201028133106.5420-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

make clang-analyzer on x86_64 defconfig caught my attention with:

  drivers/char/agp/amd64-agp.c:336:2: warning: \
  Value stored to 'i' is never read [clang-analyzer-deadcode.DeadStores]
          i = 0;
          ^

Remove this unneeded initialization to make clang-analyzer happy.

Commit a32073bffc65 ("x86_64: Clean and enhance up K8 northbridge access
code") refactored cache_nbs() and introduced this unneeded dead-store
initialization.

As compilers will detect this unneeded assignment and optimize this anyway,
the resulting binary is identical before and after this change.

No functional change. No change in binary code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201028

David, please pick this minor non-urgent clean-up patch.

 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index b40edae32817..0413b3136541 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return -ENODEV;
 
-	i = 0;
 	for (i = 0; i < amd_nb_num(); i++) {
 		struct pci_dev *dev = node_to_amd_nb(i)->misc;
 		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
-- 
2.17.1
