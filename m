Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by mx.groups.io with SMTP id smtpd.web10.18282.1601480411774241505
 for <linux-safety@lists.elisa.tech>;
 Wed, 30 Sep 2020 08:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linutronix.de header.s=2020 header.b=0VyOEBUA;
 spf=pass (domain: linutronix.de, ip: 193.142.43.55, mailfrom: tglx@linutronix.de)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1601480408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M7YqpSi/gchlZo1XYn2OS8SQwqgY1vMmSsPWUH7WJOQ=;
	b=0VyOEBUASaUq1pAri2nZThiCyNFYaAlRte0gRo9ECbuKQxKhrNN2+L2ae6kKKUNT2fCbEI
	5nMtew6K+pzUe8J8Mfovt43mJ//FEGKd8Q59Qy85uiO7sLOQAIg/28sTUQLmUBLsCktbId
	2uW3VY2qGpPD74fGWdP1FHD6Rq/6C2LEkqLy8sBIHCj66J81xg1VgF3MSS85+DsNcqT33/
	5JtLGuOwqALU6FnqfHMRLQwzUCILW/pMp6OEd6kd8YzxfrC/hNKT9+QWQjOE1mFycp1x6t
	qquSn8xfa+rLfkQhfFjh3ZG0TiQo2LTW6U/AnDEnzTHOuzVuyUA1z8Rb57eMOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1601480408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M7YqpSi/gchlZo1XYn2OS8SQwqgY1vMmSsPWUH7WJOQ=;
	b=958au8VteZueoBrwGAHl6FRLloLkA5tKGZWimLrUSHh8xR0S6sSL/iKgd34ICNjuG4sdfu
	4JXwq0TZUwU+66Aw==
To: Peter Zijlstra <peterz@infradead.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Balbir Singh <sblbir@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
In-Reply-To: <20200929083709.GC2651@hirez.programming.kicks-ass.net>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com> <20200929071211.GJ2628@hirez.programming.kicks-ass.net> <20200929083709.GC2651@hirez.programming.kicks-ass.net>
Date: Wed, 30 Sep 2020 17:40:08 +0200
Message-ID: <87eemji887.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 29 2020 at 10:37, Peter Zijlstra wrote:
> Here, I fixed it..

Well, no. What Balbir is trying to do here is to establish whether a
task runs on a !SMT core. sched_smt_active() is system wide, but their
setup is to have a bunch of SMT enabled cores and cores where SMT is off
because the sibling is offlined. They affine these processes to non SMT
cores and the check there validates that before it enabled that flush
thingy.

Of course this is best effort voodoo because if all CPUs in the mask are
offlined then the task is moved to a SMT enabled one where L1D flush is
useless. Though offlining their workhorse CPUs is probably not the daily
business for obvious raisins.

Thanks,

        tglx
