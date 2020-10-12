Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.41013.1602510591833992037
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 06:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=phQ8c5GM;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id t21so17007630eds.6
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=HsbAp6qd7g4JTk6QFw04+VFZUaG3bIXSc1NpoNbfqf8=;
        b=phQ8c5GMkXNgAEiW9pg3lAWEQS1b60Omw7uWqN0NQUjcppagPTYtroAw8rKpJsTb9G
         +QD9RAx2vJoncFxbg7zUExmhvBJh9nr0yR8gsAZ+SJseY4NuhdNgHnBcmFPOgFnizuzQ
         qRWHPuXVuZfx+32H/GUCF7uWBhp7NMaJQyeeZBxbPQx2vFXSU00hdF39rgfPJGfhKy55
         EdmRUfZY16sG7yJvjcvET3KkhQ5rBeWMGrGfh6X0kZE747vjAP6eRX24+chUkhcZbMGw
         4/5ETyAd+LZsEtsdqJGe764PuvmLDlQASUw7tIvKy3SsBWyY4wCYUlUdQXVNqKdGY0UK
         T2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=HsbAp6qd7g4JTk6QFw04+VFZUaG3bIXSc1NpoNbfqf8=;
        b=YOLuzctyxbgNWxhg8GE15082XTf/EPG1LsqEw+ChE7Wnrcu2MAmP4zPcD/3/gzXeSj
         b2Ix6HaEoF+Q32kPz4+ec9zp7mu39IbhcjCZufShJKfu1mFz5wAuqyL7CtgwgZUuEDFY
         PUCh6idE63+vfgnsLbcBw4IKlnRR0i1GOgJ2T61BbGP/3XDGP6ZUfjwScnxvEzWYA0zB
         GuqpNy0fJVF7X2f2XhjRSbSlE+VJ4HIBbg3venx9833Ab4Ko2gRk0PU2Y9ESjtDIz+5V
         cSaO/L5tmNTv1vVYF4Jl+8namv5ROfu5cNOZypjZk7ywQKelNUfu4LyfPcflb7zUoKfL
         e1LA==
X-Gm-Message-State: AOAM532Jyr8a4XWEZO35LBiUcYrIC+Ha0YMK5xIFJvVaNzQTGviEK4GA
	S0EsKahodQrbEZqyw95sBoc=
X-Google-Smtp-Source: ABdhPJxFkYpU7K3AS5LxjIDvju41ZYqpsBIoDPX+SHxU23/hUALjax3K659HVU/Z5ZE7dilKv7q/kw==
X-Received: by 2002:aa7:cd4f:: with SMTP id v15mr13718665edw.243.1602510590180;
        Mon, 12 Oct 2020 06:49:50 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d57:fc00:8472:203c:3ecb:c442])
        by smtp.gmail.com with ESMTPSA id u17sm8233872ejj.83.2020.10.12.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 06:49:49 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 15:49:48 +0200 (CEST)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, 
    Tony Nguyen <anthony.l.nguyen@intel.com>, 
    "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech, 
    intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] e1000: drop unneeded assignment in e1000_set_itr()
In-Reply-To: <20201011212326.2758-1-sudipm.mukherjee@gmail.com>
Message-ID: <alpine.DEB.2.21.2010121546470.6487@felia>
References: <20201011212326.2758-1-sudipm.mukherjee@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 11 Oct 2020, Sudip Mukherjee wrote:

> The variable 'current_itr' is assigned to 0 before jumping to
> 'set_itr_now' but it has not been used after the jump. So, remove the
> unneeded assignement.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  drivers/net/ethernet/intel/e1000/e1000_main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
> index 5e28cf4fa2cd..042de276e632 100644
> --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> @@ -2632,7 +2632,6 @@ static void e1000_set_itr(struct e1000_adapter *adapter)
>  
>  	/* for non-gigabit speeds, just fix the interrupt rate at 4000 */
>  	if (unlikely(adapter->link_speed != SPEED_1000)) {
> -		current_itr = 0;
>  		new_itr = 4000;
>  		goto set_itr_now;
>  	}

Alternatively, you could just inline the max(...) into the switch and 
completely drop the current_itr definition.

But your solution probably does the job: it is a "No functional change" 
commit.

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Lukas

> -- 
> 2.11.0
> 
> 
> 
> 
> 
> 
> 
