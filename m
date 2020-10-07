Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.1459.1602096248968101562
 for <linux-safety@lists.elisa.tech>;
 Wed, 07 Oct 2020 11:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@chromium.org header.s=google header.b=WXlaV9pj;
 spf=pass (domain: chromium.org, ip: 209.85.215.196, mailfrom: keescook@chromium.org)
Received: by mail-pg1-f196.google.com with SMTP id 34so1948717pgo.13
        for <linux-safety@lists.elisa.tech>; Wed, 07 Oct 2020 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X8jO+k78iPi+PQAecC0Q3ap/SytXosdxrChjraSoqaw=;
        b=WXlaV9pjXkhbYj7Tg3Q1c0hwqAynsaOgzckoDSnGldqENxpknhYFK+5HgLYSpow9GR
         FA1COQvpB8NLwrZ6HZ5yEyhxNDEVzPNlCrGNETZoLg/yTH6YMwVaZfS6Cd5ikwVO95aL
         lHiAXKSV918g2lozIMNiL3bie1lJw3NAvn3fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X8jO+k78iPi+PQAecC0Q3ap/SytXosdxrChjraSoqaw=;
        b=a8/8p4L5CrQvj4C6pAjY6zU91YmTReT4tacYuTRAJHw+t1Y+I+9qkSX5a4H9fwavPx
         BchyYST1JFfSnzJWThRC0yqs6gv6MQNrxOY4keQfDbZdG14wn+2mMyaHKYXfDm0R0RdQ
         jyQvTRDT0Df0XhF5bHVd+xjDfTKqWx0a6B5NoX0zQkLzmkvdoE2j/kxEH9UL4Si4rzjw
         qjgrx1CPc8uWQI+qjwAEpSKJch12kt3YdxZ1lZ8oSC0cuUjNI4jwcTvdGfIneBBLQULo
         MtGdcHqijWMeIbjyE8yw3o/KivoOCew0ZsqtPKeJGP0kYB7z/arvGwrrit6DYXgr5ZyH
         zO7Q==
X-Gm-Message-State: AOAM530SV32Sd33hYgXpNZFHMotcWLyc1mqQIrmLh98jrFfetK0Cde4D
	udmCIVtldCX6UrtdpDaNF5XzoQ==
X-Google-Smtp-Source: ABdhPJxnc93bpj6O2XDgoB+4iJqQIaVqQaTINKkUrGuNUPDT7MwB5tqBz0QOGR7AhWiAKFDQbgzAJw==
X-Received: by 2002:a05:6a00:d2:b029:152:5ebd:426 with SMTP id e18-20020a056a0000d2b02901525ebd0426mr4181620pfj.5.1602096248247;
        Wed, 07 Oct 2020 11:44:08 -0700 (PDT)
Return-Path: <keescook@chromium.org>
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c9sm4014370pgl.92.2020.10.07.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 11:44:07 -0700 (PDT)
Date: Wed, 7 Oct 2020 11:44:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
	linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] kernel/sysctl.c: drop unneeded assignment in proc_do_large_bitmap()
Message-ID: <202010071144.FA87F25D5D@keescook>
References: <20201007151904.20415-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201007151904.20415-1-sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 07, 2020 at 04:19:04PM +0100, Sudip Mukherjee wrote:
> The variable 'first' is assigned 0 inside the while loop in the if block
> but it is not used in the if block and is only used in the else block.
> So, remove the unneeded assignment and move the variable in the else block.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
