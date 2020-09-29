Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.16252.1601368939977650648
 for <linux-safety@lists.elisa.tech>;
 Tue, 29 Sep 2020 01:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C9E4mLgN;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id j11so13874489ejk.0
        for <linux-safety@lists.elisa.tech>; Tue, 29 Sep 2020 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=lMOqo3ypO/SZ3oHUy6euRnuasGkm67DC6ZbiwUFwB8M=;
        b=C9E4mLgNTPQm8NqaAoz6itH7ufzLLW2Afp390W5SRJ4Rdbl7etn2wAbpam4yITVwLD
         F6FwrUs08Nvzo3Mfl42l34qKUnxrHpNoeI4tuU4Rh5fdZSfPxUztwLF3B8mRIf+EFyTV
         Bw1kXUFQm0WiVqzUhAXpob85WyYHYrBekAyw4cYZeVFKbNMVv3Lb2xSuVqe13M3RxfjP
         KdrELuR5PtKXB6MbMdbyIvZpTiEB14c8DNlnX3V1U7sPu/om8bscAIW+QwD0756G5JJb
         3SL0nmILrDsE4MXwsMmLjKYUtJWrj6PUmyZB5LLwrM1DZ4kB+fPrk7jWxb/T3ePyRn8t
         njcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=lMOqo3ypO/SZ3oHUy6euRnuasGkm67DC6ZbiwUFwB8M=;
        b=d0L8AmJSoz2WnWoSR3AcL23LbRCxEX7IA+CWHvaf1uO/tik2RSOi7DcFzrrqV9nz/D
         pwD9PW582jWSLdo4yYKbUV95D/LAVo6w7t3iuBnWPe4A6R+LPoN3vkEpkORQur9TxtZv
         Vc37HSNFVFwgeMcAgv0h9X0Hx0CrvV8wE/7h/6ZUS6lpO+LsuHpygkoob5rbizEqTtOR
         kLjUspDcoOu0D+GbP6sh2CK1+FFb5IHlNu0Ank7u7DPS+qU4BSBsAw3PM1qWQoU+KiSF
         6YUosTkozKROxJq8IWjr2qKr+aXbxD1d8h2KKOYVSSvWlxF9SgKnnZwzXbVGyp7guEkU
         1Lyw==
X-Gm-Message-State: AOAM530sJ1iutelOI5ppkXF+eNTo+v5A5oX5+mhasfFt/ROrhIFLoSuu
	1UqYD4V+Zg2520g26kRsYSk=
X-Google-Smtp-Source: ABdhPJzGWfoP9r1EYK/PGbfUWz5nDplWzfMQE+vmcmMJK3RNsVSeyNcSHA23E0BLUDmcdQqqkuVHYg==
X-Received: by 2002:a17:906:f755:: with SMTP id jp21mr326002ejb.97.1601368938287;
        Tue, 29 Sep 2020 01:42:18 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d89:9100:6c4a:28e4:c658:86f9])
        by smtp.gmail.com with ESMTPSA id u9sm4528036eje.119.2020.09.29.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 01:42:17 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 29 Sep 2020 10:42:15 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dave Hansen <dave.hansen@intel.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Nathan Chancellor <natechancellor@gmail.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
    clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, 
    linux-safety@lists.elisa.tech
Subject: Re: [PATCH] x86/mm: drop superfluous initialization
In-Reply-To: <1d376c1f-2f14-5c29-671e-ca59853fa4a4@intel.com>
Message-ID: <alpine.DEB.2.21.2009291034160.17656@felia>
References: <20200928100004.25674-1-lukas.bulwahn@gmail.com> <1d376c1f-2f14-5c29-671e-ca59853fa4a4@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 28 Sep 2020, Dave Hansen wrote:

> On 9/28/20 3:00 AM, Lukas Bulwahn wrote:
> > diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> > index c7a47603537f..5632f02146ca 100644
> > --- a/arch/x86/mm/init.c
> > +++ b/arch/x86/mm/init.c
> > @@ -609,7 +609,7 @@ static void __init memory_map_top_down(unsigned long map_start,
> >  	step_size = PMD_SIZE;
> >  	max_pfn_mapped = 0; /* will get exact value next */
> >  	min_pfn_mapped = real_end >> PAGE_SHIFT;
> > -	last_start = start = real_end;
> > +	last_start = real_end;
> 
> Thanks for finding this.
> 
> This becomes even more obviously correct if we just move the 'start'
> declaration into the while() loop.  If we do that, it puts the three
> assignment locations right next to the definition, and its trivial to
> spot that the initialization was not missed:
> 
>         while (last_start > map_start) {
> 		unsigned long start;
> 
>                 if (last_start > step_size) {
>                         start = round_down(last_start - 1, step_size);
>                         if (start < map_start)
>                                 start = map_start;
>                 } else
>                         start = map_start;
> 		...
>

Agree, this point is simply a question of style:

Shall local variables be defined as "local" as possible or simply 
consistently at the beginning of each function?

If there are no strong opinions of style, I would just keep this patch 
as-is.

> Either way, your patch looks correct to me:
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> 

Thanks for the Ack.

Lukas
