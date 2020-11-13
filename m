Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.1413.1605255186846113310
 for <linux-safety@lists.elisa.tech>;
 Fri, 13 Nov 2020 00:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a0MVam7p;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id i19so12031194ejx.9
        for <linux-safety@lists.elisa.tech>; Fri, 13 Nov 2020 00:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UjUFjlo+lUVXh8aCv+mLF8td/QwZTXfYmMYnlYnHUQY=;
        b=a0MVam7prtCppJVUx7x8/S5UjN0gVePh0iKNlHZpI5aYqnWk0lwk34/fQSR55nCvKZ
         svaJIKfrPmDxNw26TVSO3n/8PZj2dmNHXT7c+pP0Uo0NnVR7pXWlIRhw5q4uRwAh/d8q
         v3yyoaAq18OfnHt2qdMouaMcSDDQDrY4Rb42f6woKXLLGjcBhZG+XVyx1EA2DpuGeX78
         JFPTCwcTrUA4YqR8EqDnkHdq93RK9ALQF9cD3pJyRlApSyjpFoB4e5wlzjh0wtv6YsGC
         fzKpE61vIe6tDyUOoFhbLIQgXFCdMePK1fueDfudymqH50J87CIIvxH7NKeY4WcvBqQU
         vpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UjUFjlo+lUVXh8aCv+mLF8td/QwZTXfYmMYnlYnHUQY=;
        b=lE4QFxab86Er/Rz4VRU1xvZgaebAuAJh8L3IibvWBh+ZwEDPLHr8Ix0liANmeP22Tp
         8zEqOkuZ4Zi2bya6ur1NNVMJJeiqkbcFczRTxMNUka0qOQxbepo4BVn6RaOXpZb2msTR
         7OXhI6wkL8vHtBjtihjROhTPqISSUih25ImG2MOXZVm/qwa3KQJyVoAf4BV12yknt6q8
         dxzi/M5SjKxMtz9+pZ7E96wYn22Wv6Q7Ygsws98MgnEkKr/pSnrzkbCsk+uJVUuEHh5W
         mwqDX9TU3nf23l5lalsBaAOEPR9jtwFz6Ol5V1R5Kprr74txz2JvoJBwZvn2yGIyxXvU
         Hl5w==
X-Gm-Message-State: AOAM532j2Ef/punkzYn+WSXUgmGnPzo3GSyxty+WzTcLUM4djNOnwO8j
	tdOEssxjWiFdsyQzB1LOnv4=
X-Google-Smtp-Source: ABdhPJzYr0uqqkZpmU5AkBmZGruoS+wNbzoXwSoxwwYoPZUxVaKF/+NbFzed2xC0HWR9bTAVkLD3BQ==
X-Received: by 2002:a17:906:3d1:: with SMTP id c17mr838007eja.187.1605255185182;
        Fri, 13 Nov 2020 00:13:05 -0800 (PST)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2de6:6700:5d16:c2b3:483:ff70])
        by smtp.gmail.com with ESMTPSA id n25sm3075936ejd.114.2020.11.13.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 00:13:04 -0800 (PST)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	dmaengine@vger.kernel.org
Cc: Tom Rix <trix@redhat.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] dmaengine: ioatdma: remove unused function missed during dma_v2 removal
Date: Fri, 13 Nov 2020 09:12:48 +0100
Message-Id: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit 7f832645d0e5 ("dmaengine: ioatdma: remove ioatdma v2 registration")
missed to remove dca2_tag_map_valid() during its removal. Hence, since
then, dca2_tag_map_valid() is unused and make CC=clang W=1 warns:

  drivers/dma/ioat/dca.c:44:19:
    warning: unused function 'dca2_tag_map_valid' [-Wunused-function]

So, remove this unused function and get rid of a -Wused-function warning.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201112

Maciej, please ack.

Vinod, Dan, please pick this minor non-urgent clean-up patch.

 drivers/dma/ioat/dca.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
index 0be385587c4c..289c59ed74b9 100644
--- a/drivers/dma/ioat/dca.c
+++ b/drivers/dma/ioat/dca.c
@@ -40,16 +40,6 @@
 #define DCA2_TAG_MAP_BYTE3 0x82
 #define DCA2_TAG_MAP_BYTE4 0x82
 
-/* verify if tag map matches expected values */
-static inline int dca2_tag_map_valid(u8 *tag_map)
-{
-	return ((tag_map[0] == DCA2_TAG_MAP_BYTE0) &&
-		(tag_map[1] == DCA2_TAG_MAP_BYTE1) &&
-		(tag_map[2] == DCA2_TAG_MAP_BYTE2) &&
-		(tag_map[3] == DCA2_TAG_MAP_BYTE3) &&
-		(tag_map[4] == DCA2_TAG_MAP_BYTE4));
-}
-
 /*
  * "Legacy" DCA systems do not implement the DCA register set in the
  * I/OAT device.  Software needs direct support for their tag mappings.
-- 
2.17.1
