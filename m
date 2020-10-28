Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web09.7938.1603887684349177386
 for <linux-safety@lists.elisa.tech>;
 Wed, 28 Oct 2020 05:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z2ndfn5j;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id l8so2897268wmg.3
        for <linux-safety@lists.elisa.tech>; Wed, 28 Oct 2020 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=A0oVWK/PD/2SiJZrfVFOxqFlp4+JetaKuHdDt62eT5Y=;
        b=Z2ndfn5j7k7+QMJwNsAEGZoaEYBos7I7MqRDzTDgT+C7OVFtal3as/fuFyGorI6nbb
         W2o6iKwFFEhVR4Im417Q9EjZdKs5jB5qpUZQU515sVhglsK5zxhUZ67WyCWhpXQlOWNo
         1lStxvC2TvAHkEzniUcXmIkBZg1TUKaAHNP5zBG0WmmnArYSSMYDXJLJ9Qk0TbtzdLqc
         D2NfPZel85LMUvnpNFHJxRMtIwNJCwOD2XSus1YUoh18+8H+FKZNhQAmQa4mJdV0tOgI
         gjIHXbG8W9OSqe9k4qtt7239j1F9Z0bmTGLCMXO+owZhGHNG9er6XDOKx0p3VI7ZVVQr
         I2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=A0oVWK/PD/2SiJZrfVFOxqFlp4+JetaKuHdDt62eT5Y=;
        b=OsA2mm7RDtYP0pBsxqQbcFnFt3mcS5JUPCnrycLJ2pqwr8NH8cXepeiU6F3lIKgWHG
         V5YHUmCyILY6qmA8CMsAdq4b04Cqc9xrM5g4jadfRpJnZTXmEgosa+K9tV2YREP3uftj
         IPGV+qAONbW+obVOgVyBNz5x6+b2sMzXIv9pzLklzMhpM4JoGoD7Xta2oe0RJHoTNZPb
         4ndaMa6qyhaNRBfGv5UQtl6I93DAGLheauAQIDfGbD1KfAm7NfVKwDOVjck7NmFDVAsy
         IdtwaUf8CPsHnLYC4PDLnUkilCIfK3/HmicFUuxeVB4G4dYimTNFYC6V95wDa6VzYYhy
         Vk6g==
X-Gm-Message-State: AOAM530QnoDKzDR/WPNS9anYYIMlIuTUiZ8rFxUbJk1m6L7RUix259Zo
	NTOfbstxHvrVoLquPZyV8zg=
X-Google-Smtp-Source: ABdhPJyaRHfb5LCfX2Rq7KACTz6umOsO5aK3fujyrp10owGv38bNI8BTsGvajv1jEuk9xmUB2K/Xsg==
X-Received: by 2002:a1c:bdc4:: with SMTP id n187mr8303423wmf.185.1603887682784;
        Wed, 28 Oct 2020 05:21:22 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d7a:200:a915:6596:e9b0:4f60])
        by smtp.gmail.com with ESMTPSA id c1sm6783945wru.49.2020.10.28.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 05:21:22 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] x86/unwind: remove unneeded initialization
Date: Wed, 28 Oct 2020 13:21:02 +0100
Message-Id: <20201028122102.24202-1-lukas.bulwahn@gmail.com>
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

As compilers will detect this unneeded assignment and optimize this
anyway, the resulting object code is effectively identical before and
after this change.

No functional change. Effectively, no change to object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201028

Josh, please ack.
Ingo, Borislav, please pick this minor non-urgent clean-up patch.

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
