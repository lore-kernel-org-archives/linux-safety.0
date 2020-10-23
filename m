Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web08.2569.1603484829654615385
 for <linux-safety@lists.elisa.tech>;
 Fri, 23 Oct 2020 13:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ru2WmXXr;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id h5so3635900wrv.7
        for <linux-safety@lists.elisa.tech>; Fri, 23 Oct 2020 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Xtrn75nR84HkAz060+uU5QF9Ur8eI5hya7PCx1sILkk=;
        b=Ru2WmXXrzsf/Sz2noXOssWTOlBTFTYWpaXGV3E5qQ+6UOiOIoUCxDcpuJGpZDNb3dU
         xXIGk/cQpUnRREbuQzbLrqylJPAx8TMjYG1ltmSUURrIvsPtJL/CgN9AUse1D/VsCsUH
         FBImQWcMQoVqacpm42aTwUgHsIdX1gFtRv6ShGgB2DechT6MHVcGjJtZdrAb4fW8uGjl
         EcqkEVH5UT1qtGeYHgku/iJtZD4jIjWewMlt7yIv16YSsb7YLzAWkhorcJQYpLHeDDmd
         FLVgCVohlUwg/jktEGM8P7Rbxhv/LwPuRT5423V3WgMhjvAKluXTslaqPbZyCzugB57S
         TYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Xtrn75nR84HkAz060+uU5QF9Ur8eI5hya7PCx1sILkk=;
        b=UlwM0DQPlJ5ClUgXr0xIKbTuWeqWdwM2DrD3jJWS3tGDy6jyj+nLiDiEMEZcvPD17J
         ++0Q6IJVn4wAhFCj8djeTwa4J8GnGfsXRoCi9pM5ASwkGvzNdwBaUWsgtgC4nvImrltJ
         qYHjhVHlrGp2RvOIzqrB9pDiSeDBZCkE0nPKVL9bzuTkzXkUcMCBeFKLXN5bU9O9GhcF
         gaaqdc1kJ0/FzrIJzbnvm/vnPCdQxWHPPvRvRjsjN1RchXnROgPDt411JDkCbKBPscJT
         hteguXWGYiujnCfl0B7i2P64sUKVotFu5S9itnu+vB1u5BLYSdJSz1cJPPcSu4o1RoU/
         IqNQ==
X-Gm-Message-State: AOAM532dpuIDtNCEx4yQJC06a8AAktu/r7/7kcPBdoieqCaA2+GlFzpD
	1yVAspD0yCte/4w/88b4Wf0sjky9EoSYEQ==
X-Google-Smtp-Source: ABdhPJyttmPUYZWfEcUUJwQQK0/KN/H49rNBfGHAbmmQcJHQPgDvFAdo8DDry+TCCMwWLQ3fjvYGig==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr4170705wro.381.1603484827730;
        Fri, 23 Oct 2020 13:27:07 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d20:a600:91f0:3b46:85c0:ebc7])
        by smtp.gmail.com with ESMTPSA id j13sm5316811wru.86.2020.10.23.13.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 13:27:07 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] agp: amd64: remove unneeded initialization
Date: Fri, 23 Oct 2020 22:26:58 +0200
Message-Id: <20201023202658.11205-1-lukas.bulwahn@gmail.com>
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
