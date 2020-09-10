Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.15880.1599720179895599193
 for <linux-safety@lists.elisa.tech>;
 Wed, 09 Sep 2020 23:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tUnWcmlO;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p9so7065819ejf.6
        for <linux-safety@lists.elisa.tech>; Wed, 09 Sep 2020 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=KMnuhoX3mEL6zN5PUCMluzOM3fvfxeYQ7PHmMRnwfqQ=;
        b=tUnWcmlO+b1IlBPy2BW2a3yURDFIw1wPxVtAQ4MA2ihtD/wpcRlm9Z2i2Ui7hN+Bvz
         EUjz9CtXkyMwhA/AwcwefGwbA3vJ72hdnojPJQX+Ta3e+JYkcSjjI580ECKt/CidCAiB
         KGjvJuToq0Jo6M1J/whWoeuz6WV8Dno1H861lLHG2/wTavs9dnFOpcGtaBPxPJaE2nJt
         css4X0nyhqscpED2AP4vyu0WG6rbhmxk8fEax2RWSV54s2rjiL1Mb4Mzja2pFii5Jcef
         IgCVFw3l78uKrXFPZkqtQRsSO5UQgjg5prI/j2ni9qdqAeHALT4n3JlaznChNBIjmQpD
         iDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=KMnuhoX3mEL6zN5PUCMluzOM3fvfxeYQ7PHmMRnwfqQ=;
        b=h89JI0jvzwYnG5zahuM5pO5TJ6aCdXu0E9TqnnnQOKcQp0whgzr9SAh3+lfhomN7AW
         5571xOidwuY+o6xhZhHruB0cqCMGP7/53W3WW0ApheFf17RMEfaKCkQgNvakk3sdVdtJ
         V0EbhQjCGnj0vp4cyIGdvQb17JnFiRVzjv2DGChIGlhIza3JXFWnaIjqL3GWqLu7ouVq
         J08jJrcbilS8FwUwQvw1znaiPt76QCF9gVJg2UYC03OOfaU3mlwNEKccjA5JNFx13QOJ
         FxWdHRh70pK47B4n0tdj2YvO6ZFetT09nd/Pz/ChwscotGqus/+NbIscpsBR6+mzfExN
         WmvQ==
X-Gm-Message-State: AOAM530ig137yK4qh38HgwZB7A8KoIvwHeMic/kRnUAPq3rV1fzHVjDU
	FmSGq6U3EQdrd8lEcc5REfY=
X-Google-Smtp-Source: ABdhPJwL7tT/AmZW6cHHGyo12MJr61tUshglJHi56aK7X7yzZvrRQwUGzq/NYUQK/gpudBzjVq1EFQ==
X-Received: by 2002:a17:906:178d:: with SMTP id t13mr7622911eje.410.1599720178132;
        Wed, 09 Sep 2020 23:42:58 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d2b:3f00:adbe:f1da:86fc:8df])
        by smtp.gmail.com with ESMTPSA id bx24sm5604469ejb.51.2020.09.09.23.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 23:42:57 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 10 Sep 2020 08:42:56 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mohammed Billoo <mab@mab-labs.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-safety@lists.elisa.tech, 
    Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [linux-safety] [PATCH] scripts: Report 'suspicious' comments
In-Reply-To: <CALkjhPrJN-kB_UjuqZFpSaySyU6Q8mD7dCsP=ik4+itu=TWKcg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009100810580.5893@felia>
References: <20200827151333.11591-1-mab@mab-labs.com> <alpine.DEB.2.21.2009091533570.23843@felia> <CALkjhPrJN-kB_UjuqZFpSaySyU6Q8mD7dCsP=ik4+itu=TWKcg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 9 Sep 2020, Mohammed Billoo wrote:

