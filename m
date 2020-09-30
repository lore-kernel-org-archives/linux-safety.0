Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.574.1601484827581903980
 for <linux-safety@lists.elisa.tech>;
 Wed, 30 Sep 2020 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eQkWDYHV;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id qp15so2925510ejb.3
        for <linux-safety@lists.elisa.tech>; Wed, 30 Sep 2020 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=2ux3ZwoOcELXRpM8fj0VwKjV3oJw+0s13Z8VXyw/i0U=;
        b=eQkWDYHVn+jhaKKWLiGAanMAHe2yi2XmEHp6gMAzQy+ljQx90l2Vw8QyxWdiQPdoPI
         cO5sUZ2xmVuTzUg6+inIx3JvfpZwIcR41qyoFWJa+emFa3DqmlmHgsjbiQ/hALiEPMrW
         AC23Zqyv+D34TGyd131IdF+Q1EHLV68gWO9SZGpOCF/uIrk/l0YsmdMxr2moOwkAZgHO
         MfAj1YTw3jtdkJrIWScgBNiNq4qHczBSFyegN6knyokcK4f/WrJM8ifAIN/MYPZYB9qp
         AFxf2PX+jl0tT/ZeySpYpTyv2Ux4CB9IN+RnO0dm4aeDtu+LtpL2vd1tERMz05s+ILZ2
         ljdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=2ux3ZwoOcELXRpM8fj0VwKjV3oJw+0s13Z8VXyw/i0U=;
        b=KPhuSKCIb5T2il/WJP1gZKzBfOzqcgFq2ihWnPd+0ehy00BFWWnoSReAW+7N4ZVZo0
         7/B661LgFHWJjy4vWD8F/jvrWyUbX9MsCUd/GdRshRQjVWVeB96iKUyLcLb/ZqWaMxZp
         +5J20rzhOtRH17sssGl5zlBO1a7NiAwbGjxHk5H7CV0xi6Sx0ipyAwce8lbURZunoWoR
         O2ChjZhEk9y3Uw1ffDQntMbZJdLaFgQuP0kJWqePZPQuxkPafbjnZ9N7UgEZ5F/XpJ1r
         KHg2VB7Rhi3aaPVvOz/hzHKdk2Z8d0fmYfIHPFhv4yu8Qg6GrMd5uHYPwuDunTJdICPb
         D13w==
X-Gm-Message-State: AOAM530O7d6dt5Hgvp9Ah3L+u2Ih37prsl/l8+SzKV3rvuN6bjAamlWW
	Py0gBHHU7INUg+5NglD8qYU=
X-Google-Smtp-Source: ABdhPJxq6i2gIPLWPJ7O6Kk/mI1cJIl9yCZ/51WXjg9tgeev7wuOBV30r/25eWcHH73BG1oJRlXIPQ==
X-Received: by 2002:a17:906:275b:: with SMTP id a27mr3983359ejd.190.1601484825856;
        Wed, 30 Sep 2020 09:53:45 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d6f:5600:7072:b735:b671:fb4f])
        by smtp.gmail.com with ESMTPSA id pv28sm2021553ejb.120.2020.09.30.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:53:45 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 30 Sep 2020 18:53:37 +0200 (CEST)
X-X-Sender: lukas@felia
To: Thomas Gleixner <tglx@linutronix.de>
cc: Peter Zijlstra <peterz@infradead.org>, 
    Lukas Bulwahn <lukas.bulwahn@gmail.com>, Balbir Singh <sblbir@amazon.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Nathan Chancellor <natechancellor@gmail.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
    clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, 
    linux-safety@lists.elisa.tech
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
In-Reply-To: <87eemji887.fsf@nanos.tec.linutronix.de>
Message-ID: <alpine.DEB.2.21.2009301848050.21555@felia>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com> <20200929071211.GJ2628@hirez.programming.kicks-ass.net> <20200929083709.GC2651@hirez.programming.kicks-ass.net> <87eemji887.fsf@nanos.tec.linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 30 Sep 2020, Thomas Gleixner wrote:

> On Tue, Sep 29 2020 at 10:37, Peter Zijlstra wrote:
> > Here, I fixed it..
> 
> Well, no. What Balbir is trying to do here is to establish whether a
> task runs on a !SMT core. sched_smt_active() is system wide, but their
> setup is to have a bunch of SMT enabled cores and cores where SMT is off
> because the sibling is offlined. They affine these processes to non SMT
> cores and the check there validates that before it enabled that flush
> thingy.
> 
> Of course this is best effort voodoo because if all CPUs in the mask are
> offlined then the task is moved to a SMT enabled one where L1D flush is
> useless. Though offlining their workhorse CPUs is probably not the daily
> business for obvious raisins.
>

Thanks, Thomas.

So, I will keep the semantics as-is, clean up the patch with 
preempt_{dis,en}able() and send out a v2.

Lukas 
