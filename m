Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.9476.1604656207224911805
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 01:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nXWUVZfh;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: natechancellor@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id n5so547592ile.7
        for <linux-safety@lists.elisa.tech>; Fri, 06 Nov 2020 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xo980jxDgHwElwCLE395h1hcpqz7tSY6loYQUrMps3A=;
        b=nXWUVZfhV0+btoasoZHp+W0XUuF1dY1RydW0bCEjZfZMZechY86dZbBADBqZD7R/gP
         NkcnaZtFnMiOpXvJsZ/wQU3EyUjaLYzpGpBDcqosxFPjl6i99Vf8SA7ilr7YsQ3omeTf
         GsoZxcUeVWOvbTFznbC705BQq+A3Fki4eAhdJI1VJNqc3ynSPwRHVjZw8+UcHd429onw
         yF4ZN3e7Yj+Zk5VpaFDk8dJGkSyQeYDam1KVEB2acdyYKrj33KnhEURSTiBeOMAHNp7U
         /V1QRGjmFor/e/aG9sbrQXpfa/QnhQIjbjjVrD0Tm0RX1jHQtRInR14kLgF69656Aqea
         0Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xo980jxDgHwElwCLE395h1hcpqz7tSY6loYQUrMps3A=;
        b=ZNROyLUWEGqA+zSDIyMU1H4tY95TVhuWvwA90g6akqZ6MHkk5aCGzhBZ6lQjtgWVYO
         IMDDqSY8t84EYVTG0joEbvuTQKsied+8sDYfO2CScdnBArlHvVQul39iRg5P1db77o3p
         Lzr3QPvu9galnyEojbFD9phT/8NRx+5DpgfGSrhf91IamwSitRJSW//Tu0ZrEdD0Thw2
         UtAzBCzBYmVLIRtoSzt3l3BFyw9qkblNvrrevmw9AvdbXk86o/foNe/XscbJKA/QcS+x
         zs9okIpYDdWdBLzGBdsB9uiT0VJlPX+0BqahSXA9YpvTLA3pgbk2L0oUxwac+3Wzn50k
         4H+Q==
X-Gm-Message-State: AOAM530ZFrklqdY6LlWL81J2w4XCAXMQ4H9OAIs8mScINzDZ4mZso6Ht
	VjHy5f8WOvb0SxcPIt89p8o=
X-Google-Smtp-Source: ABdhPJxZp36p6E2qRtUdnnHhjz1uk5ZO4T1LrrfvyzSUV82a53vXRt7bP0NKoshVvnHFy55uHy0/KQ==
X-Received: by 2002:a92:d449:: with SMTP id r9mr752535ilm.276.1604656206576;
        Fri, 06 Nov 2020 01:50:06 -0800 (PST)
Return-Path: <natechancellor@gmail.com>
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id r14sm711209ilc.78.2020.11.06.01.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 01:50:06 -0800 (PST)
Date: Fri, 6 Nov 2020 02:50:04 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, Tom Rix <trix@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] taskstats: remove unneeded dead assignment
Message-ID: <20201106095004.GA3269193@ubuntu-m3-large-x86>
References: <20201106062210.27920-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106062210.27920-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 07:22:10AM +0100, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
> 
>   kernel/taskstats.c:120:2: warning: Value stored to 'rc' is never read \
>   [clang-analyzer-deadcode.DeadStores]
>           rc = 0;
>           ^
> 
> Commit d94a041519f3 ("taskstats: free skb, avoid returns in
> send_cpu_listeners") made send_cpu_listeners() not return a value and
> hence, the rc variable remained only to be used within the loop where
> it is always assigned before read and it does not need any other
> initialisation.
> 
> So, simply remove this unneeded dead initializing assignment.
> 
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change to object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Question below.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on current master and next-20201105
> 
> Balbir, please pick this minor non-urgent clean-up patch.
> 
>  kernel/taskstats.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> index a2802b6ff4bb..bd18a7bf5276 100644
> --- a/kernel/taskstats.c
> +++ b/kernel/taskstats.c
> @@ -117,7 +117,6 @@ static void send_cpu_listeners(struct sk_buff *skb,
>  
>  	genlmsg_end(skb, reply);
>  
> -	rc = 0;
>  	down_read(&listeners->sem);
>  	list_for_each_entry(s, &listeners->list, list) {

Would it be worth moving the scope of rc into the for loop, now that it
is only used there? Looks like it used to be used in the main function
scope before commit 053c095a82cf ("netlink: make nlmsg_end() and
genlmsg_end() void") but if this is removed, it is only used to check
the return of genlmsg_unicast within the list_for_each_entry loop. Not
sure that buys us anything but I know you have done it in patches
before so I thought it was worth considering.

>  		skb_next = NULL;
> -- 
> 2.17.1
> 

Cheers,
Nathan
