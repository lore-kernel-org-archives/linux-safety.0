Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.124.1601931914242164868
 for <linux-safety@lists.elisa.tech>;
 Mon, 05 Oct 2020 14:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@chromium.org header.s=google header.b=i13avUSE;
 spf=pass (domain: chromium.org, ip: 209.85.215.196, mailfrom: keescook@chromium.org)
Received: by mail-pg1-f196.google.com with SMTP id m34so6754287pgl.9
        for <linux-safety@lists.elisa.tech>; Mon, 05 Oct 2020 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S28irEL+s00l76Xd6JezzJDnWUqPSi/xIcPO6jGVw0k=;
        b=i13avUSEFUfkzqcD46Nq22pgh7sreScxeo625UkqLK+daDX8lE4BFXwZCR+i0RWl4j
         kQm9H9aDflprfWtjdjMu/szcbm39wcJ2ojG/5XrIVT5i/zqP2JxIZQoZeRQA5IF5ZQ8c
         QofnFVvrTWOYSLWkSa8Di/OBLzw49kjy9yTGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S28irEL+s00l76Xd6JezzJDnWUqPSi/xIcPO6jGVw0k=;
        b=Omp4VxeAlpaRUGPQQK8QW1UTgdG8NnK7e5xJz8OWwBoFiuUxheBK3DUObVlNRKVSn9
         2vUhoAN2faOh0fN55q2KpwVqOu5nyut1/ghVcGjG9EksSA6VSH2YwC1JaWYQJv6qTaq9
         5F2bqWlKMtBsxvj8Z2J+qrAA6uyIKkeftp5mRRihRTmgwOf3QFvvuK4H9lJ3MZQsOVYT
         xmjqnbirJC7NDBPUUiP/MrTc4DPmO06f50c8ZOprc5ABn8Uu5/VVYsbCke+3Mo7yjQHe
         c8nNXc/jJh5J/3MydUUbBd+4o1XbQ2xwHUmTIJjLXAke4wC6/3aj1qPjPCTZoDnTOf5S
         Mk4A==
X-Gm-Message-State: AOAM53086MZmUOHA+nQ2MfaYeOJ9IQBS+8a6DCo0csUyLAdJFR/bKSOK
	qRLHSedntTctrc0HNG1pmZMH+A==
X-Google-Smtp-Source: ABdhPJz/S0gfoJShrvVKOkjfbJx02Hws0BkXYZdBoTIGEHtSmorXowh1oXM2pwYvKWxA6ebn5AMJEw==
X-Received: by 2002:a63:a510:: with SMTP id n16mr1283040pgf.256.1601931913748;
        Mon, 05 Oct 2020 14:05:13 -0700 (PDT)
Return-Path: <keescook@chromium.org>
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q12sm478376pjd.16.2020.10.05.14.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 14:05:12 -0700 (PDT)
Date: Mon, 5 Oct 2020 14:05:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
	linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] kernel/sysctl.c: drop unneeded assignment in proc_do_large_bitmap()
Message-ID: <202010051404.CEE37CD617@keescook>
References: <20201005203749.28083-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201005203749.28083-1-sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 09:37:49PM +0100, Sudip Mukherjee wrote:
> The variable 'first' is assigned 0 inside the while loop in the if block
> but it is not used in the if block and is only used in the else block.
> So, remove the unneeded assignment.

True, but in this case, please move the definition of "first" into the
else block so it in only in scope there.

Thanks!

-Kees

> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
> 
> The resultant binary stayed same after this change. Verified with
> md5sum which remained same with and without this change.
> 
> $ md5sum kernel/sysctl.o 
> e9e97adbfd3f0b32f83dd35d100c0e4e  kernel/sysctl.o
> 
>  kernel/sysctl.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index ce75c67572b9..b51ebfd1ba6e 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -1508,7 +1508,6 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
>  			}
>  
>  			bitmap_set(tmp_bitmap, val_a, val_b - val_a + 1);
> -			first = 0;
>  			proc_skip_char(&p, &left, '\n');
>  		}
>  		left += skipped;
> -- 
> 2.11.0
> 

-- 
Kees Cook
