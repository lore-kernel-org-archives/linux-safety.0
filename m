Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.20209.1599738971235580196
 for <linux-safety@lists.elisa.tech>;
 Thu, 10 Sep 2020 04:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=V0K1Yf6V;
 spf=softfail (domain: mab-labs.com, ip: 209.85.167.195, mailfrom: mab@mab-labs.com)
Received: by mail-oi1-f195.google.com with SMTP id c13so5630485oiy.6
        for <linux-safety@lists.elisa.tech>; Thu, 10 Sep 2020 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HGUOjlImzKrbGs0io0Ukq2NsrMMdveZp7FWEgm+H24Y=;
        b=V0K1Yf6VygFudUXKAsAfr75TD0naVMOzkM3mtoaArNhM0lBpiDqHRZECilMKgpS/Zr
         OusHvUGJ9xA59OJb4HHhn3NBhJgQAvXhWZohOrJbvA4xeV7CDWTxFbh2y7Pl0bZwH8AR
         4invVaAJxNXUdty3m5ufVf0C1xMi1+HEe1s+xdhBoVPN0EV43+cmszgurEh4RX0o8Mw1
         55TCof1KdX/y73sMeIjEh5f+cUF4rK1szAn2LSMZKnpTD6Z2WlzgubsKuL5MvAL2/zyt
         pUI2XIcp54SJbTVgnWt/49tFnE2qUKcrvYd2hA7D66kTCgY/OBwdhw/STNNVVmL4J2+N
         G4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HGUOjlImzKrbGs0io0Ukq2NsrMMdveZp7FWEgm+H24Y=;
        b=st2/J0SL4Dr6TfyNJmEgOVm/DSzxNBnFLiczrOuvarkvAJnad0ZNj5ap+vIt6s2Rbm
         CVs6F59ioWrc9fCiYZGhmbrqAkU4gRHH96nXY7/SHsBdAi5QLMfeTux1B2Ftp3WTyllh
         wQ7pTneaRXvNUxL7IFPoCjT1P+P/5GGtUWd6Bmg6yXvRWcEknUYPk0hCDg1/J2+iL8kp
         HVBBKLOga/BMOCnLpsQ3BgmcQruoDTopeGXvbvmCzRc48D9CnkwogcbzyBLfFP26I7WT
         /YvIJXx3GLuCND4CRVDY5sPYdHCrne9CCmqHDiEVkJqQDyVw4F87oAfxy8SSBqCZ2JzP
         JpJA==
X-Gm-Message-State: AOAM5303JMjXxdGOvULWEYbv08jqWYfNkCCCVEbk60CoUeNmGg1Ix+1F
	KAE9qcMZ48eBvZIW0j9QsFruI6fOnMa0yHXpafay8g==
X-Google-Smtp-Source: ABdhPJyWGZGG4zceZAUQKZ0Pc1wtMj9nch397XOGxdGS70FLHhQZfauG0WDNul17q/xr2s9zXj9hMfwEPxRTLAi+DoU=
X-Received: by 2002:aca:3708:: with SMTP id e8mr783768oia.101.1599738970483;
 Thu, 10 Sep 2020 04:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200827151333.11591-1-mab@mab-labs.com> <alpine.DEB.2.21.2009091533570.23843@felia>
 <CALkjhPrJN-kB_UjuqZFpSaySyU6Q8mD7dCsP=ik4+itu=TWKcg@mail.gmail.com> <alpine.DEB.2.21.2009100810580.5893@felia>
In-Reply-To: <alpine.DEB.2.21.2009100810580.5893@felia>
From: "Mohammed Billoo" <mab@mab-labs.com>
Date: Thu, 10 Sep 2020 07:55:59 -0400
Message-ID: <CALkjhPr8+MqjAr4GA0Agj_uzJM4YKOa+225ofY8iCGsyFkczqw@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] scripts: Report 'suspicious' comments
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the details. I will update the script and submit a revised
version of the patch to address your comments.

Thanks

