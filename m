Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.10352.1603781971260044788
 for <linux-safety@lists.elisa.tech>;
 Mon, 26 Oct 2020 23:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NEcAMFs3;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id e17so560299wru.12
        for <linux-safety@lists.elisa.tech>; Mon, 26 Oct 2020 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=4PeQAWWuYS/MWPTCKu5ob6YvoGvcUynBjWkXWMhZ0tk=;
        b=NEcAMFs3LjVruiLrzO7+Swoi0lYGzf32SOfQAjvtnZiMLBvEytWuPeNFevkUZm5Hzp
         12iy17q1gHPdwoh5Ygxl3H1991m0eRoYg1K5vVtt+62Fg/WVC5sruKV7dbt0G/0B5lDL
         h4hRPgD5Ki8ohwCcTTF50WXlheWTUNOJnlO5zW2tyNyWJ1zDxcFcM3AXKVyRA6uRhCe9
         2YeIy1GLI+Uktk7DzwmanN9CwEycEPp5Lz6PVuWpMT1y0e/h+qPJFeB1wfZRhDMfGDyg
         Ot4tm964EQN+zYXAkmQrba1C4579UvgTuaEgk7hSZJWIwPpMXanCgKTBas1MS6mtAXWT
         BiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=4PeQAWWuYS/MWPTCKu5ob6YvoGvcUynBjWkXWMhZ0tk=;
        b=llT+g6zBVfWTvL0P6jhm+0MCiNCZMRiW1XF/8iNwLGWyF/vIRegmscTscmYi1wp/HN
         nT7I9o4YsU5zWLdOPTooQ+amfOwbK3JdhPzhZI1pmrLmIwG4gIm60psFapGpYHSOf4X9
         GzbMdNc723TUgxIudYOAaC4j3BQnmABRgtuhNmiHbe8jW+ITPmP3YURt021oU7BQy4QT
         9k+Z882CjBumvE4K9ZxCZDZv6XU1iB0lgWBcO5Bqc5PMY0llvq2xsFVJKEF9sc6+6VJL
         5hbC1MKAgF2NAd5MRGd6FbKoPgUVxrLT5IAUMROz5qzPga9FLYM3unelWV1E3TwXVjx1
         w0TQ==
X-Gm-Message-State: AOAM530a+h4wP1fovsKRZyF99LnRJ0d5JVsenqn4Y3Fc4hacEE3tVlyB
	axBDFZjedMXiPCvSn8GGjYM=
X-Google-Smtp-Source: ABdhPJzjHfJDiU3WRlDEBebIz0QIgO3wqfbs8a8otS0qP3GMNSZEpl6e14NsjjKMOOT7IX+xAQNgIg==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr884929wro.291.1603781969711;
        Mon, 26 Oct 2020 23:59:29 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2de9:3700:3160:107b:5425:634f])
        by smtp.gmail.com with ESMTPSA id j5sm757252wrx.88.2020.10.26.23.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 23:59:29 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 27 Oct 2020 07:59:27 +0100 (CET)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] misc: hisi_hikey_usb: use PTR_ERR_OR_ZERO
In-Reply-To: <20201026180026.3350-1-sudipm.mukherjee@gmail.com>
Message-ID: <alpine.DEB.2.21.2010270636470.7937@felia>
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

A nice small local clean up.

Here is my test report:

Build requires HISI_HIKEY_USB in config:

Symbol: HISI_HIKEY_USB [=n]
Type: tristate
Defined at drivers/misc/Kconfig:459
Prompt: USB GPIO Hub on HiSilicon Hikey 960/970 Platform
Depends on: (OF [=n] && GPIOLIB [=n] || COMPILE_TEST [=n]) && 
USB_ROLE_SWITCH [=n]

Build Preparation:

make defconfig
./scripts/config -e CONFIG_OF
./scripts/config -e CONFIG_GPIOLIB
./scripts/config -e CONFIG_USB_ROLE_SWITCH
./scripts/config -e CONFIG_HISI_HIKEY_USB
make olddefconfig

Build on next-20201027:

make
md5sum ./drivers/misc/hisi_hikey_usb.o
770db9ff0c1ca193eda2207a28deee4a  ./drivers/misc/hisi_hikey_usb.o
objdump -d ./drivers/misc/hisi_hikey_usb.o > hisi_hikey_usb.next-20201027.objdump

Build with patch on next-20201027:

make clean && make
md5sum ./drivers/misc/hisi_hikey_usb.o
770db9ff0c1ca193eda2207a28deee4a  ./drivers/misc/hisi_hikey_usb.o

objdump -d ./drivers/misc/hisi_hikey_usb.o > hisi_hikey_usb.cleanup-on-next-20201027.objdump

Compare objdump:

diff hisi_hikey_usb.next-20201027.objdump hisi_hikey_usb.cleanup-on-next-20201027.objdump

Summary:

'{md5sum,objdump -d} ./drivers/misc/hisi_hikey_usb.o' are identical before 
and after patch.

So, no functional change and no change in object code.

Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

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
