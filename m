Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.5444.1602527134029968708
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 11:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YHfb/KDk;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id v19so18026251edx.9
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=C095eq86xjn+En5nSlIhEWjGDGnZyziFePy+eLxNRX0=;
        b=YHfb/KDkG7fr/WaSrCI7gR8BoesWZvhwrk0wirlJKz1GfAWuqqYiWVqGMJijLQisMm
         j0+TsetsVCQrIcyZhBj8+Sm17m6UsLk1Q/2dlK2xDxmmVfark8d+/N6WWQI/pnkj4QWl
         S3RnBhhg8xFSZ3tV2opELJH5j72/wleecNb+SvRBODmTdP+r/+LJ15XjLILITSUDaeqN
         D9R9U4eOgcZOdtm4IiwTIj21IAawxU2hGmJLXliwMKTjg0D9Tdvarjsv6LUFf3flLb2T
         hMOM7pi9xcGe/wcxX3CiPTs1NsIUKJppqMyhbRVTiHYdas6GrdoV66kP7uqMoB1WJ21z
         bZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=C095eq86xjn+En5nSlIhEWjGDGnZyziFePy+eLxNRX0=;
        b=YC4XCFyKU3mXPFgUJz0zdSf6FDxYGMiCWJ9hOYe1dJ1izIMG5ryRiJFoBhgtJ/Wmw6
         rlOulQVuN5J465HoOGWhMsojpD+r9lZb7f+bmbszjOTip5WIwRq5LeadLTy/yabvElIf
         E0KcJVuUUUik4RTV27lI+ixAkwsYQrbFAT/YJGJrTmT8bFWaml3tkkEaryBIUl+ceavp
         tXO1Ucsy8Nw6+gK8snpEGgIysNNxxuLP/3KeTheoAhQeckXnr4bow/OpVcs7rDCgJBAa
         9Eu2aCLs9aGPHSI0KhCSISzturX5LmXy4AR1/eMe+sDjIQZIY5k+IfKu5mPJ5HTxgTH1
         5Yag==
X-Gm-Message-State: AOAM532DhVYH7IzsnXJd2xx4dhI2zLzLRaiPYHB1XFPHgSYFXZ7SCYrX
	Elk0UoyK2wEPWL/Ot5KKD/k=
X-Google-Smtp-Source: ABdhPJxFqFNaPMi7ewWw/67vTlF9aiYtWM+DMAaau6bFaLOtPzmPfSQaZFEzvp+6Eajxgh+caTeITw==
X-Received: by 2002:aa7:da12:: with SMTP id r18mr15264051eds.169.1602527132374;
        Mon, 12 Oct 2020 11:25:32 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d57:fc00:a1bd:911e:26f6:597])
        by smtp.gmail.com with ESMTPSA id y6sm1260804eds.93.2020.10.12.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 11:25:31 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 20:25:30 +0200 (CEST)
X-X-Sender: lukas@felia
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-safety@lists.elisa.tech, linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201012151816.GA1559916@kroah.com>
Message-ID: <alpine.DEB.2.21.2010122022250.17866@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu> <alpine.DEB.2.21.2010121659040.6487@felia> <20201012151816.GA1559916@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 12 Oct 2020, Greg Kroah-Hartman wrote:

> On Mon, Oct 12, 2020 at 05:10:21PM +0200, Lukas Bulwahn wrote:
> > And for the static analysis finding, we need to find a way to ignore this 
> > finding without simply ignoring all findings or new findings that just 
> > look very similar to the original finding, but which are valid.
> 
> Then I suggest you fix the tool that "flagged" this, surely this is not
> the only thing it detected with a test like this, right?
> 
> What tool reported this?
>

Sudip and I are following on clang analyzer findings.

On linux-next, there is new build target 'make clang-analyzer' that 
outputs a bunch of warnings, just as you would expect from such static 
analysis tools.

We will fix the tool if we can.

Lukas
