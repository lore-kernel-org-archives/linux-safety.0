Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.728.1597275708014193127
 for <linux-safety@lists.elisa.tech>;
 Wed, 12 Aug 2020 16:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=JUMNI9l0;
 spf=softfail (domain: mab-labs.com, ip: 209.85.160.195, mailfrom: mab@mab-labs.com)
Received: by mail-qt1-f195.google.com with SMTP id o22so2965457qtt.13
        for <linux-safety@lists.elisa.tech>; Wed, 12 Aug 2020 16:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=fbJSzUz1uqHHXYgwjJIHraZsrmd4Ph2XbokVFPdxw6s=;
        b=JUMNI9l0V/6ZuEU3ibCaqjhAHioweSEpxYqcfHqeCnYbpGcfI/p4GVKDXGhuluGk1y
         FWVq3Qt7bU5y7NwkFn1CmVjEbQIsObpoPQzwdObtCGeQ8dA5PLh1Jk2CEjqxNV56YL25
         /MzvIOtxKZuyckrzBZq02Io0AINN1oqqlgME76elBm042DWbPMjWRcWNgQjo3OWAA245
         ceM/2oQJ7r8EKNjpdwqL4PC1aB5O1Pb0WhFUMxu9yNKOH/KsxJMoyqxK71PHxC8UJ81/
         5cy0MWHH4t2VJMn/C+o9CEHKZoOjNoBLr+BgIDyknFxlnpn4rRnvUD7DEV5STq41d2pL
         KYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fbJSzUz1uqHHXYgwjJIHraZsrmd4Ph2XbokVFPdxw6s=;
        b=LmsP/oRAFZIixTa+ELOrt34Wsfarz7Sxq+4Xv1wFD45EhKhZRUpc7C15ixB4rK8EGc
         4QVQh73JAdQIvUDjTNoog/dTFXOdqlYnfRJKHlK0whUPFQX9ytZOyrAAGsQU042Mm7tW
         Ql+j7Lkr2UzPJKaoDAFNRIzM/BqoMUSt4x4O2AUa552NEQm1qlBcGO968s/1KyBK5Apy
         VFL0pgk0nK2KTxnr9stp2ihrZgbi0rBdqbIsJI8PxoIaDTSrgtC+fJthLtej8vqEHgnw
         P0Tb4trwZDdDrZy+6ulxXjZWOBO/ZcEM0xRdiX3tyRW+IOQ1rDXOW+l1bjuutXmndNMB
         b4sw==
X-Gm-Message-State: AOAM530BjFuc2mMZCRvUwpXXK4Gr9Xas35JKWk9yKiZbO0IqxWbCCC+h
	jZ4wzzoB4STHpmdnauPNTdTx6Vgsw0NZxA==
X-Google-Smtp-Source: ABdhPJxdumkiO/Z1ypIGxdi4i8fN9WEhCLgDAAHrLXIGCh5csNi7iRFojGMKB0aMwCntkC4hd9AwyA==
X-Received: by 2002:ac8:65d3:: with SMTP id t19mr2347552qto.193.1597275706986;
        Wed, 12 Aug 2020 16:41:46 -0700 (PDT)
Return-Path: <mab@mab-labs.com>
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id c42sm5008868qte.5.2020.08.12.16.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:41:46 -0700 (PDT)
From: "Mohammed Billoo" <mab@mab-labs.com>
To: linux-safety@lists.elisa.tech
Cc: Mohammed Billoo <mab@mab-labs.com>
Subject: [PATCH] coccinelle: misc: Check for hard-coded constants
Date: Wed, 12 Aug 2020 19:41:29 -0400
Message-Id: <20200812234129.32109-1-mab@mab-labs.com>
X-Mailer: git-send-email 2.17.1

This semantic patch looks for variables that are initialized to
constants, arrays that are both declared and indexed with constants.
A false positive will occur  when a variable is initialized to 0, which
must happen for auto variables. This will be resolved in a future patch.

The patch was tested against the following snippet:

int main()
{
    int iarr[54]; /* instance 1 */
    int j = 0;    /* instance 2 */
    int i = 1;    /* instance 3 */
    iarr[0] = 3;  /* instance 4 */
    return 0;
}

and it correctly identified instances 1, 3, and 4. It incorrectly
identified instance 2, which will be addressed in a future patch.
---
 scripts/coccinelle/misc/magic_numbers.cocci | 45 +++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 scripts/coccinelle/misc/magic_numbers.cocci

diff --git a/scripts/coccinelle/misc/magic_numbers.cocci b/scripts/coccinelle/misc/magic_numbers.cocci
new file mode 100644
index 000000000000..be6df33d28e4
--- /dev/null
+++ b/scripts/coccinelle/misc/magic_numbers.cocci
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Capture and instances of CWE-547 (https://cwe.mitre.org/data/definitions/547.html)
+///
+//# This attempts to capture instances of magic numbers and report them
+
+virtual report
+
+@r1 depends on report@
+type T;
+constant C;
+identifier var;
+position p;
+@@
+* T var@p = C;
+
+@script:python depends on report@
+p << r1.p;
+@@
+coccilib.report.print_report(p[0], "Hard-coded constant, consider using #define")
+
+@r2 depends on report@
+type T;
+identifier var;
+constant C;
+position p;
+@@
+* T var[C];
+
+@script:python depends on report@
+p << r2.p;
+@@
+coccilib.report.print_report(p[0], "Hard-coded constant, consider using #define")
+
+@r3 depends on report@
+type T;
+constant C;
+position p;
+T[] E;
+@@
+* E[C]@p = ... ;
+
+@script:python depends on report@
+p << r3.p;
+@@
+coccilib.report.print_report(p[0], "Hard-coded constant, consider using #define")
-- 
2.17.1
