Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by mx.groups.io with SMTP id smtpd.web08.8866.1604650723283294523
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 00:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linutronix.de header.s=2020 header.b=yhXy6gcG;
 spf=pass (domain: linutronix.de, ip: 193.142.43.55, mailfrom: john.ogness@linutronix.de)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1604650719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGCORwOg18faQgRDXRDoAOZ5EtYvujQ10ImekmNwcQs=;
	b=yhXy6gcGmWFYE01h4/TKk+zrZMwg42xeYL5EUEXrb/RFZqSPqPEU3d8FmcRj2+pfwXGvFj
	z8y+me8VUStg/owSsrgKg8p8UcnFt5DyjSWcw9GevRo3g1tS23PSqYYVqrzsGEOZEbqBpd
	RrlWTfFz/pZA60DTh4d4NGZ6t3P5v8b6cISt3xSTj4/YFU3aBd8QwCAwBQvpSneS5nKp4A
	bvZCmb6ZS/Rbynvd9f2zQ7RmG6J5Ni2Uf+LN08BM6J0OQ2RZWA3TfcjmQdD1PE+q2QJNcl
	BNfBbe5e04PD3Eso/jQay04n7Lz/8HzluPHNAVJBQE7samIBwTHasHdvKEq0pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1604650719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGCORwOg18faQgRDXRDoAOZ5EtYvujQ10ImekmNwcQs=;
	b=U8exzy41HYahMJICgu/66bCwCM/tiCv6nQvZZF+FdfyNJz3NGeeThwe7sRCmcxB07M0B4y
	jR82KoHtmLvI1EDA==
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] printk: remove unneeded dead-store assignment
In-Reply-To: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
References: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
Date: Fri, 06 Nov 2020 09:24:38 +0106
Message-ID: <87h7q2j3tt.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On 2020-11-06, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
>
>   kernel/printk/printk_ringbuffer.c:885:3: warning:
>   Value stored to 'desc' is never read [clang-analyzer-deadcode.DeadStores]
>                 desc = to_desc(desc_ring, head_id);
>                 ^
>
> Commit b6cf8b3f3312 ("printk: add lockless ringbuffer") introduced
> desc_reserve() with this unneeded dead-store assignment.
>
> As discussed with John Ogness privately, this is probably just some minor
> left-over from previous iterations of the ringbuffer implementation. So,
> simply remove this unneeded dead assignment to make clang-analyzer happy.
>
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
>
> No functional change. No change to object code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>
