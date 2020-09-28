Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.33050.1601287215459371617
 for <linux-safety@lists.elisa.tech>;
 Mon, 28 Sep 2020 03:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R+pfU0To;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id i1so640443edv.2
        for <linux-safety@lists.elisa.tech>; Mon, 28 Sep 2020 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SDDq2C7QLWNFyYFepbxAMacpxOBVCHMbzny/kHBr8TA=;
        b=R+pfU0Towmle8RJu/D2uVB6nF3nenvlxVFjiSEvSkMiG2Jlx3yvjSATbQ8+uGNBHHC
         /hxaVJSDGW/iXOGt0AzwAPlvP3FQWFp7uRePLRzNFXLrjI0cUmxzmB/Yo4f7rU2w/PgF
         QZZNVcmw/iC5SfxzSz2omZ3VEyF9P6mf8kLWBPl9DmsXVXIn00jKeEf2rX03yd0uCEhx
         cbYV3TC7vuKlE6QYK63WE8mIThW1ugvgD3GoYFnmga8LP66ybx8Bj4VvIj9Td0U8GFtB
         Lo3a8nFWXq4UkVdkgbsrgexuhXTY65G8VOE+r0bL/pwSau4c2qfKMF3pZa37/VqccADC
         1MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SDDq2C7QLWNFyYFepbxAMacpxOBVCHMbzny/kHBr8TA=;
        b=BJZKXzWTiy7P4FMvZ1VFwF+t8IuIH7yCv/P8QwXoFm5aZ7x6H2m4M7ZoleOpKkSEDA
         oZ1obNaJVFahznMGtUrni6R5rVmOsS1kIGvYR/AYNInWnFud0cnvKZyvIuXBhMCPrfkp
         EiLYmps8c1SP5ws9YK5KRFI/+n/AWamGyhjNXrtznGNPAJhYgm/ckn2FMvPZ0bVGMqbU
         /nyJoB/dyVjK9a6/sgGKrc1bOZHx1+sIGCp3GrCfLbzb/8zMktOFc/Oy7SGDdlqn92zn
         rVmnjtZlbmSXyImRJ3zsY32P0g/r+I9Qo7QbibQsS/AAkl98rwc3FVssbqir889Dp/f2
         vgaw==
X-Gm-Message-State: AOAM532wM1ia+lFmJa33h/QMEgPSzki6xATcsReXsjS2khexjzC4o2m4
	6LTrfiSde4mG/eBHub+smOE=
X-Google-Smtp-Source: ABdhPJzlWRLg1EMg817RKK+Ds6y/qvJKdNZ7zwAaJGbykb2KswiX5HBOGUqqOfFCatcJ6+iB3eFoOQ==
X-Received: by 2002:a05:6402:1d93:: with SMTP id dk19mr800943edb.198.1601287213821;
        Mon, 28 Sep 2020 03:00:13 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d9d:5000:7872:7299:adfa:b749])
        by smtp.gmail.com with ESMTPSA id m10sm921048edf.11.2020.09.28.03.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:00:13 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] x86/mm: drop superfluous initialization
Date: Mon, 28 Sep 2020 12:00:04 +0200
Message-Id: <20200928100004.25674-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

It is not required to initialize the local variable start in
memory_map_top_down(), as the variable will be initialized in any path
before it is used.

make clang-analyzer on x86_64 tinyconfig reports:

  arch/x86/mm/init.c:612:15: warning: Although the value stored to 'start' \
  is used in the enclosing expression, the value is never actually read \
  from 'start' [clang-analyzer-deadcode.DeadStores]

Compilers will detect this superfluous assignment and optimize that
expression anyway. So, the resulting binary is identical before and after
the change.

Drop this superfluous assignment to make clang-analyzer happy.

No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.9-rc7 and next-20200925

Dave, Andy, Peter, please pick this minor non-urgent clean-up patch.

I quickly confirmed that the binary did not change with this change to the
source code; the hash of init.o remained the same before and after the change.

So, in my setup:
  md5sum arch/x86/mm/init.o
  b26f6380760f32d2ef2c7525301eebd3  init.o

linux-safety, please verify and validate this change.

 arch/x86/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index c7a47603537f..5632f02146ca 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -609,7 +609,7 @@ static void __init memory_map_top_down(unsigned long map_start,
 	step_size = PMD_SIZE;
 	max_pfn_mapped = 0; /* will get exact value next */
 	min_pfn_mapped = real_end >> PAGE_SHIFT;
-	last_start = start = real_end;
+	last_start = real_end;
 
 	/*
 	 * We start from the top (end of memory) and go to the bottom.
-- 
2.17.1
