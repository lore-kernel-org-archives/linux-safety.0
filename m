Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web09.9717.1604656309597594207
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 01:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ExjoaigZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: natechancellor@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id n5so551029ile.7
        for <linux-safety@lists.elisa.tech>; Fri, 06 Nov 2020 01:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mc9+iPglmE3qdIFo4WRNtRliEo4jSzg+7hnP+M7PZTA=;
        b=ExjoaigZHr1iLek2ntbaZ9zo9ZO327KqtbfjA9/R1+56ie74Ywo3Yw7OYI8gHfUNE3
         h5TYu5HhbkJAFAjHaM3PRneI16uRXn1mCqacMPs6A5oS0ImgQ7Oeb3+gkyuYLDbognRF
         WczLwrRArtAODg7+J8DKcsKo9u+0XKkHEtEwEhhhpayGAfdFefE/mN+ORsFCJt2AkxK0
         BQOgi9+vfjxpAoYUMxTcXHTa1fipjPr/jXl4bG4y6FtpYWvBqqcVOiC88kUVleRO4dGl
         KD6oZrrXxnTrdiBkwzsQH93IdCA4ROqqHgGPwzI+c0mgLfFiou7lUQsZ2V5Lj/5X+d/E
         G5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mc9+iPglmE3qdIFo4WRNtRliEo4jSzg+7hnP+M7PZTA=;
        b=BViO2yoYvXjI56oSGPbie4mihQMeNQ2kLG9csaOB/Tr+Hdy958A0gf7nL9PtH7peJw
         299AB7GBMI90jz7BABEHhummyNg1sJubIYxCjjDK45gyp+1c+hJ5Hj+wrzAzMcaX88MX
         6srry1MFkkieZaK9c34MGIZqWDpyLhI+PPa3KPnpjsINnwYWsJwD1G8kRL4oEwrAqMzI
         eNJe9nItw1wiW4EZrnL1qm8KOu2f6GU15lsUn8vGmWmebp8E6XvNaU++PN7Tsh0XJia+
         9rVHb6ZiYzRBW1Z1YAKgsZ/RGtGRdJOGukWwDWvNGGR3ORiC8f0NrzuACawKsTbucYri
         2kGQ==
X-Gm-Message-State: AOAM530KIfRu2D/cIl6tECMqD/hvNsPcxZZUVyuXJ0QVR08f2yjtp6Bd
	IIOwJ7KXCKN5cZpOFToz0g4=
X-Google-Smtp-Source: ABdhPJyD9utqj/Aul5/LelRYf7I0nxuWizINITvfinG5j/d04iFDD8pBVqDZE7QMv02cwp43jCR6Zg==
X-Received: by 2002:a92:ba14:: with SMTP id o20mr781162ili.76.1604656309005;
        Fri, 06 Nov 2020 01:51:49 -0800 (PST)
Return-Path: <natechancellor@gmail.com>
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id m10sm697502ilg.77.2020.11.06.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 01:51:48 -0800 (PST)
Date: Fri, 6 Nov 2020 02:51:46 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Tom Rix <trix@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: remove unneeded dead-store initialization
Message-ID: <20201106095146.GA3269500@ubuntu-m3-large-x86>
References: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 10:48:20AM +0100, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
> 
>   drivers/clk/clk.c:423:19:
>   warning: Value stored to 'parent' during its initialization is never read
>   [clang-analyzer-deadcode.DeadStores]
>           struct clk_core *parent = ERR_PTR(-ENOENT);
>                            ^
> 
> Commit fc0c209c147f ("clk: Allow parents to be specified without string
> names") introduced clk_core_fill_parent_index() with this unneeded
> dead-store initialization.
> 
> So, simply remove this unneeded dead-store initialization to make
> clang-analyzer happy.
> 
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change to object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Indeed, parent is always assigned a new value before that one is read.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on current master and next-20201106
> 
> Stephen, Michael, please pick this minor non-urgent clean-up patch.
> 
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f83dac54ed85..ba35bf35bcd3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -420,7 +420,7 @@ static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
>  static void clk_core_fill_parent_index(struct clk_core *core, u8 index)
>  {
>  	struct clk_parent_map *entry = &core->parents[index];
> -	struct clk_core *parent = ERR_PTR(-ENOENT);
> +	struct clk_core *parent;
>  
>  	if (entry->hw) {
>  		parent = entry->hw->core;
> -- 
> 2.17.1
> 
