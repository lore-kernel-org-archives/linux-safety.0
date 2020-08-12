Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.591.1597275323116676502
 for <linux-safety@lists.elisa.tech>;
 Wed, 12 Aug 2020 16:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=UKTY1SO1;
 spf=softfail (domain: mab-labs.com, ip: 209.85.160.196, mailfrom: mab@mab-labs.com)
Received: by mail-qt1-f196.google.com with SMTP id c12so2968265qtn.9
        for <linux-safety@lists.elisa.tech>; Wed, 12 Aug 2020 16:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=fbJSzUz1uqHHXYgwjJIHraZsrmd4Ph2XbokVFPdxw6s=;
        b=UKTY1SO1atQJYhZVoKs+BtVFoExBjGGrxEw47X8NPmcSJKcVZBNAZ3KOAfW8Ccs+YA
         JpPqvFz6xY+a4X9H2FfeMDq+iz/lRkbnuW4HFfj+BoSaxL2NoDhT472G7jNQsCtIUDcH
         +n2FX3fjI5dZ7Mm72HfBYQxDacMCnCqC2j8o/uf22wBe6+3OD6Mx8a+qjmpW03gwKh+X
         /HvgucOLh5xv6AGjlAmafDPKNgHqsEs/55sgHQ5CpbNT+FhGVlUWIB5rkdSOlKtN/zTu
         GQN/VCM7pw1aOXsKtPYV5gNSr5jasArolOjEWyqe6DIzBnoPfCbto9h6rS5R8iutVdMK
         1saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fbJSzUz1uqHHXYgwjJIHraZsrmd4Ph2XbokVFPdxw6s=;
        b=JUDGtaEYUqPfHXajWH9cGvk/T2XWZDxAhOeSNOxU2yQAeboxvL5+c6zfWN2Efr1x8D
         cUVWVYm3FRoi2nJSLcFOL8e0BqkxuYrUhzWc3CZlVnFR51ITFra2akkEKTOQ4KfwWhvW
         +B2iF+XFpHgtJRC4mQDPwFaK1Exvm5TBsesj+d2sbysyw7LVyz2OBps+Ox1cnSn8maol
         JR0aolrIyDr7lehMYLI3vpKUOEwGvUvinQVv2MDSZRi0F4xMUQDR3/DLAAr8FUPV20h9
         n2vThsNqzbO39TcDSldvEuVLt1BgBVLrMvCstHghF4GWJuYDrxgC11ZlMJpOp6ZZEgnn
         4Yjw==
X-Gm-Message-State: AOAM533nVWiLyTCHs5dq3W388f3QZQAjJzqqP92Mf5JytMv7bZnnjSdI
	U8sD4Z/mMMDLVpJtIxtIbM5fr2Sw7DDBMA==
X-Google-Smtp-Source: ABdhPJyqrQcI6AHPqOEumjZ6DtAWWbRPpfcMHUtql6elcZZ8e/VScrD475LKv0Kw+PeK5y2d4btirw==
X-Received: by 2002:ac8:4e4a:: with SMTP id e10mr2260296qtw.315.1597275321971;
        Wed, 12 Aug 2020 16:35:21 -0700 (PDT)
Return-Path: <mab@mab-labs.com>
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id d8sm4373545qtr.12.2020.08.12.16.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:35:21 -0700 (PDT)
From: "Mohammed Billoo" <mab@mab-labs.com>
To: linux-safety@lists.elisa.tech
Cc: Mohammed Billoo <mab@mab-labs.com>
Subject: [PATCH] coccinelle: misc: Check for hard-coded constants
Date: Wed, 12 Aug 2020 19:35:04 -0400
Message-Id: <20200812233504.31666-1-mab@mab-labs.com>
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
