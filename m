Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.7630.1604639563483302712
 for <linux-safety@lists.elisa.tech>;
 Thu, 05 Nov 2020 21:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gH4mN2yO;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: sergey.senozhatsky@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id b12so128307plr.4
        for <linux-safety@lists.elisa.tech>; Thu, 05 Nov 2020 21:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qaz5JfSXEexVzd3vu4/X1zvrfhtSmuN9aWiTUHv9SJA=;
        b=gH4mN2yOR56HxWAUwIJnrOftunZr9+x3k3rBsiRJpCEksBtaVdkAckIA/ShkL3YK2I
         mkGL3Hy4IUaQz762pvnkx4KwUGB3BGF80qajcWfFjd3npfm501lmjQmXotnZ6fWWFPTv
         HtGAsH4Nr6zqgcBut3cJLOkkA6HjcjzOeiBgQOQmGIkHpBIZk7SfvgFKzre4bD6er3ya
         gXaAFbMsf1CME3CF83weO8ROcpeFuEPeflYeITDaZa9G75buQ0cI5aO6IItXmjHRFbEM
         99PGhazX1x6zc9vZ5TEqTrOmrufIVnDJhwjCUGQym7gCog8MXh3QtEriERKx5ZABf9rB
         HpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qaz5JfSXEexVzd3vu4/X1zvrfhtSmuN9aWiTUHv9SJA=;
        b=SBA7fSAhHoU9fyU1gTUaH8DUT3J0VOZBviXOqCRQh1+rPSKkYcNo8KNX/K6vOMU0IR
         Ajt0UK7peRAPqXTOD6ZH1HYiI4Qo8sqNmxlq2WIgGQIY14w4dX/8Kk6yB+q+eJ2buRr2
         BuOXRC8xE1eODFiP0K1H/2LAvK6ZNLurctlPBS9l8qG5UBYbk9EMSzDOcxXB8HiRWgz2
         z0sf7xTJTIN238O6Yp3wAU9B+88nEn9pInWzjXk+4VQrkAK6H0+IPdLYnc9F4uICwg15
         4aQpak+rtyUvhEnRVGwPqLu5YxiSpODa9QCS6rtSb3PruBz38dPcB4aEiAqSB/9toIhk
         f+IQ==
X-Gm-Message-State: AOAM531h6fiOj1M4qsFzug3BaGi2qNlNX7EIlCOkOdx9Tit5fiv81pju
	awQQa176ND0h1OJQ+UDJHPs=
X-Google-Smtp-Source: ABdhPJyn8OECd6Yk2g1TFuxtsKbYq4FLzAeVOngn/1xDW9/NSK6CjFcd/h0m9+vl0XlPDiPDXxLHrQ==
X-Received: by 2002:a17:902:d698:b029:d6:b974:13c5 with SMTP id v24-20020a170902d698b02900d6b97413c5mr339670ply.13.1604639563004;
        Thu, 05 Nov 2020 21:12:43 -0800 (PST)
Return-Path: <sergey.senozhatsky@gmail.com>
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id j184sm320461pfg.207.2020.11.05.21.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 21:12:42 -0800 (PST)
Date: Fri, 6 Nov 2020 14:12:40 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [PATCH] printk: remove unneeded dead-store assignment
Message-ID: <20201106051240.GC4718@jagdpanzerIV.localdomain>
References: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/11/06 04:40), Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
> 
>   kernel/printk/printk_ringbuffer.c:885:3: warning:
>   Value stored to 'desc' is never read [clang-analyzer-deadcode.DeadStores]
>                 desc = to_desc(desc_ring, head_id);
>                 ^
> 
> Commit b6cf8b3f3312 ("printk: add lockless ringbuffer") introduced
> desc_reserve() with this unneeded dead-store assignment.
> 
> As discussed with John Ogness privately, this is probably just some minor
> left-over from previous iterations of the ringbuffer implementation. So,
> simply remove this unneeded dead assignment to make clang-analyzer happy.
> 
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change to object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
