Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web08.417.1604383898025034470
 for <linux-safety@lists.elisa.tech>;
 Mon, 02 Nov 2020 22:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AGsR20jX;
 spf=pass (domain: linaro.org, ip: 209.85.210.65, mailfrom: john.stultz@linaro.org)
Received: by mail-ot1-f65.google.com with SMTP id l36so6985829ota.4
        for <linux-safety@lists.elisa.tech>; Mon, 02 Nov 2020 22:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUQECi2b2OmyDRScJrepUtAejD+g0Cf0SRxo1IXKJxY=;
        b=AGsR20jXoMdzQ00xNiD1IByazVm3Bjl1NGCQe8DmtoViitMuOzzhNDj4356l6HRndU
         ufR3hTueJY933LmLdYrDp/+7G4OrFkaq+aICNtNkYiU81Hlistf3a185hBRPZBl2qrLa
         mGIysGc0x1l6nhMqd79AcDLH3YFYF8nkkWhYT0aBHEvcA/9cT+BWFJd85Z8Q7ZqI9Im+
         4jnrw49j2InpIIHwzfjMTPqeYejLKOxS6BKTfgqsr2gxDZdRkBj5I2d2HtKm7NtcuqY0
         PJE+EqBMSGrGq4i94va785QaD4H4c28JVorFUqDcArbglf8zJOWO04u7YD50eu2oWLnA
         692Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUQECi2b2OmyDRScJrepUtAejD+g0Cf0SRxo1IXKJxY=;
        b=qqNmCBLj061uYPqiJJ4ph9p7cldddpik3t2TG9fPvalgAOQjThN2COFRSpI5EEr2AO
         zpnmMVEPLQJaA2LdHuUeRbKI/CjA2PO2NNL3yCy3Lt1gse58KG5oVV4u7GTMaq19eubL
         NKgFT+Nxs0GwwkJtcoma/jSjGzVHIZ4Mx3gxN3Fl++kG5oNJb85pwNqd3Apif7JYA7uF
         P7EFHqRcyPfYd4638MVi090fKNJ7kr4KGxQDp3RBCYEqKaLg3GKf3CfPWZhATUSCa83B
         c+z8jhcz0gcWbrELJzAnRctWYubK8tQe+fwzogXuPIA0UfrJQUiT6ioIPv0RCpvy4UJ/
         nhTA==
X-Gm-Message-State: AOAM532k/HDg+wbSr+joUxlIrUszX4kwjJUoMpBD4/KoZscemw6CF21W
	AHWRDDE1sknE4u85Irbq7OTkzEhLYM4pHOkBkC7RRg==
X-Google-Smtp-Source: ABdhPJyauU4JLerz1H5+gLLJB3GH4BxZ3L8r2UynN2PUKLok0mhN5q3GnRNnc8QUueR3kZObrzxW7/MHby1sWLLv8ZY=
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr5385725otp.102.1604383897321;
 Mon, 02 Nov 2020 22:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20201026180026.3350-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20201026180026.3350-1-sudipm.mukherjee@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 2 Nov 2020 22:11:25 -0800
Message-ID: <CALAqxLVzsQs6_G9DOTkaBsUa93-97c136mtx7WRPNjBFjfkyAA@mail.gmail.com>
Subject: Re: [PATCH] misc: hisi_hikey_usb: use PTR_ERR_OR_ZERO
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	lkml <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2020 at 11:02 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
> we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
> doing 'return 0'.
>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Thanks for sending this!

Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
