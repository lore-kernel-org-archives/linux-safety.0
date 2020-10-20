Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.1991.1603178426128331770
 for <linux-safety@lists.elisa.tech>;
 Tue, 20 Oct 2020 00:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jDO+X2D4;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id lw21so1158103ejb.6
        for <linux-safety@lists.elisa.tech>; Tue, 20 Oct 2020 00:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8jXuAr65DOhRuAMPpbzy3By/T0TDDihkpH2lnQObzKk=;
        b=jDO+X2D4vgLQkDBVtujN1xiac4FtJPsg7OY+E8pSepAInZNT1ip+2LbG/cCryPpu/l
         xGKQ4Dy8M0vs/rGNePtgHorT/KizYRi/9VxnwMUx7DFCxWPohWaDoP5hQQeUHE1GcM5e
         5jqaUiQysiBPGvAzqXKV2WIQhSeGYmyXbWafQ283HDgHbGstAe9404BbKT+pA+5Fjyjl
         elGE4JH2c/57He6IkNu21HginNhEfdxlVm2/OKxeVDDg6A7TMzENkgSvhogOdw8TUH8l
         kREeYnBGCXbJRAQoqvcoAEzPbMi72K4rvHFhZHk/EElwdBVissS5CdmNj2I32w0HRtaa
         DViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8jXuAr65DOhRuAMPpbzy3By/T0TDDihkpH2lnQObzKk=;
        b=eILrhWKKR/zqhDdNQrEw9qtiPHasVJoZN4FOOmiAMhdS9HOQrAFc7wL3oA4LdmDEIm
         4yWxCO8CUCI3c2+7wZj8NhrT9CcVkf+AOkb989tG3ScZXfaJJeogvq0Q94p9NAURuV8A
         rO+K8FBBNmsHF7seRvLFgx3cB9jWIRcvCR/D9V6qzz+YDbB1C3i1G0d0EpIZBZhZJj6X
         MYG/6PyQ7otR7YhS5YEhMOkTMp111SdfkqzZAHZb7WoLOBgaXXHj75SSrCavqlj6nT7g
         VdQzAUSBNXgYXwjQUTpa8Tt/4eGWSN+VR4WIGZGJY0169E/hH7uUI4XRIT+KIMII0vkc
         dbIA==
X-Gm-Message-State: AOAM531hHk9mDoiIEnBflbsKVc6WWo9CXUAbuSEIUXyf1MZa8bTCV/8G
	/8fKR6vz5XsbsNJNNMAVMhvo4KRX8/Mxqw==
X-Google-Smtp-Source: ABdhPJydqzfgN5EO32TY0mYzI2xBrpydyBlUUTGVrQalc0nN7Y5ym1xTfho8/SFBzatKvvcjJg0HOw==
X-Received: by 2002:a17:906:53d7:: with SMTP id p23mr1754116ejo.232.1603178424292;
        Tue, 20 Oct 2020 00:20:24 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2dd3:b700:c155:8ea0:c27b:610a])
        by smtp.gmail.com with ESMTPSA id qq10sm1391999ejb.31.2020.10.20.00.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 00:20:23 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] x86/unwind: remove unneeded initialization
Date: Tue, 20 Oct 2020 09:19:52 +0200
Message-Id: <20201020071952.23794-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

make clang-analyzer on x86_64 defconfig caught my attention with:

  arch/x86/kernel/unwind_orc.c:38:7: warning: Value stored to 'mid' during
  its initialization is never read [clang-analyzer-deadcode.DeadStores]
          int *mid = first, *found = first;
               ^

Commit ee9f8fce9964 ("x86/unwind: Add the ORC unwinder") introduced
__orc_find() with this unneeded dead-store initialization.

Put the variable in local scope and initialize only once the value is
needed to make clang-analyzer happy.

As compilers will detect these unneeded assignments and optimize this
anyway, the resulting object code is effectively identical before and
after this change.

No functional change. Effectively, no change to object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/x86/kernel/unwind_orc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 6a339ce328e0..5c64eed08257 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -35,7 +35,7 @@ static struct orc_entry *__orc_find(int *ip_table, struct orc_entry *u_table,
 {
 	int *first = ip_table;
 	int *last = ip_table + num_entries - 1;
-	int *mid = first, *found = first;
+	int *found = first;
 
 	if (!num_entries)
 		return NULL;
@@ -47,7 +47,7 @@ static struct orc_entry *__orc_find(int *ip_table, struct orc_entry *u_table,
 	 * ignored when they conflict with a real entry.
 	 */
 	while (first <= last) {
-		mid = first + ((last - first) / 2);
+		int *mid = first + ((last - first) / 2);
 
 		if (orc_ip(mid) <= ip) {
 			found = mid;
-- 
2.17.1
