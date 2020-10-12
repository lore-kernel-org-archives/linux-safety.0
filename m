Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.5260.1602526663401473677
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 11:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fYzC9kto;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id dt13so24521601ejb.12
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=c+kBrX5knFHQA366QTbQG2xoC8cJqFMhyaB/KzSha9c=;
        b=fYzC9ktoHa9GwHkUIpKUBAR/FUPI0tzEC9UZZ6mqtGI2p3BL2cGg4bCWpMYtLCWgyQ
         g54jF4heRqyefVW0vuZgq1X/LHrTmoYSdih/9SjK/OaLuPcx0PVuHdH0XBr7Jo2OId6c
         VV1MeHWqPSfc2Oxvzl84uCaHdPZWjNAz+BSK7NXOwSYKsiC5Bh2nVdfg1Fy0LWTS9S1g
         iu+leoz+2lKhxbuUue/fP3HMJv/UzzTno6i+Uu7oGd3EHn2uyNTCVyRZXmGzun9z6uFb
         TCCFRJIh+3GVN/1uCx8FUhEfHqei9Goh7VJNt7alY8u2yCYJc2WYem0A1K7OU7FJ0Ngm
         H2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=c+kBrX5knFHQA366QTbQG2xoC8cJqFMhyaB/KzSha9c=;
        b=GYLtTicvNSBVYR4FQWH5erTNTJT7Z2312s6VpebEu7cZTVMGjK4AAw+GSZ6PIviKVX
         YOaVv3mo0upfutT12J30sraaXvJj/dnUY+Zvrcvez1lHCSZopP3ShbfxtFbLBw6BhjBQ
         xgSynbS8nuTdrbCqgjKj/nBojTwTc+6+heyqfaxsu94vPU5Bv2wP0ThufaLoGZBqnC8R
         jq23NdxkG40GFusTlZvsl+Uo/qkspmkxPmVBtD9SW0bfVVTmuDOfnjb++lzuMDGRMpfi
         nhTfoELPU+64eVaLhS1M07AUY8eiOG/+ZFPa+HjsQr4HeiK1aUQ5xybxT71B4+DpIM5b
         wQgA==
X-Gm-Message-State: AOAM5324tWDXHvNeEBjifb+m/R1/z2+Q2S2tG5V48VK1Pgas2Vm6ILLh
	Gtl8M23VOasRVf+SCIJ92+M=
X-Google-Smtp-Source: ABdhPJxQU/J0JgWvT5Ce4xVxBLNCsFbK3QvV3yPsNPs92mt6x7WGg0F54yQqCdrGRft058oGBd39YA==
X-Received: by 2002:a17:906:8545:: with SMTP id h5mr28814043ejy.384.1602526661710;
        Mon, 12 Oct 2020 11:17:41 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d57:fc00:a1bd:911e:26f6:597])
        by smtp.gmail.com with ESMTPSA id w13sm11030915eja.7.2020.10.12.11.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 11:17:40 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 20:17:34 +0200 (CEST)
X-X-Sender: lukas@felia
To: Alan Stern <stern@rowland.harvard.edu>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech, 
    linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201012160013.GA632789@rowland.harvard.edu>
Message-ID: <alpine.DEB.2.21.2010122008370.17866@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu> <alpine.DEB.2.21.2010121659040.6487@felia> <20201012160013.GA632789@rowland.harvard.edu>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 12 Oct 2020, Alan Stern wrote:

> On Mon, Oct 12, 2020 at 05:10:21PM +0200, Lukas Bulwahn wrote:
> > 
> > 
> > On Mon, 12 Oct 2020, Alan Stern wrote:
> > > Real code contains so many assumptions, especially if you include ones 
> > > which are obvious to everybody, that such a tool seems impractical.
> > >
> > 
> > I fear that problem applies to all static code analysis tools I have seen; 
> > at some point, the remaining findings are simply obviously wrong to 
> > everybody but the tool does not get those assumptions and continues 
> > complaining, making the tool seem impractical.
> 
> Indeed, it is well known that the problem of finding all errors or bugs 
> by static code analysis is Turing complete.
> 
> > Alan, so would you be willing to take patches where _anyone_ simply adds 
> > comments on what functions returns, depending on what this person might 
> > consider just not obvious enough?
> 
> No.  I would take such patches from anyone, but depending on what _I_ 
> consider not obvious enough.
> 
> > Or are you going to simply reject this 'added a comment' patch here?
> 
> I have already accepted it.  In fact, the patch was my suggestion in the 
> first place.
> 
> When I originally wrote this code, I was aware that it was somewhat 
> subtle, but at the time it didn't seem to warrant a comment or 
> explanation.  Sudip's patch has changed my mind.
> 
> > I am not arguing either way, it is just that it is unclear to me what the 
> > added value of the comment really is here.
> 
> As with many other comments, its purpose is to explain a somewhat 
> obscure aspect of the code -- something which is there by design but 
> isn't immediately obvious to the reader.  That is the added value.
>

Fine, then I was more conservative on adding comments than you; we will 
see if other maintainers accept adding such comments as well for further 
findings we will encounter.
 
> > And for the static analysis finding, we need to find a way to ignore this 
> > finding without simply ignoring all findings or new findings that just 
> > look very similar to the original finding, but which are valid.
> 
> Agreed.  In this case, the new comment does a pretty good job of telling 
> people using the tool that the finding is unjustified.
> 
> If you are suggesting some sort of special code annotation that the tool 
> would understand, I am open to that.  But I'm not aware of any even 
> vaguely standard way of marking up a particular function call to 
> indicate it will not return an error.
>

I cannot yet say if some annotation would work, we, Sudip and me, need to 
investigate. It could be that something like, assert(!IS_ERR(tt)), is 
sufficient to let the tools know that they can safely assume that the 
path they are complaining about is not possible.

We could make the assert() a nop, so it would not effect the resulting 
object code in any way.

We have not tried that; We are still experimenting with clang analyzer 
and are still learning.

Lukas
