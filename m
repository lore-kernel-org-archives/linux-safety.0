Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.16196.1601368392386422714
 for <linux-safety@lists.elisa.tech>;
 Tue, 29 Sep 2020 01:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S8yJWuwR;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id b12so5392622edz.11
        for <linux-safety@lists.elisa.tech>; Tue, 29 Sep 2020 01:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=HK41/qbPxO+SoGRXquqjP/gEh3I+38ZE+z63fzbFSAM=;
        b=S8yJWuwRM6E6vG99yfmoQMLxY2mnpbYIcvbtstIvuN666T+YtUHi8dh3la0w5Yafct
         PZ/XVQQn9ZDZjIkn4uGu2dWW1+YOT5H5gGswkiD/F5rQIANePpgPusGcvJ6YplN7IZfP
         WshdCVcyQ4ipZgpJwuIkCAotuYHX/k7lKN4DNBdxG1vIVH5x0h00kep03tjP3ggBWszA
         nj8BzeKlG4yfnwmTtrV1GJoGQDLgRRI1iVYvEBI9TD5nYieaMf8Np5G1atY+LEHy8GBo
         tfAdIRvOSPfaa6A2tJ/HySv258TxNjiCkJvG4IwF6Pn8G83LykzK+q8vWwIbnOcYDMYZ
         tH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=HK41/qbPxO+SoGRXquqjP/gEh3I+38ZE+z63fzbFSAM=;
        b=l3r7GNz+APsmWbK2VvN21OxA3uwsSbUePR+h8maSB4Gn0uJRhbG84IYj/zzAcyCTGw
         MU4XA+6ZyBvER22yjAmkj8Rkwl284ahMkuLa8Lq0DWoyuQgUfhv97JNVigySIOe4QICx
         oU4SrmPDcASb8IDzpFm/8PwsXxsIG26HD1xivz4lcCfzZ0U0WexT6GVJ0RlbYAF3ZVOd
         CmCqgJwSr4nJZIGPnME3Jw4909JBikeMfJhIHzBWI/yw7saEZ1PEoj0Twza17ufxlnwI
         FA8ywFsPkzGru2Ralh+jgJvgKkdbUmlOJe+TmJjtUODwldRiC6jJ14wa8mIZQXsax0Vu
         kpfQ==
X-Gm-Message-State: AOAM532AYUWwj680MhfYv/8YjM4hdiki8m7pdCDpXbvVIRqyETh1gnXJ
	wnPnrrnyb/Juc1lwfL5/LBc=
X-Google-Smtp-Source: ABdhPJyYvViBHNSY5FE7CXdKUdCiD1GV8vYp3T3pZ0xf9ePqRUqG3AW2pTxyVkmCuZ7dASJFxLP47Q==
X-Received: by 2002:aa7:d4d0:: with SMTP id t16mr2020758edr.83.1601368390650;
        Tue, 29 Sep 2020 01:33:10 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d89:9100:1da1:773b:dbb4:3fc9])
        by smtp.gmail.com with ESMTPSA id cn21sm5173410edb.14.2020.09.29.01.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 01:33:09 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 29 Sep 2020 10:33:08 +0200 (CEST)
X-X-Sender: lukas@felia
To: Peter Zijlstra <peterz@infradead.org>, Balbir Singh <sblbir@amazon.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Nathan Chancellor <natechancellor@gmail.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
    clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, 
    linux-safety@lists.elisa.tech
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
In-Reply-To: <20200929071211.GJ2628@hirez.programming.kicks-ass.net>
Message-ID: <alpine.DEB.2.21.2009291022000.17656@felia>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com> <20200929071211.GJ2628@hirez.programming.kicks-ass.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 29 Sep 2020, Peter Zijlstra wrote:

> On Mon, Sep 28, 2020 at 02:44:57PM +0200, Lukas Bulwahn wrote:
> > diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> > index 6b0f4c88b07c..90515c04d90a 100644
> > --- a/arch/x86/mm/tlb.c
> > +++ b/arch/x86/mm/tlb.c
> > @@ -316,7 +316,7 @@ EXPORT_SYMBOL_GPL(leave_mm);
> >  
> >  int enable_l1d_flush_for_task(struct task_struct *tsk)
> >  {
> > -	int cpu, ret = 0, i;
> > +	int i;
> >  
> >  	/*
> >  	 * Do not enable L1D_FLUSH_OUT if
> > @@ -329,7 +329,7 @@ int enable_l1d_flush_for_task(struct task_struct *tsk)
> >  			!static_cpu_has(X86_FEATURE_FLUSH_L1D))
> >  		return -EINVAL;
> >  
> > -	cpu = get_cpu();
> > +	get_cpu();
> >  
> >  	for_each_cpu(i, &tsk->cpus_mask) {
> >  		if (cpu_data(i).smt_active == true) {
> > @@ -340,7 +340,7 @@ int enable_l1d_flush_for_task(struct task_struct *tsk)
> >  
> >  	set_ti_thread_flag(&tsk->thread_info, TIF_SPEC_L1D_FLUSH);
> >  	put_cpu();
> > -	return ret;
> > +	return 0;
> >  }
> 
> If you don't use the return value of get_cpu(), then change it over to
> preempt_{dis,en}able(), but this got me looking at the function, wtf is
> that garbage supposed to do in the first place

I also thought that preempt_{dis,en}able() would do, but thought maybe 
Balbir just considered {get,put}_cpu stylistically nicer... so I stayed 
with the functions as-is.

> 
> What do we need to disable preemption for?
>

I have no clue... not a good premise for touching the code, but I just 
wanted to make clang-analyzer happy without modifying any semantics.

Balbir, can you help out here? What was your intent?
 
> Please explain the desired semantics against sched_setaffinity().
> 

I am happy to send a proper v2 once I understand if disabling preemption 
is required and the preempt_{dis,en}able() function are preferred to the 
{get,put}_cpu functions.

Lukas
