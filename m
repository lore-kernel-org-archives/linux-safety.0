Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.5387.1602655371554070152
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 23:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TqjTLDuR;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id l15so924664wmh.1
        for <linux-safety@lists.elisa.tech>; Tue, 13 Oct 2020 23:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=sE8euZC1UiDYiHZS9JyzHXPRFpbkFawhimYQDLEv9vs=;
        b=TqjTLDuRNvVjXXcKngEtn/CPR1U3jdmrTSKIkRRzCHVsh+pjImeVbQ+bjx3MM2sYs2
         /vSFhQoJxIMl6i+hVeflaCXapN9SYU2PfPO1vj3HmkYNOkwa0my4al+/2yQPPe0Nbl1z
         j0cRlB2phxCGc0xHS5k/7XdUa4agEsdoHJjTgfmvvCZ8rEUvAb0UFac9k3N8Uyx206gx
         W0Ghc3T38tTa3yFWY/Espmsad7yuyov1svw16JfkQZrxQlbGxfDhUHtOkAD2s3wWGqN/
         edFOFONvD6pbmkx7T1fP/oFJiWXpV74J8r8H0iaHDvmB7XK9Yc+uzXCmsu75qnudGIk1
         rqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=sE8euZC1UiDYiHZS9JyzHXPRFpbkFawhimYQDLEv9vs=;
        b=pf82IQ58FJTuBPISdrOqKBKfqDism+6z2mMzDeXp/K4l1kxv90fTntrxlK2rrRESvE
         9yo6ahLostdKPKCI7qPkdVb5yRtqiJSx0iNsQXmD828goj5T/OsjM81D6JXTMkS9xzW8
         UnPZLNyif2NcTbklKrfVIzHtRdLIACvUf2GuLUczEff2BYqeC98jyQ3fodOfWrZXt62a
         LHz56kZPD3AzweFRRuCfr+NxZPpxp08oYJQA4s0NvsL0+xWBf2mt1V967I/VCORqhDl3
         t7x/EPLzhtHV87FfU9NM1AbJAnUY/VM/v6eJZ+3/hqpCV04Gl0a+s09Si7I1bQlb/NCC
         jGEA==
X-Gm-Message-State: AOAM530uIPlwEfWpJZ4czgK3xCu5sqH9us5bUkLIllJh2NuUT0AiadNa
	xX6WP0A1SXcMP+vDtwI1XJ4=
X-Google-Smtp-Source: ABdhPJyrsQ/cH2wmV4PgDMZVPQWlpOIz9ocLgYL9G/GxW9Awhc0bYPx0kJON/XCb1JZxBMG4cahD5A==
X-Received: by 2002:a1c:8093:: with SMTP id b141mr1649091wmd.139.1602655370071;
        Tue, 13 Oct 2020 23:02:50 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
        by smtp.gmail.com with ESMTPSA id d2sm3139293wrq.34.2020.10.13.23.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:02:49 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 08:02:48 +0200 (CEST)
X-X-Sender: lukas@felia
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
cc: linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [RFC PATCH 1/2] bust_spinlocks: add kernel-doc format doc
In-Reply-To: <20201013094938.356837-2-gabriele.paoloni@intel.com>
Message-ID: <alpine.DEB.2.21.2010140753210.6186@felia>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com> <20201013094938.356837-2-gabriele.paoloni@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Paoloni, Gabriele wrote:

> In the ELISA Linux Foundation project we are trying to
> improve the functions' documentation to make it more suitable
> to derive functions' specs and write unit tests. This is needed
> to make Linux more usable in functional safety systems.

This motivation is very personal but I think it is inappropriate for a 
commit message.

How about:

Explain the special purpose of bust_spinlocks().


> So I am adding a proper kernel-doc format for bust_spinlocks.
> 
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> ---
> With respect to this patch I have a question on how to set
> the function context; i.e. I don't know if it can be executed
> in any context or if it has limitations.
> ---
>  lib/bust_spinlocks.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> index 8be59f84eaea..594b270161d9 100644
> --- a/lib/bust_spinlocks.c
> +++ b/lib/bust_spinlocks.c
> @@ -5,8 +5,6 @@
>   * Provides a minimal bust_spinlocks for architectures which don't
>   * have one of their own.
>   *
> - * bust_spinlocks() clears any spinlocks which would prevent oops, die(), BUG()
> - * and panic() information from reaching the user.

This description reads slightly nicer than the new one below.

>   */
>  
>  #include <linux/kernel.h>
> @@ -17,6 +15,15 @@
>  #include <linux/vt_kern.h>
>  #include <linux/console.h>
>  
> +/**
> + * bust_spinlocks - increases or decreases oops_in_progress.
> + * if oops_in_progress != 0 spinlocks which would prevent

Do not explain the implementation, explain the intent.

> + * oops, die(), BUG() and panic() information from reaching
> + * the user are busted.
> + * @yes: input flag; if zero decreases oops_in_progress,
> + * otherwise increases it.

I think the argument name 'yes' is terrible, and the documentation adds 
nothing to resolve the existing terror.

What is the semantics of this argument?

In which cases should I pass 0 as argument and which cases not?

If it is not possible to explain that here, let us not do it and then 
document other functions instead.

> + *
> + */
>  void bust_spinlocks(int yes)
>  {
>  	if (yes) {
> -- 
> 2.25.1
> 
> ---------------------------------------------------------------------
> INTEL CORPORATION ITALIA S.p.A. con unico socio
> Sede: Milanofiori Palazzo E 4 
> CAP 20094 Assago (MI)
> Capitale Sociale Euro 104.000,00 interamente versato
> Partita I.V.A. e Codice Fiscale  04236760155
> Repertorio Economico Amministrativo n. 997124 
> Registro delle Imprese di Milano nr. 183983/5281/33
> Soggetta ad attivita' di direzione e coordinamento di 
> INTEL CORPORATION, USA
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 
> 
> 
> 
> 
> 
> 