> > - Second, we then need to look into true and false positives here.
> > BUG appears in intended error messages, in DEBUG, in functions, such as
> > BUG, BUG_ON. So we need to collect the context around BUG and see to
> > improve the pattern to at least reduce the false positives.
> >
> I thought this was addressed in the Perl script. Did you find
> instances where this isn't the case (IIRC, BUG(), BUG_ON(), and
> anything else that is outside of a comment were ignored)?
>

Yes, I did when scanning through the instances.

Let me consider these 10 examples here:

grep "BUG" commentcheck_on_v5.9-rc4 | grep "arch/x86" | head -n 10

./arch/x86/entry/entry_32.S contains BUG on line 155
./arch/x86/include/asm/cpufeatures.h contains BUG on line 381
./arch/x86/kernel/cpu/cpuid-deps.c contains BUG on line 90
./arch/x86/kernel/kprobes/core.c contains BUG on line 655
./arch/x86/kernel/nmi_selftest.c contains BUG on line 165
./arch/x86/kernel/paravirt.c contains BUG on line 128
./arch/x86/kernel/traps.c contains BUG on line 225
./arch/x86/kernel/traps.c contains BUG on line 314
./arch/x86/kvm/mmu/mmu.c contains BUG on line 1321
./arch/x86/kvm/mmu/mmu.c contains BUG on line 1326


Case:

./arch/x86/kernel/nmi_selftest.c contains BUG on line 165

printk("BUG: %3d unexpected failures (out of %3d) - debugging disabled! |\n",
        unexpected_testcase_failures, testcase_total);


Here BUG is within an intended printk message.


Case:

./arch/x86/kernel/traps.c contains BUG on line 314


        printk(KERN_EMERG "BUG: stack guard page was hit at %p (stack is %p..%p)\n",
                 (void *)fault_address, current->stack, 
                 (char *)current->stack + THREAD_SIZE - 1);

Here BUG is within an intended printk message.


Case:

./arch/x86/kvm/mmu/mmu.c contains BUG on line 1321

pr_err("%s: %p 0->BUG\n", __func__, spte);

Here BUG is within an intended pr_err message.


Case:

./arch/x86/kvm/mmu/mmu.c contains BUG on line 1326

pr_err("%s:  %p 1->BUG\n", __func__, spte);

Here BUG is within an intended pr_err message.


Summary:

10 examples looked at, 4 cases where it is part of an error message.

At least in six cases, it needs more thought why it might not be 
relevant :)

> > - Third, we then need have suitable ways to aggregate the findings to know
> > which places are known to have many such findings and hence deserve some
> > kind of special care.
> >
> Do you think CodeChecker would be suitable for this?
>

Well, I think we can record and track findings with CodeChecker if the 
output from the tool has a suitable format to parse back.

The aggregations I have in mind are a bit orthogonal, though.

For example:

How "bad" is my architecture?

grep "\./arch" commentcheck_on_v5.9-rc4  | sed 's!^.*arch/\([^/]*\)/.*$!\1!' | sort | uniq -c | sort -nr

    159 powerpc
    113 x86
    109 arm
     48 parisc
     42 mips
     28 alpha
     24 microblaze
     20 sh
     18 ia64
     16 m68k
     15 sparc
     15 openrisc
     13 arc
     10 xtensa
     10 um
     10 arm64
      7 s390
      7 riscv
      5 nds32
      3 hexagon
      3 h8300
      1 nios2
      1 csky
      1 c6x

We want to provide a tool that can guide a user through this data your 
script collects. Some way to show this data in a reasonable aggregation 
can help (not that I am suggesting that this aggregation above is 
reasonable, but it is a first example I could quickly hack together, but
maybe it is even reasonable?).

> > And then, we need a lot of help to make proper evaluations what to do.
> Can you elaborate on this? I don't understand what you mean here.
>

The statistics above shows there are 113 issues in x86; now, if you would 
ever want to use that architecture for anything that matters to you, I 
guess you need to understand all those 113 issues. That needs a lot of 
help from others that understand the code and the issue, right?

Collecting data is a good first step, but there is still a long way ahead.

Lukas
