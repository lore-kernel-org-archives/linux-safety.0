Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web09.7055.1604634020317183499
 for <linux-safety@lists.elisa.tech>;
 Thu, 05 Nov 2020 19:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G2sPbaKV;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id k3so5698891ejj.10
        for <linux-safety@lists.elisa.tech>; Thu, 05 Nov 2020 19:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=v31c+3qUzm/Jl9mhtRELjufMUcxhfj6Qpk0Egg0rkIc=;
        b=G2sPbaKVWlctWWt9dQqnUUZ26kWvTx4lqpzkKvDn9D1DxhleQxkvLOaOHnbPnk3raT
         Lk7PdtiqqtRFkDpPM2JXWduU85jDrg8SZreWZlATMqd6zdcLaz9YfcKnq7bEGGA+m9cX
         8Oz+j9tVEk9imS/i1TzoJ0qXuejfUX/yDNMCKzUwGWr58yJWgUTUfe9hp5NueEa+RI+Y
         6gaq/n+nbQqqV2c7zT3zd3ZZmmU9CYkeTmw9KfZYMsomje/mKrNiMdHr/4c3Kgl4RCWC
         bzLptOP6jsqvjY2KAAtprDXXZqNIVxX7p8Mpl0josoGZXcroSDGO+j5lCF40P9Qmte1l
         qniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=v31c+3qUzm/Jl9mhtRELjufMUcxhfj6Qpk0Egg0rkIc=;
        b=Q3fB/19Nqxk/6Ri+R3yZSBeAjRYhfBAWxRJOwK2+o0FPVMLYXQlh/DQ+Tr7pAjw4rY
         ybPZN5sT6ry+LlSK/2C2Gv2ktu9a9A89EqZJNm+HdqAMxqDRPIzT2cqkDd8qN9H/XKYy
         zR3I8nKz2RwsRpVbHiN/cI+VuUUFMN1O8+Emw55l6vt+lAeXBCLbHw54fJAdhVIp5kdZ
         L3SyR90v13sx77vCFNCtHgFTMz7kR7+5wb8xEmKQm/U+c9VsS6OyDhxXKYTQVyBnfEQz
         oojCpkbpfeD48mIA88i8slSMoQP0WXTPtrSrZZZjFgmCWPoRKETdVvwNXOXLDaUPoIAS
         m1Ww==
X-Gm-Message-State: AOAM5338i8GKSg2sPz1rdsNSaH2cY/cj4TJFqHPXhBMbHJ9PwDuhDxaf
	k31ls0FwRxl8qBFgP9omryU=
X-Google-Smtp-Source: ABdhPJxdlgrDr75OUdeerY4h/FD+9Z7XvLQL8XO5mZ2NUVm/pGUpKmrXgCq2czkobGG4KNQiERvrOA==
X-Received: by 2002:a17:906:6a57:: with SMTP id n23mr55277ejs.315.1604634018857;
        Thu, 05 Nov 2020 19:40:18 -0800 (PST)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d20:9d00:b87b:b644:61a3:6870])
        by smtp.gmail.com with ESMTPSA id z23sm2103337ejb.4.2020.11.05.19.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 19:40:18 -0800 (PST)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>
Cc: Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] printk: remove unneeded dead-store assignment
Date: Fri,  6 Nov 2020 04:40:05 +0100
Message-Id: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

make clang-analyzer on x86_64 defconfig caught my attention with:

  kernel/printk/printk_ringbuffer.c:885:3: warning:
  Value stored to 'desc' is never read [clang-analyzer-deadcode.DeadStores]
                desc = to_desc(desc_ring, head_id);
                ^

Commit b6cf8b3f3312 ("printk: add lockless ringbuffer") introduced
desc_reserve() with this unneeded dead-store assignment.

As discussed with John Ogness privately, this is probably just some minor
left-over from previous iterations of the ringbuffer implementation. So,
simply remove this unneeded dead assignment to make clang-analyzer happy.

As compilers will detect this unneeded assignment and optimize this anyway,
the resulting object code is identical before and after this change.

No functional change. No change to object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201105

John, please ack.
Petr, please pick this minor non-urgent clean-up patch.

 kernel/printk/printk_ringbuffer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 6b1525685277..74e25a1704f2 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -882,8 +882,6 @@ static bool desc_reserve(struct printk_ringbuffer *rb, unsigned long *id_out)
 	head_id = atomic_long_read(&desc_ring->head_id); /* LMM(desc_reserve:A) */
 
 	do {
-		desc = to_desc(desc_ring, head_id);
-
 		id = DESC_ID(head_id + 1);
 		id_prev_wrap = DESC_ID_PREV_WRAP(desc_ring, id);
 
-- 
2.17.1
