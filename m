Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.5348.1602567457639670110
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 22:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qj5hb2nQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id u21so26478131eja.2
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 22:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=gYLREbCBt05MLq9RuSN82ybwnKTixZybY8CU73x+FQs=;
        b=Qj5hb2nQfetMWun2C/7FkWH/es32ZatL0Cnqp2RbrfMMx2+/EUqr7C0gkirXAeggO3
         hoDYYnE+Sm2z6HT+A9GSfYXnxlvwrdUCsDLYHuUlc/l9kxKmQ7x30fINVAgDDG3S+553
         CWPp4Wnv7RY9HcOUwxZeY78/pXcHTV48C8SuTMLM4ZYvw27y0HHf6ubgET/Qq7epT5Yj
         HOe18eTQG/UUu1gTJUJR0wKnpdpivHucUjDUjRnF2G427S28lH17hMoDnFOsIKsQO5GW
         +SR35piZ/dGrNDeSAhFglF9tzDGGJlmj0G1C3M6TG1q/dMtWtyBjMhX5zdTv9EBIooLf
         Jl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=gYLREbCBt05MLq9RuSN82ybwnKTixZybY8CU73x+FQs=;
        b=KJUMB/+dOffT+48HemjfZZ900hCDDSkHMGPoScMOHu54YHqAcKGZHwwVgKwgEOsuvB
         olM339/k+PNHEQQh7v2VvW1tVOXWpmFan2466HlTfYI+17Uy6lLUSi+HseNtrFePvqxV
         e3+dZkSfTU+v0KrhkJvR3L7/zkyIaNCiom8ZUY0kfYRtDkDJkvOzl7zgUO5wQZcPU/6l
         nydA6qURyndSKdXonzlzB1vdd4LEIqeAUY+7YRA24QRzNJuAJPS38qcCfG4eK+6EoST4
         Q3wbgvcY+t8kH4rubQChSUk6pzfIWznjppMYpePWcdugOXD5PuYN9rIAGFW1K58rus0P
         fN8w==
X-Gm-Message-State: AOAM533bpeqxcx3mNtzTjRsdrTRntvTQZGErN1uTSEP847XAacw5qnMv
	jVGQitaQVDeA2j5RbFpgSQE=
X-Google-Smtp-Source: ABdhPJw2++YSQXSV41iMkqWKkxe5lVcRBwcMikf48LjMGn6E+J5mnrnZBd3TBovbyjrhv3ZLRImhqQ==
X-Received: by 2002:a17:907:33d2:: with SMTP id zk18mr32207994ejb.145.1602567456047;
        Mon, 12 Oct 2020 22:37:36 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d05:8100:95ae:bd1a:3e4e:4242])
        by smtp.gmail.com with ESMTPSA id k1sm11772846edl.0.2020.10.12.22.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 22:37:35 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 07:37:34 +0200 (CEST)
X-X-Sender: lukas@felia
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-safety@lists.elisa.tech, linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201013052317.GB330398@kroah.com>
Message-ID: <alpine.DEB.2.21.2010130725370.14590@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu> <alpine.DEB.2.21.2010121659040.6487@felia> <20201012151816.GA1559916@kroah.com> <alpine.DEB.2.21.2010122022250.17866@felia>
 <20201013052317.GB330398@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Greg Kroah-Hartman wrote:

> On Mon, Oct 12, 2020 at 08:25:30PM +0200, Lukas Bulwahn wrote:
> > 
> > 
> > On Mon, 12 Oct 2020, Greg Kroah-Hartman wrote:
> > 
> > > On Mon, Oct 12, 2020 at 05:10:21PM +0200, Lukas Bulwahn wrote:
> > > > And for the static analysis finding, we need to find a way to ignore this 
> > > > finding without simply ignoring all findings or new findings that just 
> > > > look very similar to the original finding, but which are valid.
> > > 
> > > Then I suggest you fix the tool that "flagged" this, surely this is not
> > > the only thing it detected with a test like this, right?
> > > 
> > > What tool reported this?
> > >
> > 
> > Sudip and I are following on clang analyzer findings.
> > 
> > On linux-next, there is new build target 'make clang-analyzer' that 
> > outputs a bunch of warnings, just as you would expect from such static 
> > analysis tools.
> 
> Why not fix the things that it finds that are actually issues?  If there
> are no actual issues found, then perhaps you should use a better tool?  :)
>

Completely agree. That is why I was against adding comments here and 
elsewhere just to have the "good feeling of doing something" after the 
tool reported a warning and we spend some time understanding the code to 
conclude that we now understand the code better than the tool.

If you know a better tool, we will use it :) unfortunately, there is no 
easy way of finding out that a tool just reports false positives and not a 
single true positive among 1000 reports...


Lukas
