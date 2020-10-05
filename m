Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.29088.1601881137147402224
 for <linux-safety@lists.elisa.tech>;
 Sun, 04 Oct 2020 23:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mJKhyuUp;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id k14so8074159edo.1
        for <linux-safety@lists.elisa.tech>; Sun, 04 Oct 2020 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=gRVfMn1y3J1C+vGuMZF2LipjcOOXpjH1BPs85qkeY9I=;
        b=mJKhyuUpK1czGMhr3NIrmOT1aqCSpfTCVHRLKrrKneUrmoSvr9uQMBqETyYeNoea+U
         IeK0JjiPdhyJxJetWUGZ5zAqvuNnkEP584WnevYsaklihWJVxY+3h9kS7nHTHc+P8PHp
         vYxA/ZSzphHvZwIQzVLyMypYaWBL2sVQdIP2Ugd1nZSflP8DnoqvJ/s20hjdy5Yt94L4
         Sh/jrVpidiEAS4OPFTM1SfwILy75ZxYh+W6Xo/dCTS/rqLAKv6EmJ+lTedfOJ7gBnVaR
         D+l2Yr5RUEpVAoAGnLy0UhmFRK6lVzXqZS4X3740EQAKkVn6Q+yNzH5OcVje6JdQHbEr
         A7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=gRVfMn1y3J1C+vGuMZF2LipjcOOXpjH1BPs85qkeY9I=;
        b=nZ4RoN50NlYkuUGnn85bt0spx8lSMdddb6Lw+GjhLdwZbDuH28IRo+v3uugv4a1cVo
         jDuAXieB+qsya1zMIIHlVhbzCdxCbiA1SWfQQ+mYfD25rYk7R3CJ2VCa9R8Jzn4hlGRh
         XpnpqYG864T0GLdNNDEsKcVVyDa7MWxRdcFVXaRn2RjeEKK4KuSY4MVN2VSow44rBu3K
         zFfCgRQUU3pggxEppCU8Lq0L/E0Y+Hi0p2kGwNNvfD65nhlHUGNLFX8ZbNx0fxYVpH1s
         YonTKWEEEMkF/gUmfFcu94BT+7Nq7iGf7w/fKR7NeQj5zkv7cZ/tQe5oglYqjpaJ7suR
         YnYg==
X-Gm-Message-State: AOAM530lImOe1suRVP+Qzi0XLT/e4oe077/TFxl8m/m9YH4xtH16+up1
	Qrd4XX7l8mMuhbF/XAcPtfQ=
X-Google-Smtp-Source: ABdhPJzoG44HkP0BJW9eFlGS3ah1NuoR/b/9sdRFfTA7f/mr7xp3yJ8sldhhlKCyJmpnepeMNEGJkQ==
X-Received: by 2002:aa7:d690:: with SMTP id d16mr7880545edr.301.1601881135466;
        Sun, 04 Oct 2020 23:58:55 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2dcc:7300:fc41:427:81ae:8ef0])
        by smtp.gmail.com with ESMTPSA id a13sm200597edx.53.2020.10.04.23.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 23:58:54 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 5 Oct 2020 08:58:53 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mel Gorman <mgorman@techsingularity.net>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
    Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, 
    Nathan Chancellor <natechancellor@gmail.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
    clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, 
    linux-safety@lists.elisa.tech
Subject: Re: [PATCH] mm/vmscan: drop unneeded assignment in kswapd()
In-Reply-To: <20201004192437.GF3227@techsingularity.net>
Message-ID: <alpine.DEB.2.21.2010050831010.6202@felia>
References: <20201004125827.17679-1-lukas.bulwahn@gmail.com> <20201004192437.GF3227@techsingularity.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 4 Oct 2020, Mel Gorman wrote:

> On Sun, Oct 04, 2020 at 02:58:27PM +0200, Lukas Bulwahn wrote:
> > The refactoring to kswapd() in commit e716f2eb24de ("mm, vmscan: prevent
> > kswapd sleeping prematurely due to mismatched classzone_idx") turned an
> > assignment to reclaim_order into a dead store, as in all further paths,
> > reclaim_order will be assigned again before it is used.
> > 
> > make clang-analyzer on x86_64 tinyconfig caught my attention with:
> > 
> >   mm/vmscan.c: warning: Although the value stored to 'reclaim_order' is
> >   used in the enclosing expression, the value is never actually read from
> >   'reclaim_order' [clang-analyzer-deadcode.DeadStores]
> > 
> > Compilers will detect this unneeded assignment and optimize this anyway.
> > So, the resulting binary is identical before and after this change.
> > 
> > Simplify the code and remove unneeded assignment to make clang-analyzer
> > happy.
> > 
> > No functional change. No change in binary code.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> I'm not really keen on this. With the patch, reclaim_order can be passed
> uninitialised to kswapd_try_to_sleep. While a sufficiently smart
> compiler might be able to optimise how reclaim_order is used, it's not
> guaranteed either. Similarly, a change in kswapd_try_to_sleep and its
> called functions could rely on reclaim_order being a valid value and
> then introduce a subtle bug.
>

Just for my own understanding:

How would you see reclaim_order being passed unitialised to 
kswapd_try_to_sleep?

From kswapd() entry, any path must reach the line

  alloc_order = reclaim_order = READ_ONCE(pgdat->kswapd_order);

before kswap_try_to_sleep(...).

Then it reads back the order into alloc_order and reclaim_order
and resets pgdat->kswapd to 0.
I argue that the second store to reclaim_order is not used.

Path kthread_should_stop() is true:
Then, it either exits and does not use those temporary values, 
reclaim_order and alloc_order, at all.

Path try_to_freeze() is true:
It goes back to the beginning of the loop and repeats reading alloc_order 
and reclaim_order after the reset to 0, and then passes that to 
kswapd_try_to_sleep(...). Previous reclaim_order is not used.

So, the previous store to alloc_order and reclaim_order is lost.
(Is that intentional?) 

Path try_to_freeze() is false:
We call trace_mm_vmscan_kswapd_wake with alloc_order but not with 
reclaim_order. reclaim_order is set by the return of balance_pgdat(...);
So, the previous reclaim_order is again not used.

The diff in the patch might be a bit small, but we are looking at the 
second assignment after kswapd_try_to_sleep(...), not the first assignment 
that just looks the same.


Lukas
