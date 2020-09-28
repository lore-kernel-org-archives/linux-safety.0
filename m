Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.5070.1601325830073386713
 for <linux-safety@lists.elisa.tech>;
 Mon, 28 Sep 2020 13:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PDPtID/t;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: natechancellor@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id x123so2243159pfc.7
        for <linux-safety@lists.elisa.tech>; Mon, 28 Sep 2020 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JbsSO0zP4i+4+OZXhhTK0jpolLCqQxk8S7EHJu7e4UA=;
        b=PDPtID/tw5h9Kf0tijaIWL1aQgj5Ev/kQsnVA5MW5HyvGy6l0cEkT1QB3a80QCu0qh
         Jkt/6VyymU2TjzCEqhV990copDeC2Xrv4NZf7bkdEZ0HqNSzH5z//DbEU8VPDldfLOYn
         6eFqwG9+0j18a6P4krLOC0iM9hNzYMIU+p/rmiyVAG8wf4DyXyZ5pBvQRM1gZ8Qn9LFJ
         cxLMSz+HM0cLL+ZDul71GO4p1oDe6Diepl8x/8pNYJo1OcKen34YbxcBtl5QP2oZ5g6R
         fl3ZZIQiUt9iQy9RBWWo0+G1a/pLYhGRKgwydJM7Z46IEhfW3IbUIs0+hep9dmNm2FoU
         sBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JbsSO0zP4i+4+OZXhhTK0jpolLCqQxk8S7EHJu7e4UA=;
        b=ViDgDJ4qlvzPvaPwyuqwC/Cru2/HOq61XJOLs3NTNZWxeJmPB37JEnIosAGcjCaQPM
         tyIMed6vyjpa3fRdTKm+A5faZK+SB0dEbEzP2CnKwQlAoRJEE3kKlMAWytCBSlytO+53
         0F4naX8O8htF8l3ACL601OhricAD+kYVzepxABtVKUD6PIIbjjkf21YkeH3eFQ/laaQN
         CCDUq2sOtGF6uPvNhO0RS4nA+HOYJNnLuPUUWJU2AOXZhN4COe4olUiG2TMJwB6AmcP4
         Ij6uiBtty7OSOWZoLuHndoMzkfSYSKi2GvyR/lZj6GhUekTpSAi0lSsputHxVmGIpROr
         Aiaw==
X-Gm-Message-State: AOAM533p7vexxjTf95xrRXtsJDb2Jb8fSAggVIXAprLe+0DkQQOi/kwV
	q7ARrLCyR0xLNvPJ7SfE4Dg=
X-Google-Smtp-Source: ABdhPJxHyZb9FWYtMz92gjZ2Fxdaig+p2xmZUkcuisS3FESas0U3E0mHShr1l83UA7OpmSNGcruYmw==
X-Received: by 2002:a62:1410:0:b029:13e:d13d:a129 with SMTP id 16-20020a6214100000b029013ed13da129mr994603pfu.17.1601325829273;
        Mon, 28 Sep 2020 13:43:49 -0700 (PDT)
Return-Path: <natechancellor@gmail.com>
Received: from ubuntu-m3-large-x86 ([2604:1380:45e1:2200::1])
        by smtp.gmail.com with ESMTPSA id i36sm2269309pgm.43.2020.09.28.13.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:43:48 -0700 (PDT)
Date: Mon, 28 Sep 2020 13:43:46 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Balbir Singh <sblbir@amazon.com>, Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-ID: <20200928204346.GA953199@ubuntu-m3-large-x86>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2020 at 02:44:57PM +0200, Lukas Bulwahn wrote:
> Commit b6724f118d44 ("prctl: Hook L1D flushing in via prctl") checks the
> validity for enable_l1d_flush_for_task() and introduces some superfluous
> local variables for that implementation.
> 
> make clang-analyzer on x86_64 tinyconfig caught my attention with:
> 
>   arch/x86/mm/tlb.c:332:2: warning: Value stored to 'cpu' is never read \
>   [clang-analyzer-deadcode.DeadStores]
> 
> Compilers will detect these superfluous local variables and assignment and
> optimize this anyway. So, the resulting binary is identical before and
> after this change.
> 
> Simplify the code and remove superfluous local variables to make
> clang-analyzer happy.
> 
> No functional change. No change in binary with supported compilers.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> applies cleanly on next-20200925
> 
> Balbir, please review and ack.
> Thomas, please pick this minor non-urgent clean-up patch into the x86/pti
> branch of tip as follow-up to: 
> https://lore.kernel.org/lkml/160026187842.15536.285514864386042510.tip-bot2@tip-bot2/
> 
> I quickly confirmed that the binary did not change with this change to the
> source code; The hash of tlb.o remained the same before and after the change.
> 
> So, in my setup:
> md5sum tlb.o
> 7c7e096bab0fd87bd2c8437d8c7dc3fa  tlb.o
> 
> linux-safety, please verify and validate this change.
> 
>  arch/x86/mm/tlb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 6b0f4c88b07c..90515c04d90a 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -316,7 +316,7 @@ EXPORT_SYMBOL_GPL(leave_mm);
>  
>  int enable_l1d_flush_for_task(struct task_struct *tsk)
>  {
> -	int cpu, ret = 0, i;
> +	int i;
>  
>  	/*
>  	 * Do not enable L1D_FLUSH_OUT if
> @@ -329,7 +329,7 @@ int enable_l1d_flush_for_task(struct task_struct *tsk)
>  			!static_cpu_has(X86_FEATURE_FLUSH_L1D))
>  		return -EINVAL;
>  
> -	cpu = get_cpu();
> +	get_cpu();
>  
>  	for_each_cpu(i, &tsk->cpus_mask) {
>  		if (cpu_data(i).smt_active == true) {
> @@ -340,7 +340,7 @@ int enable_l1d_flush_for_task(struct task_struct *tsk)
>  
>  	set_ti_thread_flag(&tsk->thread_info, TIF_SPEC_L1D_FLUSH);
>  	put_cpu();
> -	return ret;
> +	return 0;
>  }
>  
>  int disable_l1d_flush_for_task(struct task_struct *tsk)
> -- 
> 2.17.1
> 
