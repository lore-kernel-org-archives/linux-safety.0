Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.21201.1598541284258699070
 for <linux-safety@lists.elisa.tech>;
 Thu, 27 Aug 2020 08:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=CNQjogUd;
 spf=softfail (domain: mab-labs.com, ip: 209.85.219.66, mailfrom: mab@mab-labs.com)
Received: by mail-qv1-f66.google.com with SMTP id x6so2752410qvr.8
        for <linux-safety@lists.elisa.tech>; Thu, 27 Aug 2020 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=UXdxuDmOa/tZfbw7uvtlwco1u3DmywYQNnhUDX1enSM=;
        b=CNQjogUdxN//uV++U9TRRBRjHe8wJOIpz6XVVXjmzrBCJDu/U6Gpx15TKXNHE/lIR7
         ohKVv/ZHkC92flC3xXCgebhb8B/01pxjyp3nLl63lcXdiy99HRxtbTx/uqByJqYAkIgc
         O1Gk0FfRu1DUWcbb3sMZ9zZ0FAC+EVwKy0p5jcnRfzNR5E72IFccAinv9QxKl2iM2rpW
         HRX70sS5kfSfxBhbhO6m09GDMftPLrFIf2qRmv7J8/BuVKpiryNVoSMj/EpGO5yNmqmc
         jK3k0tSCm7GozjcRfsctFofGKkRffWDky7scCqLdF4Mt0z8rqpJbwpf6BiIdneXCUAx3
         5G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UXdxuDmOa/tZfbw7uvtlwco1u3DmywYQNnhUDX1enSM=;
        b=NCVTeyLPgLDSpEDgWdVos3GsyGCLCs2RsooiVtT/fCW/8woy3ZOw7SnyPYGgH31RAA
         TsjNMSKn1dxCcPHeD0PTNPnPzNUI78yZOeVI8n2jZ4O2Y3OYz8ODmw9GQBvnPTfnm64M
         /w60fsKmTRoyPMkDIRQMcl+iVYuQ3v9YURJpD8USP970fVc9eLLRHuVldWGXVow5Vqxg
         Nv4VwoBnX5ZLQTz1HtWute8vyCvXTwK0zBBPAZACa4yyWURgyIkjm+zEfxFvNmo6snkU
         NlB5+eCh9AX/50AcM1Csn0t9/3oTYHBoIIYyCmU6jXxtgnJlFHEiPjssvmCusARn1cZh
         5d2Q==
X-Gm-Message-State: AOAM533KgoVYXaMY7ry8aiLG7WG8d7mn6/mmOVcGVq3K28mWngqmDQPh
	Bdn8AIRXaQdCWmDBOs34pZqPdkjsu7ukUqOS
X-Google-Smtp-Source: ABdhPJzREGUM2/WzTNJZCwlSjdjUz1V8NHvT+VgZ/g9OuhjVp9Wv9IcsG8MVznxzNGFo6rbf4ThJMQ==
X-Received: by 2002:a0c:cd02:: with SMTP id b2mr18945586qvm.150.1598541283099;
        Thu, 27 Aug 2020 08:14:43 -0700 (PDT)
Return-Path: <mab@mab-labs.com>
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id w27sm1931122qtv.68.2020.08.27.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 08:14:42 -0700 (PDT)
From: "Mohammed Billoo" <mab@mab-labs.com>
To: linux-safety@lists.elisa.tech
Cc: skhan@linuxfoundation.org,
	Mohammed Billoo <mab@mab-labs.com>
Subject: [PATCH] scripts: Report 'suspicious' comments
Date: Thu, 27 Aug 2020 11:13:33 -0400
Message-Id: <20200827151333.11591-1-mab@mab-labs.com>
X-Mailer: git-send-email 2.17.1

This perl script attempts to mitigate CWE-546
(https://cwe.mitre.org/data/definitions/546.html), which identifies code
with comments that suggest that code is incomplete. This script was
tested against the kernel, and the following is a snippet of the
output that was generated. The output was verified by confirming that
the specified file does indeed have that string at the specified line.

./arch/arm/include/asm/pgtable.h contains FIXME on line 316
./arch/arm/include/debug/imx.S contains FIXME on line 14
./arch/arm/kernel/entry-header.S contains BUG on line 71
./arch/arm/kernel/fiq.c contains FIXME on line 72

Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
---
 Makefile                |  8 +++++++-
 scripts/checkcomment.pl | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 scripts/checkcomment.pl

diff --git a/Makefile b/Makefile
index f21168154160..c84b8bc5c18e 100644
--- a/Makefile
+++ b/Makefile
@@ -264,7 +264,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile
+			 outputmakefile commentcheck
 no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
 
@@ -1575,6 +1575,7 @@ help:
 	@echo  '  export_report   - List the usages of all exported symbols'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
+	@echo  '  commentcheck    - Check and report suspicious comments'
 	@echo  ''
 	@echo  'Tools:'
 	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
@@ -1842,6 +1843,11 @@ versioncheck:
 		-name '*.[hcS]' -type f -print | sort \
 		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
 
+commentcheck:
+	find $(srctree)/* $(RCS_FIND_IGNORE) \
+		-name '*.[hcS]' -type f -print | sort \
+		| xargs $(PERL) -w $(srctree)/scripts/checkcomment.pl
+
 coccicheck:
 	$(Q)$(BASH) $(srctree)/scripts/$@
 
diff --git a/scripts/checkcomment.pl b/scripts/checkcomment.pl
new file mode 100644
index 000000000000..22fd77bc75d1
--- /dev/null
+++ b/scripts/checkcomment.pl
@@ -0,0 +1,35 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+#
+# (c) 2020, Mohammed Billoo (mab@mab-labs.com)
+#
+# This script checks for any keywords outlined in CWE-546
+# (https://cwe.mitre.org/data/definitions/546.html)
+# and simply reports them to the user. It's up to the user
+# to take any further actions.
+
+use strict;
+
+my @keywords = ('TODO', 'BUG', 'FIXME', 'HACK');
+my @mismatch_keywords = ('BUG\(\)');
+
+foreach my $file (@ARGV) {
+	my $i = 1;
+	open(my $f, '<', $file)
+		or die "Cannot open $file: $!\n";
+
+	while (my $line = <$f>) {
+		foreach my $keyword (@keywords) {
+			if ($line =~ /\b$keyword\b/) {
+				foreach my $mismatch_keyword (@mismatch_keywords) {
+					if ($line =~ /$mismatch_keyword/) {}
+					else {
+						print "$file contains $keyword on line $i\n";
+					}
+				}
+			}
+		}
+
+		$i++;
+	}
+}
-- 
2.17.1
