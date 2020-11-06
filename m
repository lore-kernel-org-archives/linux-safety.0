Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.11060.1604666301594770694
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 04:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WAJEZpww;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id w1so1171406wrm.4
        for <linux-safety@lists.elisa.tech>; Fri, 06 Nov 2020 04:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=oJeBlvI7pAnkAsw70khux5ZoE/B4WwO2O42ItTpncKs=;
        b=WAJEZpwwyivZPgyV6gkLhK0Y/cm6bIad7kY58MOOTMAbjJoZKo0iDiFWuKcjli0joP
         gc+bfTLQPAg9SP87socW83t/aUHOoTR5RkwijNPW16vWWKOF6rzrZiJYpQvdwZ+wsgGu
         D7rOJMI/NojscP1nzw2xfqEZ81UmtOQSOGOfRKz5Y6gTgtZqESPFkj3QG5PhGjv5d6Cn
         uKNrf3voJrN3tlytYswcULxhhRXwFCkKmGS2/UZwTyRjZrUyzQz8RqawV8qq70IoNrqd
         F6bbtQl8r+roONbnTq6cfe03thF20gW839OV3v7rCEGQDuBGD8D9ci+v5VSxgZnPoSVn
         XUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=oJeBlvI7pAnkAsw70khux5ZoE/B4WwO2O42ItTpncKs=;
        b=MTdc5TyrsAFkadMyTjpSP3kWD3Ugj9LrtXZhhERfN9hqGCeUtARGjcauOzNN0WcaW8
         EwrOKGommLKasy4Uoyj8FiFleVxsqYYPa2BGnES8cvboAmAxUS1SW35M8aSobDOU7+lX
         kT8g9FYWcGAiPMRga1gOCKhz+RuceKmj+USq1mBaBYLo5WvTxW+BrkFNJQY0O5YCdmJs
         GO3FXD+Uecj4WFFFTFB1P4ila3mlDoQZ9yL+SWlRtvX6lHrIJUb2vUJLOzztVR5cOxZG
         NhbYxv9wmOXjzM/kByz7RwbBcaj6NLDLzNOcsPEtLoqbtiaSyYRa0g5mZq9JT90o37Fj
         wtGw==
X-Gm-Message-State: AOAM532DKTMKtgRMiKxXrcCBQeVg9OKcyHO54KE7qHClosJz7/cyOrW5
	zkRNM8J426mL5snsbCnVtJQ=
X-Google-Smtp-Source: ABdhPJzlriX3iwt1mvdV4n7Fm1xf5GeKZnsqhivtwgEd646SLG0R7IIo49K7n1ZP2ZMZwzI9QXBiww==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr2375463wrj.328.1604666300066;
        Fri, 06 Nov 2020 04:38:20 -0800 (PST)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d20:9d00:e580:adb5:1ef:950d])
        by smtp.gmail.com with ESMTPSA id j9sm1924110wrr.49.2020.11.06.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 04:38:19 -0800 (PST)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 6 Nov 2020 13:38:18 +0100 (CET)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Balbir Singh <bsingharora@gmail.com>, Tom Rix <trix@redhat.com>, 
    Nathan Chancellor <natechancellor@gmail.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, 
    linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] taskstats: remove unneeded dead assignment
In-Reply-To: <aea9d12d-88ee-f262-4328-03993521668f@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.2011061331250.20338@felia>
References: <20201106062210.27920-1-lukas.bulwahn@gmail.com> <6ab2415b-0642-16ee-4be0-c909e07e7565@codethink.co.uk> <alpine.DEB.2.21.2011061126130.20338@felia> <aea9d12d-88ee-f262-4328-03993521668f@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 6 Nov 2020, Sudip Mukherjee wrote:

> Hi Lukas,
> 
> On 06/11/2020 10:31, Lukas Bulwahn wrote:
> > 
> > 
> > On Fri, 6 Nov 2020, Sudip Mukherjee wrote:
> > 
> >> Hi Lukas,
> >>
> 
> <snip>
> 
> > 
> > I did not try but I bet (a beverage of your choice) that the object code
> > remains the same also for your suggested patch. Try to disprove my claim 
> > and possibly earn yourself a beverage when we meet...
> 
> Lets decide which beverage.. ;-)
> 
> Using gcc-7.2.0 for MIPS:
> 
> original:- ab81d3305d578c2568fbc73aad2f9e61  kernel/taskstats.o
> After your change:- ab81d3305d578c2568fbc73aad2f9e61  kernel/taskstats.o
> After my change:- 0acae2c8d72abd3e15bf805fccdca711  kernel/taskstats.o
> 
>

Interesting, can you share the diff of the objdump before and after?

I bet it found now a different assignment from variables to registers or 
so; with the beverage at hand, we can then discuss if that is effectively 
still the same object code or not.

Thanks for confirming that my patch here really remains the same compared 
to before, even on MIPS :) I only checked x86-64...

Lukas 

> 
> -- 
> Regards
> Sudip
> 
> 
> 
> 
> 
> 
