Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.9745.1604658223400817338
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 02:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Iu8FzfnH;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id v5so848625wmh.1
        for <linux-safety@lists.elisa.tech>; Fri, 06 Nov 2020 02:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=mzNiuNqGeFamlvkvbNuJC+7srQmi+KnHfUNnRKxl8XQ=;
        b=Iu8FzfnHSSbyRw4Xkh4ON1v8jlTRgybmQWaJOIbTX7rUOOXLGIYdD4dvaZIp88OJ4Y
         aAs0pJIFdX96yHi/i50h9sPJMXQYJkSxDTJR2Caiy5ZEpe8kf/xWH54BPlM/SzQ6LO94
         qD1Rk1a9QsXdaWaO5Q6eu8+gy4GqrSRB/N2b0FxZ3sMG6YOkv4hz/YrNnevzMXoJ7mp4
         z1dKo3MhAdXPNk33P1hEtwm1WFpzwpmmp/dfJPh/HVK/9QI+OQRHATiIkZrTieZE9kzu
         YAL3hTiRy1kbWzZW04Nkv85Ji1YQch663yNJ9uRoh1WXGDQ8k+LEMjlZQnzPZvE0rusm
         56Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=mzNiuNqGeFamlvkvbNuJC+7srQmi+KnHfUNnRKxl8XQ=;
        b=PcIY2bGF38ZXKa1y3iYbJXSnwjmTRy/DyqfSUf2E93AVEIP3VIzxc1pmXQ+NdjaGBO
         nWJIkkPJw+3G6paq7SJOTFk10H45SgVVADyBWg0qZqyxOmE9X91kSFG17iYzY+3zfaEf
         ExblJPhQe+D8MtajhlapiITpwl6V+OTJN+XVCcoO6zQHHRI0gmgUYI76ny1OY44doSGU
         4CKFZXEfvi94sC9i7U2uud4nzarEFUxiMCtpx8GCb4stiGzuC7KLvC+40K8Qo4dFYIW5
         HzWXvCjlbj8eMilRF+y5L+LfpWELj+BD4MKb/pYcMk7C5YUOIpb8g//loVTcMT4XaMeg
         ikOw==
X-Gm-Message-State: AOAM533h58GouGXi1scerENQQMBa4n53vPrfmaG0vkqhbVBxjlS6qYXR
	ClM0PKPgcaPBt9lDGrvA6k8=
X-Google-Smtp-Source: ABdhPJxXzfKlYpUDKox/cdmpMNPTttMWjBfu7xNSzMPizbrEmkEvbLIdyUSuPmWDt5AlAstsxO33Tg==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr1724178wmc.5.1604658221759;
        Fri, 06 Nov 2020 02:23:41 -0800 (PST)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d20:9d00:e580:adb5:1ef:950d])
        by smtp.gmail.com with ESMTPSA id k81sm2067568wma.2.2020.11.06.02.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 02:23:41 -0800 (PST)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 6 Nov 2020 11:23:34 +0100 (CET)
X-X-Sender: lukas@felia
To: Nathan Chancellor <natechancellor@gmail.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Balbir Singh <bsingharora@gmail.com>, Tom Rix <trix@redhat.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, 
    linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] taskstats: remove unneeded dead assignment
In-Reply-To: <20201106095004.GA3269193@ubuntu-m3-large-x86>
Message-ID: <alpine.DEB.2.21.2011061113270.20338@felia>
References: <20201106062210.27920-1-lukas.bulwahn@gmail.com> <20201106095004.GA3269193@ubuntu-m3-large-x86>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 6 Nov 2020, Nathan Chancellor wrote:

> On Fri, Nov 06, 2020 at 07:22:10AM +0100, Lukas Bulwahn wrote:
> > make clang-analyzer on x86_64 defconfig caught my attention with:
> > 
> >   kernel/taskstats.c:120:2: warning: Value stored to 'rc' is never read \
> >   [clang-analyzer-deadcode.DeadStores]
> >           rc = 0;
> >           ^
> > 
> > Commit d94a041519f3 ("taskstats: free skb, avoid returns in
> > send_cpu_listeners") made send_cpu_listeners() not return a value and
> > hence, the rc variable remained only to be used within the loop where
> > it is always assigned before read and it does not need any other
> > initialisation.
> > 
> > So, simply remove this unneeded dead initializing assignment.
> > 
> > As compilers will detect this unneeded assignment and optimize this anyway,
> > the resulting object code is identical before and after this change.
> > 
> > No functional change. No change to object code.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Question below.
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> > ---
> > applies cleanly on current master and next-20201105
> > 
> > Balbir, please pick this minor non-urgent clean-up patch.
> > 
> >  kernel/taskstats.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> > index a2802b6ff4bb..bd18a7bf5276 100644
> > --- a/kernel/taskstats.c
> > +++ b/kernel/taskstats.c
> > @@ -117,7 +117,6 @@ static void send_cpu_listeners(struct sk_buff *skb,
> >  
> >  	genlmsg_end(skb, reply);
> >  
> > -	rc = 0;
> >  	down_read(&listeners->sem);
> >  	list_for_each_entry(s, &listeners->list, list) {
> 
> Would it be worth moving the scope of rc into the for loop, now that it
> is only used there? Looks like it used to be used in the main function
> scope before commit 053c095a82cf ("netlink: make nlmsg_end() and
> genlmsg_end() void") but if this is removed, it is only used to check
> the return of genlmsg_unicast within the list_for_each_entry loop. Not
> sure that buys us anything but I know you have done it in patches
> before so I thought it was worth considering.
>

I thought about moving it into the local scope, but it is a purely 
cosmetic matter. Compilers are smart enough to generate the same code no 
matter where it is defined.
So, I always look around in the same file to determine if there is some 
kind of strong preference for very locally scoped variable definition or 
if they are generally just all defined at the function entry.

Depending on my gut feeling in which style the file has mainly been 
written, I then go with the one or other option. In this case, I went 
with just keeping the definition at the function entry.

There is really no strong rule, though, that I see serving as good 
indicator.

Thanks for your review.

Lukas
