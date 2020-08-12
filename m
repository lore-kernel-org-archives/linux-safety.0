Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.722.1597275818978001050
 for <linux-safety@lists.elisa.tech>;
 Wed, 12 Aug 2020 16:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=Ib1uI9uc;
 spf=softfail (domain: mab-labs.com, ip: 209.85.160.195, mailfrom: mab@mab-labs.com)
Received: by mail-qt1-f195.google.com with SMTP id 6so3025091qtt.0
        for <linux-safety@lists.elisa.tech>; Wed, 12 Aug 2020 16:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2W+Ne6fpZJqvksEiJtlwE1HfqOShLsAd1RP2epeNKO4=;
        b=Ib1uI9uc7/PhLTAXUPQ8UxU0UNmf85kTGSsQt7o3VHV7QyhqPMq/9Cbs1ltVjJDRTa
         WMtCRwoOf1GhQGV2sJB7ht7tHkT5fwgeEztzk0JG7xEtxoiB5q6XxPEuQDjGwhOjkypy
         k/T9gR/coq0rnCZMxVvekyG9yJnUrbgXH1A/7OFspmwYkujRBZiY2mk2PvwVKO/jBI53
         5ZWkwS9FjYECF3YUj6BQR/bmUU6yf3fn/MygeCYu55kKXCiDxuxBrLGZT0AkA4gqInHo
         NEGf6oTJAcIVqE8uYVOKC2LnDjaMBm0IiEtGki5TZ6t3nir/4adRvkOPW1nAZm7XJnca
         hvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2W+Ne6fpZJqvksEiJtlwE1HfqOShLsAd1RP2epeNKO4=;
        b=S/JgJK3u5DuE60YTOWo2suXRyM3PVWpOgYMtc5GCwDgxqxTl8kFaniCNs1A6gnaizi
         dEKihG9xqa6tLmOR2VpqJB6VnFeP/xcDS0/pgw9EueLkpuur/iAogJucgMXsq4aPGSNf
         N8QOgWblfQnT1f/mOrgFNpWAzaWIwk09pVGGItj/PlbFdiQrz+QpgxEr0GCdArncKf31
         v6fd0szdexe3kA1HIJ6JhcyJzfuaNXNzxWJKpGJ/UGogVCDjanohyYKEL7IQgUOg2d0y
         kx1fm7Uhf1pxVFAGh6iadoWcG3Vlfpxcb7tCwzkr4NwSdjwf50zfRbntLqo8/Il+wnDi
         4pzA==
X-Gm-Message-State: AOAM533YqiowhJPNZhAXIHJgHe2hFUzNYIeXUGLE7YKeKH/HhoTATq8Y
	cDTn/ikw83M7f289fW56oSyQmusR2p6ZZw==
X-Google-Smtp-Source: ABdhPJxUGjjMJfsWNhRAqrKOgocgdlx8uK72WUZrv7lNgVm0BxpqxsTnLsfXMIkYfGO2cYojLuwbww==
X-Received: by 2002:ac8:7c87:: with SMTP id y7mr2364564qtv.375.1597275817968;
        Wed, 12 Aug 2020 16:43:37 -0700 (PDT)
Return-Path: <mab@mab-labs.com>
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id g55sm4892240qta.94.2020.08.12.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:43:37 -0700 (PDT)
From: "Mohammed Billoo" <mab@mab-labs.com>
To: linux-safety@lists.elisa.tech
Cc: Mohammed Billoo <mab@mab-labs.com>
Subject: [PATCH] coccinelle: misc: Check for hard-coded constants
Date: Wed, 12 Aug 2020 19:43:22 -0400
Message-Id: <20200812234322.32355-1-mab@mab-labs.com>
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

Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
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