On Thu, Sep 10, 2020 at 2:42 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Wed, 9 Sep 2020, Mohammed Billoo wrote:
>
> > > - Second, we then need to look into true and false positives here.
> > > BUG appears in intended error messages, in DEBUG, in functions, such as
> > > BUG, BUG_ON. So we need to collect the context around BUG and see to
> > > improve the pattern to at least reduce the false positives.
> > >
> > I thought this was addressed in the Perl script. Did you find
> > instances where this isn't the case (IIRC, BUG(), BUG_ON(), and
> > anything else that is outside of a comment were ignored)?
> >
>
> Yes, I did when scanning through the instances.
>
> Let me consider these 10 examples here:
>
> grep "BUG" commentcheck_on_v5.9-rc4 | grep "arch/x86" | head -n 10
>
> ./arch/x86/entry/entry_32.S contains BUG on line 155
> ./arch/x86/include/asm/cpufeatures.h contains BUG on line 381
> ./arch/x86/kernel/cpu/cpuid-deps.c contains BUG on line 90
> ./arch/x86/kernel/kprobes/core.c contains BUG on line 655
> ./arch/x86/kernel/nmi_selftest.c contains BUG on line 165
> ./arch/x86/kernel/paravirt.c contains BUG on line 128
> ./arch/x86/kernel/traps.c contains BUG on line 225
> ./arch/x86/kernel/traps.c contains BUG on line 314
> ./arch/x86/kvm/mmu/mmu.c contains BUG on line 1321
> ./arch/x86/kvm/mmu/mmu.c contains BUG on line 1326
>
>
> Case:
>
> ./arch/x86/kernel/nmi_selftest.c contains BUG on line 165
>
> printk("BUG: %3d unexpected failures (out of %3d) - debugging disabled! |\n",
>         unexpected_testcase_failures, testcase_total);
>
>
> Here BUG is within an intended printk message.
>
>
> Case:
>
> ./arch/x86/kernel/traps.c contains BUG on line 314
>
>
>         printk(KERN_EMERG "BUG: stack guard page was hit at %p (stack is %p..%p)\n",
>                  (void *)fault_address, current->stack,
>                  (char *)current->stack + THREAD_SIZE - 1);
>
> Here BUG is within an intended printk message.
>
>
> Case:
>
> ./arch/x86/kvm/mmu/mmu.c contains BUG on line 1321
>
> pr_err("%s: %p 0->BUG\n", __func__, spte);
>
> Here BUG is within an intended pr_err message.
>
>
> Case:
>
> ./arch/x86/kvm/mmu/mmu.c contains BUG on line 1326
>
> pr_err("%s:  %p 1->BUG\n", __func__, spte);
>
> Here BUG is within an intended pr_err message.
>
>
> Summary:
>
> 10 examples looked at, 4 cases where it is part of an error message.
>
> At least in six cases, it needs more thought why it might not be
> relevant :)
>
> > > - Third, we then need have suitable ways to aggregate the findings to know
> > > which places are known to have many such findings and hence deserve some
> > > kind of special care.
> > >
> > Do you think CodeChecker would be suitable for this?
> >
>
> Well, I think we can record and track findings with CodeChecker if the
> output from the tool has a suitable format to parse back.
>
> The aggregations I have in mind are a bit orthogonal, though.
>
> For example:
>
> How "bad" is my architecture?
>
> grep "\./arch" commentcheck_on_v5.9-rc4  | sed 's!^.*arch/\([^/]*\)/.*$!\1!' | sort | uniq -c | sort -nr
>
>     159 powerpc
>     113 x86
>     109 arm
>      48 parisc
>      42 mips
>      28 alpha
>      24 microblaze
>      20 sh
>      18 ia64
>      16 m68k
>      15 sparc
>      15 openrisc
>      13 arc
>      10 xtensa
>      10 um
>      10 arm64
>       7 s390
>       7 riscv
>       5 nds32
>       3 hexagon
>       3 h8300
>       1 nios2
>       1 csky
>       1 c6x
>
> We want to provide a tool that can guide a user through this data your
> script collects. Some way to show this data in a reasonable aggregation
> can help (not that I am suggesting that this aggregation above is
> reasonable, but it is a first example I could quickly hack together, but
> maybe it is even reasonable?).
>
> > > And then, we need a lot of help to make proper evaluations what to do.
> > Can you elaborate on this? I don't understand what you mean here.
> >
>
> The statistics above shows there are 113 issues in x86; now, if you would
> ever want to use that architecture for anything that matters to you, I
> guess you need to understand all those 113 issues. That needs a lot of
> help from others that understand the code and the issue, right?
>
> Collecting data is a good first step, but there is still a long way ahead.
>
> Lukas



-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022
