Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mx.groups.io with SMTP id smtpd.web10.7665.1601540427351852488
 for <linux-safety@lists.elisa.tech>;
 Thu, 01 Oct 2020 01:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=Vj8BfNhk;
 spf=none, err=permanent DNS error (domain: infradead.org, ip: 90.155.50.34, mailfrom: peterz@infradead.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4xFuVy4XXtBpTUWYQ2Ea29srN5GWUr2xjmeW/GpcGh0=; b=Vj8BfNhkjnHd+qucd0Y3YZIbMr
	/8v6MUmL5V7lE1aYrJeIxmJdA8KP4SZcjrFn+6Fx4AKUcWJaBPTR/hT1jTSjS5RhCaz4ZHOAE0bfu
	HF91bOTY+bDxhOAZBt6koOVLvang6a7pZgwZa0Atj7aYvb0LKRP20hDesNO8bYgxzkDbD/9KkRED+
	1BhtIsyQ6dBpaoPGPLLGmiUK1JtXHVOCAMaqjDSIU93/Ncxuh6+Tkv8AHYSjBeBLFbuDjWqDjrtqN
	YsM1fahM/p3DMTrCofj4W0Zezk9RGtiPRm+JlcZAMmm3yBBb2/Z5lZ+BFeXD+J01ohCyHQ16JfHan
	tEm/mc9w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtop-0001ov-0A; Thu, 01 Oct 2020 08:20:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B5BA93011F0;
	Thu,  1 Oct 2020 10:19:58 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0E661205FF78B; Thu,  1 Oct 2020 10:19:58 +0200 (CEST)
Date: Thu, 1 Oct 2020 10:19:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Singh, Balbir" <sblbir@amazon.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-ID: <20201001081958.GO2628@hirez.programming.kicks-ass.net>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
 <20200929071211.GJ2628@hirez.programming.kicks-ass.net>
 <20200929083709.GC2651@hirez.programming.kicks-ass.net>
 <87eemji887.fsf@nanos.tec.linutronix.de>
 <20200930170316.GB2628@hirez.programming.kicks-ass.net>
 <87blhni1pg.fsf@nanos.tec.linutronix.de>
 <20200930183552.GG2628@hirez.programming.kicks-ass.net>
 <87k0wbgd2s.fsf@nanos.tec.linutronix.de>
 <19f57cbe-ba33-17d5-440c-2765e670782f@amazon.com>
MIME-Version: 1.0
In-Reply-To: <19f57cbe-ba33-17d5-440c-2765e670782f@amazon.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Your MUA is having trouble wrapping text at 78 chars.

On Thu, Oct 01, 2020 at 09:49:30AM +1000, Singh, Balbir wrote:

> So this is the change I am playing with, I don't like the idea of
> killing the task, but it's better than silently not flushing, I guess
> system administrators will learn with time not to correctly the
> affinity of tasks flushing L1D. For the affinity bits, not being able
> to change the affinity is better, but not being able to provide
> feedback on as to why is a bit weird as well, but I wonder if there
> are other cases where we might want to lock the affinity of a task for
> it's lifetime.

You can't really do that, hot-unplug can (and will) destroy any affinity
setting, and if the task/admin wants to recover it needs to be able to
re-set affinity after that.
