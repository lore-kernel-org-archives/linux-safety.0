Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.21351.1604970499751587182
 for <linux-safety@lists.elisa.tech>;
 Mon, 09 Nov 2020 17:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pUdpifgo;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: natechancellor@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id r7so9987698qkf.3
        for <linux-safety@lists.elisa.tech>; Mon, 09 Nov 2020 17:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jfYrdTPKMZbK96SOWjVC+rX+6K1DHm/KzMlUaGqdCkw=;
        b=pUdpifgoK3w/lahMuT6WcZmrX4aQ2ovlJSJoTrIARtJQbPBh83RGgcVvTlBrAsaUV5
         u8Vk+QKxnbN7lKUsNHc4qJxvQq3P2iPRLc4GFr7foKh/io6u6OlPuBetXNzJdFMYUwcB
         SUfer6LTAEtgrkjvorvT+2Vg5kW082G8yBNdg8M3c1EhYm3l8A1zBWbRBSIgaC0BvfS8
         CG0Os63C5a0pOtHwc6FF2Gl6eS+0yecZPNb/a58bWNx7yj7+xunAZeUNGDFUXcgorjTV
         lRlnHSxKw4LHtbs241np/7yGP77pdl7x305N2DAIcJaI+pyn2Fn3aTcRcPGH12u17m1m
         d0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jfYrdTPKMZbK96SOWjVC+rX+6K1DHm/KzMlUaGqdCkw=;
        b=b7bSnBU44S84t+hN1VsMB7aU1kFHCksE/oW/XfxYJgIsxLUwAPU1AAg+1hCWXkJEBh
         ucNw5m67ev7O6/15ukIkNJEMVgIAExvrMH0IwvPih++FjL4K6yX9mDxwXEVHgNf5mzWj
         SGex3VfdOzyC/r99JxyhTKstuwOl49+1f53hXNsjvB7D7Uq5lQDX+ejESh4h3byJOjuz
         9qmQF6qlg507pUH9sDE0sFGFVdHggxqx3q4vkn1vooPv3r5YMiap2uGP43dqwFWn7BuJ
         uVIZ5DnZ1Smk4Edeyy+DuhIky9KCe1Wxw+9hGq+3YWBYMkdZQO+NTqxhs05SKfFbQCcM
         7m5g==
X-Gm-Message-State: AOAM533t9Ud+6XS5NKlF0qednLNUtsU9z/Ybqqc4ljp6kZyHqH/rMV4P
	3v/Wi7gYiSdHiPF9U1KY49A=
X-Google-Smtp-Source: ABdhPJzJVAFILxIYtGbynUNUhQHwI2fH9uUHuUb1MdMFmdDbiekSZtZNli0tzavpO8qg98IXWDJc+A==
X-Received: by 2002:a37:8c9:: with SMTP id 192mr7524631qki.428.1604970498896;
        Mon, 09 Nov 2020 17:08:18 -0800 (PST)
Return-Path: <natechancellor@gmail.com>
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id k3sm6774156qtj.84.2020.11.09.17.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 17:08:18 -0800 (PST)
Date: Mon, 9 Nov 2020 18:08:16 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>, linux-fsdevel@vger.kernel.org,
	Tom Rix <trix@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sysctl: move local variable in proc_do_large_bitmap() to proper scope
Message-ID: <20201110010816.GA2018112@ubuntu-m3-large-x86>
References: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 08:11:07AM +0100, Lukas Bulwahn wrote:
> make clang-analyzer caught my attention with:
> 
>   kernel/sysctl.c:1511:4: warning: Value stored to 'first' is never read \
>   [clang-analyzer-deadcode.DeadStores]
>                           first = 0;
>                           ^
> 
> Commit 9f977fb7ae9d ("sysctl: add proc_do_large_bitmap") introduced
> proc_do_large_bitmap(), where the variable first is only effectively used
> when write is false; when write is true, the variable first is only used in
> a dead assignment.
> 
> So, simply remove this dead assignment and put the variable in local scope.
> 
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change to object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on v5.10-rc3 and next-20201106
> 
> Luis, Kees, Iurii, please pick this minor non-urgent clean-up patch.
> 
>  kernel/sysctl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index ce75c67572b9..cc274a431d91 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -1423,7 +1423,6 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
>  			 void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	int err = 0;
> -	bool first = 1;
>  	size_t left = *lenp;
>  	unsigned long bitmap_len = table->maxlen;
>  	unsigned long *bitmap = *(unsigned long **) table->data;
> @@ -1508,12 +1507,12 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
>  			}
>  
>  			bitmap_set(tmp_bitmap, val_a, val_b - val_a + 1);
> -			first = 0;
>  			proc_skip_char(&p, &left, '\n');
>  		}
>  		left += skipped;
>  	} else {
>  		unsigned long bit_a, bit_b = 0;
> +		bool first = 1;
>  
>  		while (left) {
>  			bit_a = find_next_bit(bitmap, bitmap_len, bit_b);
> -- 
> 2.17.1
> 
