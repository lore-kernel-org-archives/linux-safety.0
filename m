Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.6898.1602576167715343532
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 01:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fFXcbyA5;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id x7so16801920eje.8
        for <linux-safety@lists.elisa.tech>; Tue, 13 Oct 2020 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Nlo+ICeKz+qCTf+x4IerNhRGMWRTbpLUIF6/RSAckKo=;
        b=fFXcbyA5ROqDDWnjwA2mdrpNGdVVXDmgbZtslUt9b1Er8Lgmb6GdDKv4m2RuLU9U8d
         MKUl8XffdlKiyGBaxVMMHBRQFZaLzi0t2XYcjrvencmZAXJ4RkZflp4wOXt/2A65KT2v
         sIlQH9TPwnkXo8u/UBJHiSAp0Y/UQAppjf+CaglLysf9PnM3dcVYRtpMI28BJ5d4EAoB
         72YZG+jVqgMvuF2gbtsk2TpgPR1A9u9vxbVpSaqznar9xMVMxufDPx6wmWvw9twn1PCH
         SL66tYIoLxWgFr9OxtoRvfR/L8fwPl2AC8eyGijNNq+f/CZ06qYbFZHzkkx7WAUI/nNK
         O2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Nlo+ICeKz+qCTf+x4IerNhRGMWRTbpLUIF6/RSAckKo=;
        b=jhDd4bQW9+N2I3Q+2xe5bpPZBScZ1vtFTHAsAFcNicuIbdh5ozNZpdBWyFDjA5VqXg
         xH36ntuSTiBcI34jeyZZy9oSbPJHoxpDFmQrFLlxdDoBepa3Ahcmix2xVq3ehvG4bjME
         DdNVp3GE1p6Rx4R7OM45K42XhdEH7x+RsTzkC18qxqH40YKNiOOTiDkDCj7CmMWUlX/v
         rWJD7gVGnAMMkAEUcp/wDjD6Hd1VSQQ78XtF17SZe5QS9jcRz6drI5luexO8L5SqiG67
         ah0DVtYvf00E+vDkez0oo37LN3U6mpr+wyRB4tYgsLwPWsqABpHvZLDQfU0LiaQgshJK
         SxiQ==
X-Gm-Message-State: AOAM5304AymrTfu5amgK6d1w61h5w0LTyRA/UL86lCva1nnKvWF25wSs
	YVxIyjMhihGL4XpGE5vf2AA=
X-Google-Smtp-Source: ABdhPJyLFkBZSBBn/rB2G6MUdeWoKMj+AJ4gkZlhm7FuDYga4WD8VPHx68gUCzdFaDVqLWTGbDRsCA==
X-Received: by 2002:a17:906:453:: with SMTP id e19mr33287437eja.391.1602576166191;
        Tue, 13 Oct 2020 01:02:46 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d05:8100:95ae:bd1a:3e4e:4242])
        by smtp.gmail.com with ESMTPSA id r11sm11970080edi.91.2020.10.13.01.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:02:45 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 10:02:43 +0200 (CEST)
X-X-Sender: lukas@felia
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-safety@lists.elisa.tech, linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201013073524.GA1674118@kroah.com>
Message-ID: <alpine.DEB.2.21.2010130957110.14590@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu> <alpine.DEB.2.21.2010121659040.6487@felia> <20201012151816.GA1559916@kroah.com> <alpine.DEB.2.21.2010122022250.17866@felia>
 <20201013052317.GB330398@kroah.com> <alpine.DEB.2.21.2010130725370.14590@felia> <20201013063636.GA1663576@kroah.com> <alpine.DEB.2.21.2010130850410.14590@felia> <20201013073524.GA1674118@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Greg Kroah-Hartman wrote:

> On Tue, Oct 13, 2020 at 09:16:27AM +0200, Lukas Bulwahn wrote:
> > Some others actually believe that the use of static analysis tools 
> > increase software quality and ONLY IF a static analysis tool is used, a 
> > specific level of software quality is achieved and they want to prove 
> > that the software reaches a certain level that way. (I do not 
> > understand that argument but some have been repeating it quite often 
> > around me. This argument seems to come from a specific interpretation of 
> > safety standards that claim to have methods to predict the absense of 
> > bugs up to a certain confidence.)
> 
> So do those others also audit the static analysis tools to ensure that
> they actually work as they "think" they do?  If not, then their
> requirement is pretty pointless :)
>

Yes, they do audit the tools, but those audits and why that proves the 
absense of a bug class is yet a completely different story...

> > I am doing it for the fun and learning about tools, and I am not such a 
> > believer but those others would be forced by their beliefs until they 
> > understand what static analysis tools and their janitors really already 
> > contribute to the kernel development and where the real gaps might be.
> > 
> > I hope that helps to get a bit of the motivation. Consider us 
> > kernel newbies :)
> 
> Watch out, sending patches to subsystems to "fix" issues that really
> are not real problems is a sure way to get your patches rejected and
> make maintainers grumpy.
> 
> I recommend starting out with code that we all "know" needs help, in
> drivers/staging/ for stuff like this, so you can learn the process
> better, as well as start to understand the limitations of your tools
> better.
> 
> good luck!
>

Thanks for the advice. We will need to learn about the limitations and 
what is worth a patch and what is not and we will need luck on the way 
learning that.

Lukas
