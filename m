Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.6459.1602573390916675737
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 00:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ej7mfZMw;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id s9so10554926wro.8
        for <linux-safety@lists.elisa.tech>; Tue, 13 Oct 2020 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=DcKf4Igwhaviy61SA4WHjZouchJcTwduIzK16MDmf0w=;
        b=ej7mfZMw+AJQ6G9Vucsjm+oMaAkXHHlw1ni25tfh2Lq5F+Zb3WIjtPQbaIMl58u8Pn
         PoKKaBagqq80jKCP3rHmBYKhuMFCLMfvoxNgeGQZdzFNGdX/S9t1e/8UNThBlatBHz8w
         6GwiMP+xLdF7cYTRLZYDFdM3Go574m+zk36DnWjm+EvDuwP/XS3hkXiISv24+PGADOZ4
         jBsuKkFkFDOmb7putnuDaUrW2ntFmOUOGs6ErljEXg2Sl/klcsf3lv5Pasdo9HUQirtV
         ZrnR/F2aem7501EiT/vKvhS7rO/TjrmG+msjGmUq3AGVgyMKVN4zOGFdOLbrYhooZBEE
         axXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=DcKf4Igwhaviy61SA4WHjZouchJcTwduIzK16MDmf0w=;
        b=RdFb0PAwooJ2lj+RgLSkHFFgWlubaPt/2rlnDb6dw5zZ5zskW9iP2r2He8MDMMPr4Q
         gosqo0uMc9gHpxPwq8pB+eiEKNGUxYWYsWTF2wKM9dBnLz94dsD21R2hCIj3lQnpSALt
         IO7lKxnj/MZHfpERfqDKN/5RiEsSg+NiuouAJ7TwUJdL8YLY/XB872AcfxVSrCHo7xei
         ZCLROVUwXS1FMyopppHrWNZJJBWHNehcO2rGo8cQwyKMIJnBnlotyXTG4pdmsdldVDBI
         k/E2yfI/2aIGRhoGb62AMyiXnjZ2F6+Cv+wZ1h71Hqecj0pDje+hnEvPpywm63AOPT//
         VQlg==
X-Gm-Message-State: AOAM533P6btod/1jFBSbCEoiKC48nWwk6CPc1/Fmn+WofVM8/IqMrDW7
	Tps1czD7IsT18aRrckg4SIQ=
X-Google-Smtp-Source: ABdhPJyx6KT11BLP3trQp4aNEqqx6hIIuFxre/14f4df/UX7QUoLCKbM8zg+ws7q2u+RwOSNd+23Ug==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr36301800wrg.166.1602573389304;
        Tue, 13 Oct 2020 00:16:29 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d05:8100:95ae:bd1a:3e4e:4242])
        by smtp.gmail.com with ESMTPSA id l1sm7560503wrb.1.2020.10.13.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 00:16:28 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 09:16:27 +0200 (CEST)
X-X-Sender: lukas@felia
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-safety@lists.elisa.tech, linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201013063636.GA1663576@kroah.com>
Message-ID: <alpine.DEB.2.21.2010130850410.14590@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu> <alpine.DEB.2.21.2010121659040.6487@felia> <20201012151816.GA1559916@kroah.com> <alpine.DEB.2.21.2010122022250.17866@felia>
 <20201013052317.GB330398@kroah.com> <alpine.DEB.2.21.2010130725370.14590@felia> <20201013063636.GA1663576@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Greg Kroah-Hartman wrote:

> On Tue, Oct 13, 2020 at 07:37:34AM +0200, Lukas Bulwahn wrote:
> > 
> > 
> > On Tue, 13 Oct 2020, Greg Kroah-Hartman wrote:
> > 
> > > On Mon, Oct 12, 2020 at 08:25:30PM +0200, Lukas Bulwahn wrote:
> > > > 
> > > > 
> > > > On Mon, 12 Oct 2020, Greg Kroah-Hartman wrote:
> > > > 
> > > > > On Mon, Oct 12, 2020 at 05:10:21PM +0200, Lukas Bulwahn wrote:
> > > > > > And for the static analysis finding, we need to find a way to ignore this 
> > > > > > finding without simply ignoring all findings or new findings that just 
> > > > > > look very similar to the original finding, but which are valid.
> > > > > 
> > > > > Then I suggest you fix the tool that "flagged" this, surely this is not
> > > > > the only thing it detected with a test like this, right?
> > > > > 
> > > > > What tool reported this?
> > > > >
> > > > 
> > > > Sudip and I are following on clang analyzer findings.
> > > > 
> > > > On linux-next, there is new build target 'make clang-analyzer' that 
> > > > outputs a bunch of warnings, just as you would expect from such static 
> > > > analysis tools.
> > > 
> > > Why not fix the things that it finds that are actually issues?  If there
> > > are no actual issues found, then perhaps you should use a better tool?  :)
> > >
> > 
> > Completely agree. That is why I was against adding comments here and 
> > elsewhere just to have the "good feeling of doing something" after the 
> > tool reported a warning and we spend some time understanding the code to 
> > conclude that we now understand the code better than the tool.
> > 
> > If you know a better tool, we will use it :) unfortunately, there is no 
> > easy way of finding out that a tool just reports false positives and not a 
> > single true positive among 1000 reports...
> 
> Who is "forcing" you to use any tool?  What is your goal here?
>

No force involved.

For some of us, it is 'just for fun' and the interest to understand the 
capabilities of those existing static analysis tools. To understand their 
capabilities and limits, we simply go through those warnings and try to 
reason if they are true positives (and deserve a patch) or false positives 
(which we at least try to reasonably document for later statistics and 
learning on systematic tool weaknesses).

Some others actually believe that the use of static analysis tools 
increase software quality and ONLY IF a static analysis tool is used, a 
specific level of software quality is achieved and they want to prove 
that the software reaches a certain level that way. (I do not 
understand that argument but some have been repeating it quite often 
around me. This argument seems to come from a specific interpretation of 
safety standards that claim to have methods to predict the absense of 
bugs up to a certain confidence.)

I am doing it for the fun and learning about tools, and I am not such a 
believer but those others would be forced by their beliefs until they 
understand what static analysis tools and their janitors really already 
contribute to the kernel development and where the real gaps might be.

I hope that helps to get a bit of the motivation. Consider us 
kernel newbies :)

Lukas
