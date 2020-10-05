Received: from outbound-smtp35.blacknight.com (outbound-smtp35.blacknight.com [46.22.139.218])
 by mx.groups.io with SMTP id smtpd.web12.30045.1601884574480157589
 for <linux-safety@lists.elisa.tech>;
 Mon, 05 Oct 2020 00:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: techsingularity.net, ip: 46.22.139.218, mailfrom: mgorman@techsingularity.net)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp35.blacknight.com (Postfix) with ESMTPS id 944692422
	for <linux-safety@lists.elisa.tech>; Mon,  5 Oct 2020 08:56:08 +0100 (IST)
Received: (qmail 16739 invoked from network); 5 Oct 2020 07:56:08 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.22.4])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 5 Oct 2020 07:56:08 -0000
Date: Mon, 5 Oct 2020 08:56:07 +0100
From: Mel Gorman <mgorman@techsingularity.net>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [PATCH] mm/vmscan: drop unneeded assignment in kswapd()
Message-ID: <20201005075606.GG3227@techsingularity.net>
References: <20201004125827.17679-1-lukas.bulwahn@gmail.com>
 <20201004192437.GF3227@techsingularity.net>
 <alpine.DEB.2.21.2010050831010.6202@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010050831010.6202@felia>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

On Mon, Oct 05, 2020 at 08:58:53AM +0200, Lukas Bulwahn wrote:
> 
> 
> On Sun, 4 Oct 2020, Mel Gorman wrote:
> 
> > On Sun, Oct 04, 2020 at 02:58:27PM +0200, Lukas Bulwahn wrote:
> > > The refactoring to kswapd() in commit e716f2eb24de ("mm, vmscan: prevent
> > > kswapd sleeping prematurely due to mismatched classzone_idx") turned an
> > > assignment to reclaim_order into a dead store, as in all further paths,
> > > reclaim_order will be assigned again before it is used.
> > > 
> > > make clang-analyzer on x86_64 tinyconfig caught my attention with:
> > > 
> > >   mm/vmscan.c: warning: Although the value stored to 'reclaim_order' is
> > >   used in the enclosing expression, the value is never actually read from
> > >   'reclaim_order' [clang-analyzer-deadcode.DeadStores]
> > > 
> > > Compilers will detect this unneeded assignment and optimize this anyway.
> > > So, the resulting binary is identical before and after this change.
> > > 
> > > Simplify the code and remove unneeded assignment to make clang-analyzer
> > > happy.
> > > 
> > > No functional change. No change in binary code.
> > > 
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > 
> > I'm not really keen on this. With the patch, reclaim_order can be passed
> > uninitialised to kswapd_try_to_sleep. While a sufficiently smart
> > compiler might be able to optimise how reclaim_order is used, it's not
> > guaranteed either. Similarly, a change in kswapd_try_to_sleep and its
> > called functions could rely on reclaim_order being a valid value and
> > then introduce a subtle bug.
> >
> 
> Just for my own understanding:
> 
> How would you see reclaim_order being passed unitialised to 
> kswapd_try_to_sleep?
> 
> From kswapd() entry, any path must reach the line
> 
>   alloc_order = reclaim_order = READ_ONCE(pgdat->kswapd_order);
> 
> before kswap_try_to_sleep(...).
> 

After your patch, the code is

	unsigned int alloc_order, reclaim_order;
	...

	for ( ; ; ) {
                alloc_order = READ_ONCE(pgdat->kswapd_order);
                highest_zoneidx = kswapd_highest_zoneidx(pgdat,
                                                        highest_zoneidx);

kswapd_try_sleep:
                kswapd_try_to_sleep(pgdat, alloc_order, reclaim_order,
                                        highest_zoneidx);
	...
		reclaim_order = balance_pgdat(pgdat, alloc_order,
                                                highest_zoneidx);

reclaim_order is declared, not initialised at the start of the loop and
passed into kswapd_try_to_sleep. There is a sequence where it is not used
so it does not matter but it depends on the compiler figuring that out.

-- 
Mel Gorman
SUSE Labs
