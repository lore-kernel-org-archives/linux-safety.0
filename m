Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.2607.1600358557140541575
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 09:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X09D5SHL;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id t16so3051198edw.7;
        Thu, 17 Sep 2020 09:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Vy2CE15V28VzlY7h8e20GOlpUIA6yvJjq9ogNq6Jakk=;
        b=X09D5SHLlmqNBr0fDkqZaQkdZxLANqIQh1Q0HvlgsFyoOcSOKALIHiqbOCfZZjaK9q
         iV8QIDYxiDX0CXL6SSrLp6MoI490WWCJJXMNUdXinGzT1akjGJ2nzpg2MH7KVQLb6qPN
         DRi1heVKBR4keoGPdUXLG+I9Fr8BVesKk19lhraM6qa7nQTv8J8cK9bDee6Hho03szde
         A7l5OybhbdNs/KeKc0Sg3MQZY/2HyDQtmLGa6+KoskYgv8QJ3UZ7kSRh+pMLyDhqrp7l
         8dvr1PqT2IoI/Zil9g4fXKzYNHXfOqJqZKr51i+vVlhwkyr914uZO4vfDlN9BNyRu+Wf
         5+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Vy2CE15V28VzlY7h8e20GOlpUIA6yvJjq9ogNq6Jakk=;
        b=Zf2fiM4WDZmum52JtD9N9voa7DvXgDOO+tL061yYi9SywKkK4gNfhLXIU3aEC4ybQ/
         6EeLYfZ+pEWOOUQyZ1j3kP8w8RPmK7PyrJdP4y6EaoUHujiavwD/ydCeEQwQVdc7iJpD
         170cGXpHrmN/9UFCY+83aqyeotiHg3j4fevJ+I0siCGfjcX2itXAFfX6A7EGDHprJlQZ
         3b/pDxAQJJ/WowZFkm48dGJx+f40DnEkB7Uy/2cXiqbG50tXTpl1Hdga9ggm5PBdxUqu
         iErZWXG8Rgj0THZqGR7+eWRf292weIuOMtJmovL4g20rgGWAds19juS/ERZEn21MZd5k
         1j8A==
X-Gm-Message-State: AOAM5302KkqOvVL3dKsmuCR2ThpNo3ZiJdGFrhWhyM5u0iFPtbkvKt0b
	d5fO7MVPKNFZ3nUValkIBe0=
X-Google-Smtp-Source: ABdhPJwy0u5UG2tfZDa1RiS54pZLTixmxV26QO6P8N3nHnORS+fU8UHvJYWFiEx/cRT+ITvINO72pQ==
X-Received: by 2002:a05:6402:1710:: with SMTP id y16mr35199734edu.197.1600358555352;
        Thu, 17 Sep 2020 09:02:35 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2da3:1100:b096:8628:b410:46b3])
        by smtp.gmail.com with ESMTPSA id q13sm84073edr.27.2020.09.17.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 09:02:34 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 18:02:33 +0200 (CEST)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-safety@lists.elisa.tech, 
    development-process@lists.elisa.tech
Subject: Re: [ELISA Development Process WG] [linux-safety] [PATCH] mm: vmscan: provide a change to the development-process group
In-Reply-To: <37746704-f127-1f4c-4856-9f510826bb92@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.2009171754020.9985@felia>
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com> <bca08c66-cad5-aac5-865c-f9b319142af0@codethink.co.uk> <alpine.DEB.2.21.2009171718090.9985@felia> <37746704-f127-1f4c-4856-9f510826bb92@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 17 Sep 2020, Sudip Mukherjee wrote:

> 
> 
> On 17/09/2020 16:29, Lukas Bulwahn wrote:
> > 
> > 
> > On Thu, 17 Sep 2020, Sudip Mukherjee wrote:
> > 
> >>
> >>
> >> On 17/09/2020 09:44, Lukas Bulwahn wrote:
> >>> I think this change is needed for safety, whatever that might mean to you.
> >>>
> >>> I am unqualified to really make a change here, as I have no clue what this
> >>> code does, nor what my change does, but sure, the testing and verification
> >>> reference process can now point out the required next steps in the
> >>> reference process to test this code and code change.
> >>>
> >>> Good luck :)
> >>>
> >>> Not intended for distribution to the general kernel mailing lists.
> >>>
> >>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >>> ---
> >>> I would like to submit such a patch, what do I need to do according to
> >>> the expected testing and verification recommendations for safety-related
> >>> systems?
> >>>
> >>> Please help me. What do I need to compile, what test do I need to run,
> >>> which verification tool do I need to employ for this change?
> >>
> >> The change looks valid, 'reclaim_order' has not been used anywhere after
> >> READ_ONCE(), and its  So, it looks like a harmless change, you will only
> >> need a good commit message detailing why its harmless.
> >>
> > 
> > Thanks, Sudip. Yes, I also conclude it is harmless but I really cannot say 
> > as I did not even compile it :) and I guess you did not either :)
> > 
> > I would actually want to argue that I compiled it for all available (and 
> > relevant) kernel configurations and the binary is identical before and 
> > after the change.
> 
> That, I dont think is possible. The maintainers will receive thousands
> of patch in a day. If they have to compile each for all available
> configuration (and arch), then they might spend the full day just
> checking patches. Also, many upstream contributors contribute in their
> personal spare time, so if building in all possible configuration
> becomes a requirement then I think that is going to discourage many
> contributors from contributing.
>

I am not asking the maintainer, I would only waste my own energy bill on 
that :) if I would what to do...

But even finding out which configurations actually make a difference is an 
unsolved challenge, right? The experts know, but how would I find out?

> > 
> > It is a Dead Store, so I expect the compiler to detect that and just 
> > optimize that away...
> 
> Which is also something I always think, we are relying on the compiler
> to produce the code that is actually executed on the hardware. There are
> different compilers and each compiler has different versions, so that
> means the generated code is going to be different. Even though we say
> Linus Kernel meets the safety requirement, can we say that the kernel
> that is executing on the hardware meets the safety requirement? This, I
> think is completely off-topic for this WG, but just a thought.
>

Yes, let us keep it simple for now; but you are right. This whole story of 
'test and verification' fully independently quickly breaks... but let the
group figure that out.
  
> > 
> >> So, from a safety pov, is it a requirement that every submitted patch
> >> will need to be tested based on the safety tests and all the other
> >> defined tests?
> >>
> > 
> > Well, I do not know what Roberto thinks his reference process is good for, 
> > but I would like to know if Roberto thinks it can guide anyone on such a 
> > question or not?
> > 
> > It is really just some fun for the discussion in this group... there are 
> > thousands of commits travelling into the kernel... if we cannot provide 
> > an answer for a single one, how to do it for thousands?
> 
> Lets have another example of a change.
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
> b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
> index b78101afc93d..2b539335206a 100644
> --- a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
> +++ b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
> @@ -367,7 +367,6 @@ uint oid_rt_get_scan_in_progress_hdl(struct
> oid_par_priv *poid_par_priv)
>         return RNDIS_STATUS_SUCCESS;
>  }
> 
> -
>  uint oid_rt_forced_data_rate_hdl(struct oid_par_priv *poid_par_priv)
>  {
>         return RNDIS_STATUS_SUCCESS;
> 
> 
> 
> Not a formal patch, just pasted the git diff. This fixes the checkpatch
> warning of "Please don't use multiple blank lines". What tests are
> needed on this patch to say that the kernel development meets the safety
> requirement?
> 
>

Nice :) Sudip, You are making the kernel safer, Yeah! ;)

Reference process, where are thou?

Lukas
