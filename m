Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.5386.1602655446889722410
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 23:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=snXvOpe+;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id g12so2224015wrp.10
        for <linux-safety@lists.elisa.tech>; Tue, 13 Oct 2020 23:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=BRFp+qtxt1bOWmzHW4PaWe+ZSDH0aF1I5I7VcpGQ3dw=;
        b=snXvOpe+aX6bedT29AhG/1M3BUHOiHp2kbeYlUfyDIbHg28S52hSkck5s7QQK1elEB
         e8NbPAqAEGpzKW39fwqhPI/vftevSx/5/lClGueX5Z7crSGFgSF4Wex3TgyzSxoHnQxN
         kxHFA8pK4v0WxK2889LrMkO/xaIzVc9H8c+HlwX4cu2rL+TLAmUm1yYFvXiV6ZhlZkSc
         1oEg+RFcWyS+rJuYSXOxKn5cfFvzb3OIA8t7b28Lc5MN+mvpqiQ9bCPrUmUfYAMclYhN
         nktsHmHstuXkLedzzlkPWvvHeoVO8lI2B5bDXjUHJnwbbCKNe0IY3Umcff78HSDF0HQq
         fOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=BRFp+qtxt1bOWmzHW4PaWe+ZSDH0aF1I5I7VcpGQ3dw=;
        b=Ac333natOvi/Poqagim9sNe01jB0LuQZv42z9f838B3SMYGG1/fqqEt9Vyxpe93LQ8
         5a/xgP7BEqQAk1Z/q+p97K9CtbiAV4rLO+UAEJURBXJb/EAYm1OFri9Ch11s6UMJZhdd
         AoSzcQWcfbuRxtfBCkSzzlxWgEffCKwh6UTU0+TmKN+fbkYjaYDKvj2UorwRJDvTsMw7
         NFlWaovbDWm87PLK/bLn33hhGOkVMrMrneDiRJV89T3qRqFCbrffSZ84RlIcs8DxSLhG
         AYAfqsmqZ8QFZSMS3qRIfmhI7kJnCSYClxECABF1o6mzM7bSn9ebhOD343ftHJb3Egz3
         /f+w==
X-Gm-Message-State: AOAM531nZ54XFiRp+9r8atqz087jQai8nJtU/scmWIquZmQBTukmSYU3
	Hy3s+vkpMW26HIfKcgM9HhM=
X-Google-Smtp-Source: ABdhPJwGjc7uJH+FEKCPuBfoEJdLEh3H1Vwq9xhEMuiG2YIIzmYZCUhD7DUX2obraoVNp68Yu47/aA==
X-Received: by 2002:adf:ec50:: with SMTP id w16mr3385934wrn.265.1602655445461;
        Tue, 13 Oct 2020 23:04:05 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
        by smtp.gmail.com with ESMTPSA id p21sm1951610wmc.28.2020.10.13.23.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:04:04 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 08:04:03 +0200 (CEST)
X-X-Sender: lukas@felia
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
cc: linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [RFC PATCH 0/2] improve bust_spinlocks dependability
In-Reply-To: <20201013094938.356837-1-gabriele.paoloni@intel.com>
Message-ID: <alpine.DEB.2.21.2010140803240.6186@felia>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Paoloni, Gabriele wrote:

> This patchset provides a kernel-doc documentation format
> for bust_spinlocks() and fixes a weakness where the global
> variable oops_in_progress gets unconditionally decremented
> 
> Gabriele Paoloni (2):
>   bust_spinlocks: add kernel-doc format doc
>   bust_spinlocks: do not decrement oops_in_progress unconditionally
> 
>  lib/bust_spinlocks.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>

Patchset looks good to me!

I would love to see the feedback you get.

Lukas
 
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
