Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.4853.1605277024956504740
 for <linux-safety@lists.elisa.tech>;
 Fri, 13 Nov 2020 06:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: mcgrof@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id h16so3100307pgb.7
        for <linux-safety@lists.elisa.tech>; Fri, 13 Nov 2020 06:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=muGv9UA2yOWJO8OBFbyd4k8hs7CA6S1+a06CR/bKjo0=;
        b=oiKzlJK77oLAgEH9ZQ0zoG/0jrq+LbXB7Hj7slwbq8+sMLgc9O/nlmCodQpTven5Po
         XWMXTQwoofxtJ+Viv8mhuWqrmuT2gTCQdZhRJW/NGCUneYjYt7wAlDmb8GRM8rQRe6/e
         l+Jwl+QGTzlB6AIqZmYcqq5hzwgMZA34mDvW/X5f/HQYaTA3Qn4rD8f3xNmj6dkwRq4f
         yhfPovpWiKrhM4XLeKireh1yrGAgEVxRcZBPvcaUFB11EEFU2mlLsMc7nWF3GPOj4Iu+
         CCDQMormViFcl8a6gI3TmTc9K2nHgvuTzSwJxEOD6k9D2s5Zrtnbrpa7AHe8RYf9wrWs
         CEGw==
X-Gm-Message-State: AOAM531oBMiV2s6nEYu0swaWdPVtUvYezF10GQI/pLyFmLQfvnGDiISv
	1IbwEd453HApo6b3wQ+mTCk=
X-Google-Smtp-Source: ABdhPJwf+kmdqj5fHCuVENwx3brb/hOK2x7YpCjn9y4whApg85xDwT+NwgTnI+3VzgDEqylCFRsE5Q==
X-Received: by 2002:a05:6a00:c8:b029:18b:b0e:e51 with SMTP id e8-20020a056a0000c8b029018b0b0e0e51mr2143971pfj.37.1605277024230;
        Fri, 13 Nov 2020 06:17:04 -0800 (PST)
Return-Path: <mcgrof@gmail.com>
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id mt2sm11475078pjb.7.2020.11.13.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:17:03 -0800 (PST)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
	id 3854240715; Fri, 13 Nov 2020 14:17:02 +0000 (UTC)
Date: Fri, 13 Nov 2020 14:17:02 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>, linux-fsdevel@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sysctl: move local variable in proc_do_large_bitmap() to proper scope
Message-ID: <20201113141702.GI4332@42.do-not-panic.com>
References: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
 <e0cf83dc-2978-70ce-aeb2-37873cc81c03@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e0cf83dc-2978-70ce-aeb2-37873cc81c03@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Nov 09, 2020 at 05:26:37PM -0800, Tom Rix wrote:
> 
> On 11/8/20 11:11 PM, Lukas Bulwahn wrote:
> > make clang-analyzer caught my attention with:
> >
> >   kernel/sysctl.c:1511:4: warning: Value stored to 'first' is never read \
> >   [clang-analyzer-deadcode.DeadStores]
> >                           first = 0;
> >                           ^
> >
> > Commit 9f977fb7ae9d ("sysctl: add proc_do_large_bitmap") introduced
> > proc_do_large_bitmap(), where the variable first is only effectively used
> > when write is false; when write is true, the variable first is only used in
> > a dead assignment.
> >
> > So, simply remove this dead assignment and put the variable in local scope.
> >
> > As compilers will detect this unneeded assignment and optimize this anyway,
> > the resulting object code is identical before and after this change.
> >
> > No functional change. No change to object code.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on v5.10-rc3 and next-20201106
> >
> > Luis, Kees, Iurii, please pick this minor non-urgent clean-up patch.
> >
> >  kernel/sysctl.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> > index ce75c67572b9..cc274a431d91 100644
> > --- a/kernel/sysctl.c
> > +++ b/kernel/sysctl.c
> > @@ -1423,7 +1423,6 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
> >  			 void *buffer, size_t *lenp, loff_t *ppos)
> >  {
> >  	int err = 0;
> > -	bool first = 1;
> >  	size_t left = *lenp;
> >  	unsigned long bitmap_len = table->maxlen;
> >  	unsigned long *bitmap = *(unsigned long **) table->data;
> > @@ -1508,12 +1507,12 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
> >  			}
> >  
> >  			bitmap_set(tmp_bitmap, val_a, val_b - val_a + 1);
> > -			first = 0;
> >  			proc_skip_char(&p, &left, '\n');
> >  		}
> >  		left += skipped;
> >  	} else {
> >  		unsigned long bit_a, bit_b = 0;
> > +		bool first = 1;
> 
> This looks fine, but while you are here how about setting, to match the type
> 
> first = true
> 
> And then only clearing first once
> 
> if (!first)                                                                            
>   proc_put_char(&buffer, &left, ',');
> 
> else
> 
>   first = false
> 
> Instead of at every loop iteraction

Thanks for your patch Lukas!

Agreed, please resend with that change as requested by Tom. And also
please add Andrew Morton <akpm@linux-foundation.org> to your To address.

  Luis
