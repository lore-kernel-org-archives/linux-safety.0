Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.9784.1603777000112193674
 for <linux-safety@lists.elisa.tech>;
 Mon, 26 Oct 2020 22:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kz3v3GxP;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id s15so417748ejf.8
        for <linux-safety@lists.elisa.tech>; Mon, 26 Oct 2020 22:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=jIL54r78pikRo/JTXxGl1fcIhOZLGqrpHZGTlGuBFk8=;
        b=Kz3v3GxPun9b+NJXcTP8SsD3BPsAxMfuFZF0UP4O2M2B8Azh04NsBxOgTzPvpylNSW
         puaY0Z5y4CR/ZX/HeeZV0Kqrixh13tbvjx6CqKbrs6plp/UCt1vlkmxagAtwqrvcS7c6
         gTmzYv3VQho8O9Eqv7G+pn+lp7khETXR4+7CpHnn0HAW3MUzJcAsCAW7xB+jI18i+ugB
         I5dwpdG9VpoN5/U3nMnHsglXyj1s02h7/21hKJYU9TnKhNca17c3eMZgAIRlxI+dKs9+
         MQfqBLz19EmixD16XhATMu+3eJedy8GtZUhTavlwu++HnzhvP6FO3vTN8slUqgGK8Ttt
         XCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=jIL54r78pikRo/JTXxGl1fcIhOZLGqrpHZGTlGuBFk8=;
        b=ArIn9/ZUqZ17364BQROA4TtHgRr3qAcP546n1rPELU01qlU+EPHljg1/5kcw2xeGBl
         UsG3tZOqd1GPHkRjLASnlOwcJ812vYqUZKaUrzphIAhHpeF+CrZwHdps/YvsFSIFE8mv
         m69Iq2X2s4xmJcptTNi1O0dVNQHauEMvDNFB1+3Sn5rJ9KeVDw1OPm6rk5ySrn00asn/
         XLQp3SNr51DTKQpLdix3ysrHWzzf8UJ3O0/IAek34zeJTjscz2ijhrQN1QP5u+6s2ELi
         mje2MAh1KfP35ecxLxN6uAdEDC2q7hTdBRMJvex7i0Cc8IGzzuZ2D8UQDIIQyxmFNnTr
         He1g==
X-Gm-Message-State: AOAM531LpBT8atwfnQkkW5UeWlkayZyjhgVEzT5cPFF6PaqA4NhNY0DI
	calzJ2ykQ/wHOn05tz5le5s=
X-Google-Smtp-Source: ABdhPJxGS5XKLrp3F80NTxU/O6YlN/ZhT+q3sj0F3iGZd/R7oHLj9Fef7HYjGtN6nPXMsTNWNhEgGA==
X-Received: by 2002:a17:906:a454:: with SMTP id cb20mr737978ejb.137.1603776997769;
        Mon, 26 Oct 2020 22:36:37 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2de9:3700:3160:107b:5425:634f])
        by smtp.gmail.com with ESMTPSA id k10sm260087ejh.32.2020.10.26.22.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 22:36:37 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 27 Oct 2020 06:36:35 +0100 (CET)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] misc: hisi_hikey_usb: use PTR_ERR_OR_ZERO
In-Reply-To: <20201026180026.3350-1-sudipm.mukherjee@gmail.com>
Message-ID: <alpine.DEB.2.21.2010270625520.7937@felia>
References: <20201026180026.3350-1-sudipm.mukherjee@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 26 Oct 2020, Sudip Mukherjee wrote:

> Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
> we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
> doing 'return 0'.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  drivers/misc/hisi_hikey_usb.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
> index cc93569e601c..989d7d129469 100644
> --- a/drivers/misc/hisi_hikey_usb.c
> +++ b/drivers/misc/hisi_hikey_usb.c
> @@ -168,10 +168,7 @@ static int hisi_hikey_usb_parse_kirin970(struct platform_device *pdev,
>  
>  	hisi_hikey_usb->reset = devm_gpiod_get(&pdev->dev, "hub_reset_en_gpio",
>  					       GPIOD_OUT_HIGH);
> -	if (IS_ERR(hisi_hikey_usb->reset))
> -		return PTR_ERR(hisi_hikey_usb->reset);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(hisi_hikey_usb->reset);
>  }
>

(Just among us, not with the kernel maintainers...)

I think such patches should be also CCed to kernel-janitors.

For the next patch: could you include the specific coccinelle rule upon 
which you reacted?

I think in the very long-term future, it would be nice if we can somehow 
link a finding from a specific tool (with some kind of URI) in the commit 
message or so.

E.g., https://findings.kernel.org/coccinelle/somehash/ and then it shows 
the specific finding you looked at in a specific version and links to
the reported findings in other runs and versions.

(more realistically, it would probably end up in kcidb or so...)

That would be a nice tool to allow good traceability of the work at low 
additional effort.

Well just a random thought... What do you think?

Lukas

>  static int hisi_hikey_usb_probe(struct platform_device *pdev)
> -- 
> 2.11.0
> 
> 
> 
> 
> 
> 
> 
