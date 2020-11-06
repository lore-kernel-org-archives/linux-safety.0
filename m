Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mx.groups.io with SMTP id smtpd.web12.11031.1604667472361953571
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 04:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.com header.s=susede1 header.b=PpYWw1Sr;
 spf=pass (domain: suse.com, ip: 195.135.220.15, mailfrom: pmladek@suse.com)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604667470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8GDVDLs9bnVzNuwPnm3MLNtCohe/Mct9rfNb0ZEHf2E=;
	b=PpYWw1Sr89j/SA+RFrx9zebb/L0Vdt96uqH3Bdk1OQhHY7bOl6TxSbMgflcnhJAkApiLkm
	JKhp4ZQZ/co57COTDWkz85r3RcxjsrHoQkpDt0heb/f9oYKlZcJHRTx6WHRh9PuZwf0nUm
	UR5tHnwIgTQLWbKjA10imY9/lSWmw3c=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1733CAD2B;
	Fri,  6 Nov 2020 12:57:50 +0000 (UTC)
Date: Fri, 6 Nov 2020 13:57:49 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [PATCH] printk: remove unneeded dead-store assignment
Message-ID: <20201106125749.GU20201@alley>
References: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri 2020-11-06 04:40:05, Lukas Bulwahn wrote:
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

The patch is committed in printk/linux.git, branch for-5.10-trivial.

It might still go into 5.10 when there is another important fix.
Otherwise, it would need to wait for 5.11 merge window.

Best Regards,
Petr
