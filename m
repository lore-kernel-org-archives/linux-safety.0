Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.5394.1602567704163556072
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 22:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sCLwzONO;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id d81so19706992wmc.1
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 22:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=d9vylN65+yzj7mksBEpuNNWYvYrmZ1UZPFWpzN8ZJnc=;
        b=sCLwzONOmV2FgbEAOU83au8Xo+dLKC7HW9WDa6LSVfMb9V8Jl4KZPyzFI3tycA7Khb
         sS2veNiS+XGL2ioy2cMAiCv/qr20FWJR7NpMlD42nbgcmRZdQePe/O5oOzromG/qMjoE
         gqRdNEtLex937a3wvsxc1jwF0tBMMwDefp/2oH0Y1Zdiw/JCZtVXH0XvOXof1JzDgYNh
         pnhtMM2uwTQpjO4oWYpG5lx1gZUF5W1Iz8uv0Rs4AZNVlnrgT+Y7bXld0EmyqEN9YsZZ
         qKrpj1SvtscbuMFaKUbvbWvfTqhTrQ1K8QHDwKRgVYCnowgZZBvPy/oPTF6fzx1jk5ku
         mSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=d9vylN65+yzj7mksBEpuNNWYvYrmZ1UZPFWpzN8ZJnc=;
        b=ALi6o8w9G3ytA+2sA/Tn1UYF1v8k7Ndc+bez38GDEJ1nn4M5GBEfacwSk3tIn+qew5
         A5+0WF7aeYbngB8Vyku6aMxWp5jl8/N4CaoDppaTsqNxAz9eytTFftfimOdkD59+uywb
         IQOO4Ap3N1IDUQt6rS8Q9yEaTIpbOt666yVMhnISYZJmWk3XHZsqVbK4mfRhpOoexveA
         ivy1RtP4ugYoYLN4tI8RfJitmQNNXpiXvrm5rvaI8vxWdL2xB4R6ZgN7cCgqEcb/3Dw4
         4TaJ11G0xnuu7jJfCGch0yfFLVZRdMz/2TveMq2y2huH7NoDND9M8k5AuIjcHAKq3VRU
         ETVQ==
X-Gm-Message-State: AOAM533EXuH8AtP8bKgeHH2fMVfzw2jOP5td0TtNMXybF9wZRvZegdBJ
	NHc2Q7Rj6PPUETIabswmia4=
X-Google-Smtp-Source: ABdhPJyBxStNdGGvixqD19QWg9HaFQ15lb9VjTESTLLFfAXCJouGCu18qM+gVBG2G2S97MUHX7rWPA==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr13768508wmi.84.1602567702684;
        Mon, 12 Oct 2020 22:41:42 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d05:8100:95ae:bd1a:3e4e:4242])
        by smtp.gmail.com with ESMTPSA id u2sm28834532wre.7.2020.10.12.22.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 22:41:42 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 07:41:40 +0200 (CEST)
X-X-Sender: lukas@felia
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-safety@lists.elisa.tech, linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201013052150.GA330398@kroah.com>
Message-ID: <alpine.DEB.2.21.2010130737430.14590@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu> <alpine.DEB.2.21.2010121659040.6487@felia> <20201012160013.GA632789@rowland.harvard.edu>
 <alpine.DEB.2.21.2010122008370.17866@felia> <20201013052150.GA330398@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Greg Kroah-Hartman wrote:

> On Mon, Oct 12, 2020 at 08:17:34PM +0200, Lukas Bulwahn wrote:
> > > If you are suggesting some sort of special code annotation that the tool 
> > > would understand, I am open to that.  But I'm not aware of any even 
> > > vaguely standard way of marking up a particular function call to 
> > > indicate it will not return an error.
> > 
> > I cannot yet say if some annotation would work, we, Sudip and me, need to 
> > investigate. It could be that something like, assert(!IS_ERR(tt)), is 
> > sufficient to let the tools know that they can safely assume that the 
> > path they are complaining about is not possible.
> > 
> > We could make the assert() a nop, so it would not effect the resulting 
> > object code in any way.
> 
> Things like assert() have been rejected numberous times in the past in
> the kernel, good luck with that :)
>

Greg, we have been warned by you now; so, we are well aware what could 
await us just as numerous others before.

Lukas
