Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.10260.1601816325781557372
 for <linux-safety@lists.elisa.tech>;
 Sun, 04 Oct 2020 05:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CnISbJko;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id u8so8057144ejg.1
        for <linux-safety@lists.elisa.tech>; Sun, 04 Oct 2020 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=PUKRKz2tpvOlgzU6T8LFm9id6xQAJB/MM9M3WUFXc+A=;
        b=CnISbJkoNvxTd5jIBOUlg9+BwkmuM63uKyfAmzazkQPXDTqNIA93w1bVoM2LjX9rcP
         oj8EpHnwqbDa3gONf7UUd83FE/mcIGUXIEphNUeP5ZdvxKQC/Mcqalfel8rl4eeoXDwV
         zzWfgSGtpUbv/hnt60yCzn7DeKx7iEkuhYh1721A9nrnW08qOvQB52N857lNypvzsK77
         8kV5CMdB5GI/65/AwAMlzexf8hxVxeGRw+U8uM/hFEUFHK7L0Gy2xQFXRv84seuGEv3/
         qOrTHwvSxKMwSLLoKZO1agRRV2g2Zqag0ei6n6PbFQ6+QmJvvni0+o59qD1f0MfoTJvi
         Upcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PUKRKz2tpvOlgzU6T8LFm9id6xQAJB/MM9M3WUFXc+A=;
        b=SnJ2F4kwQSfXNvpIai+2JDo2aExRQyv/YnBYP5uVzO8DAiZ4xeN5E8dry0JYjYUFLb
         FNVBKRcZH1ipba/ZT6ONOL323ULYMcfd71FapT4DkORrbSwlHtSIYOTOL8oTiTKzzAg7
         nOpAwmd5dX3ZWfI19P6RZDeGKiET6FgvlCsRMmCkxWXRQ39zK30GUrCd0rpY2Jrk0Y9i
         zgi46wFkjyeDGK4R+fFr1RDbLPLOeppXjB5ZsREAPRp8qoJz4ad54Wh3WVwIk4nC/kBf
         SxbFppErlDfaimGep3iuOK63gCZHXTJpUXVyW7VowhfgT9AcR0CvkHETXBA9AEsn/tyq
         gSTg==
X-Gm-Message-State: AOAM532XA4gwR5yw8Ou1JhCqGo0jn76hKPSVniWTiGIGdVZNkqCDoIrb
	6nFs6w+XulxhhpLDmFele/8=
X-Google-Smtp-Source: ABdhPJxNxrY0nIitVq0DwnUHIuVobxEYUgHoqu1kxAvSNcHLXGtq22k3XIW26iFfBBt4+NxCMI6YUw==
X-Received: by 2002:a17:906:52d1:: with SMTP id w17mr10339057ejn.164.1601816324134;
        Sun, 04 Oct 2020 05:58:44 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d26:f700:59a3:d1dd:4e61:fceb])
        by smtp.gmail.com with ESMTPSA id a10sm2751747edu.78.2020.10.04.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 05:58:43 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Mel Gorman <mgorman@techsingularity.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] mm/vmscan: drop unneeded assignment in kswapd()
Date: Sun,  4 Oct 2020 14:58:27 +0200
Message-Id: <20201004125827.17679-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

The refactoring to kswapd() in commit e716f2eb24de ("mm, vmscan: prevent
kswapd sleeping prematurely due to mismatched classzone_idx") turned an
assignment to reclaim_order into a dead store, as in all further paths,
reclaim_order will be assigned again before it is used.

make clang-analyzer on x86_64 tinyconfig caught my attention with:

  mm/vmscan.c: warning: Although the value stored to 'reclaim_order' is
  used in the enclosing expression, the value is never actually read from
  'reclaim_order' [clang-analyzer-deadcode.DeadStores]

Compilers will detect this unneeded assignment and optimize this anyway.
So, the resulting binary is identical before and after this change.

Simplify the code and remove unneeded assignment to make clang-analyzer
happy.

No functional change. No change in binary code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201002

Mel, please ack.
Andrew, please pick this minor non-urgent clean-up patch.

I quickly confirmed that the binary did not change with this change to the
source code; The hash of mm/vmscan.o remained the same before and after
the change.

So, in my setup:
md5sum mm/vmscan.o
7da4675477f186263e36b726cc2b859d  mm/vmscan.o

linux-safety, please verify and validate this change.

 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 466fc3144fff..130ee40c1255 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3896,7 +3896,7 @@ static int kswapd(void *p)
 					highest_zoneidx);
 
 		/* Read the new order and highest_zoneidx */
-		alloc_order = reclaim_order = READ_ONCE(pgdat->kswapd_order);
+		alloc_order = READ_ONCE(pgdat->kswapd_order);
 		highest_zoneidx = kswapd_highest_zoneidx(pgdat,
 							highest_zoneidx);
 		WRITE_ONCE(pgdat->kswapd_order, 0);
-- 
2.17.1
