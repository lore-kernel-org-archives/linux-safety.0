Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by mx.groups.io with SMTP id smtpd.web12.21564.1604971602879328029
 for <linux-safety@lists.elisa.tech>;
 Mon, 09 Nov 2020 17:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a5cXAsAz;
 spf=pass (domain: redhat.com, ip: 216.205.24.124, mailfrom: trix@redhat.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604971602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t05JtdUe9+ueKiWP7Cd0WcO5v2xombvbloOzDhjvSkg=;
	b=a5cXAsAzZcCX5n0dE5L76oRC/nEsXkbQ1QPfRmQ2d7qjLx9/a91RlDyiorZ7oAH4kYj8vX
	wRCjN0c7U5fDHoU6F8QtFoNmJtQVzJqf6/nzYOZzIOWRJT1I68ysPoY07mzoQR77m+iDEh
	UOiIAW8hRwJASoWfVI5vCCGffOkbyLI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-chCupInAO06vEZWh0O7FiA-1; Mon, 09 Nov 2020 20:26:40 -0500
X-MC-Unique: chCupInAO06vEZWh0O7FiA-1
Received: by mail-qt1-f199.google.com with SMTP id l67so6360344qte.6
        for <linux-safety@lists.elisa.tech>; Mon, 09 Nov 2020 17:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=t05JtdUe9+ueKiWP7Cd0WcO5v2xombvbloOzDhjvSkg=;
        b=a5DJLos81Gmfsnx7vW3R+9hyFn+fjE7egC7xdzxw+vHriXU2CaaMeRKHFBYm1FKobH
         GaXOC0eNYVa+Jc1C3JHtfYsFpxBang1ZI0HuFnfb/EeZ4FMRUv/DUn6yxjHtQwFnkMXP
         +uKWTmPtXpXC2ndNk0oj9yVMXiHmm/gmNBijGD86z7eHVKqigOqupio0MjYg2FVsLHSB
         VkwvU6Wmet8XYEANckR/lPvjeoxmGjdnwbB1j7P+mt/JWio2hjZGNOM2jaZCMbKUuqGD
         hQpsErIiReYwMkH5accC2lrUuANO8z/+LbwsEC5c6UOglmjIEQvwmjBv8b3Zq2/yWWuK
         /Oqg==
X-Gm-Message-State: AOAM533zemCZwkdF+2xWPERJCU7edpTW3JaPaUFGvntJICSWyRBP+EPr
	w5YtzIFX8HNAvBFNA5dHbq82HmnF7vlElmynVYkXt0hQFQa8cPVg0Y7BQ5cpga7rDF+ZSdbwnbF
	yziH6uMdbiFnY9gplq7rGaTr4pg==
X-Received: by 2002:a05:6214:12e8:: with SMTP id w8mr12148217qvv.16.1604971600056;
        Mon, 09 Nov 2020 17:26:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyId0TiOzOqiFGE0H+bF95RmGtjd6vw5jTrtLt0Hd3sykGjZMSOHupvlqQGlMR7Zd+CbsLsbQ==
X-Received: by 2002:a05:6214:12e8:: with SMTP id w8mr12148196qvv.16.1604971599811;
        Mon, 09 Nov 2020 17:26:39 -0800 (PST)
Return-Path: <trix@redhat.com>
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f56sm5363152qta.49.2020.11.09.17.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 17:26:39 -0800 (PST)
Subject: Re: [PATCH] sysctl: move local variable in proc_do_large_bitmap() to proper scope
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>,
 Iurii Zaikin <yzaikin@google.com>, linux-fsdevel@vger.kernel.org
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
 linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
References: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <e0cf83dc-2978-70ce-aeb2-37873cc81c03@redhat.com>
Date: Mon, 9 Nov 2020 17:26:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/8/20 11:11 PM, Lukas Bulwahn wrote:
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

This looks fine, but while you are here how about setting, to match the type

first = true

And then only clearing first once

if (!first)                                                                            
  proc_put_char(&buffer, &left, ',');

else

  first = false

Instead of at every loop iteraction

Tom

>  
>  		while (left) {
>  			bit_a = find_next_bit(bitmap, bitmap_len, bit_b);
