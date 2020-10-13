Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.7322.1602578209201318291
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 01:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mIZ8SF7d;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id g12so22927383wrp.10
        for <linux-safety@lists.elisa.tech>; Tue, 13 Oct 2020 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=NFgHTJDGAaoUGtS6KDLywzGQDD1dRCFwIz5+vO6WQ2U=;
        b=mIZ8SF7dnY0vtR9MBXo5RBEZ6QyI7QE3y51/hFdH5ii9efEibnofweDN2HOiN8DALt
         IVy3B3tRc/+5sfx2iCybcKzoh4oIUYljR+IQnFoffGSLFnXizOsp/mHVcylQRox+HNeE
         L4vYZT7t/8eQ8tqd+77nXFHbbQlO4KEKhB92igdash0iQgfTe1pxYs6kk0Kih3GSJ8Zb
         B68zEzPESYJB8UylI/wkZH5RVwONPAlrFTPPak3JDOoO0dQLU60ysGXqP6D+NwQJ5TKz
         xyASO8UDdGC0POgBgZ1BIQ/btPTwYOffVVNr/Yg52pcDt0GMUKEYcqFuOpxGQN4Ya/Me
         EIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=NFgHTJDGAaoUGtS6KDLywzGQDD1dRCFwIz5+vO6WQ2U=;
        b=GBJ7JrKZrXsT8k7k1eDlQrWk7g/lrOCpow4yunAtXQcG5Nck7diww+t1jBz5whyNLJ
         K7uRofowvh8ZutuwV5IdkP0/VQjTLKnBYAI5tqvtvqkRLzse+Cr9VxkkhGWSbqioMr9i
         FF14QIUd8AU1SKde1vOwLP7jZvxR5PTXBjDqdpN2LuqgGvqR+FGyI5Kx77gAmpSWS0l+
         nUFTsW9lGALSLuSo6RGgKoj4bNihFViw22YY+biOmRulDZY3fjvylKSCaPMAu3c9UWU6
         U3Ncuvgh7stb8TsY+3hXd2OHC/5whv9ElHqXBs9KZ8JCSKfMHsk5tlbtD/yzhW1APL96
         uzsA==
X-Gm-Message-State: AOAM531yCcEqNn2TRjjjcd4K8y6WHPYaIONJnLqJvZvqqMZ5V0yy0vbK
	xRdcDZ1Ijr419zhzzpue3ug=
X-Google-Smtp-Source: ABdhPJz52riMe2yauYB3XFkSeB7dj/Z8UH/Anz69G2LNz94UvnS48HHMWfnM4Xu76SDmf5KgNcxvCw==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr25030984wrw.310.1602578207638;
        Tue, 13 Oct 2020 01:36:47 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d05:8100:95ae:bd1a:3e4e:4242])
        by smtp.gmail.com with ESMTPSA id u63sm26631531wmb.13.2020.10.13.01.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:36:46 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 10:36:45 +0200 (CEST)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    linux-kernel <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech, 
    linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <CADVatmNcUzT6Df4+V7VdwO0AzZ=74Sai7X0aFpYU5SO7b2NVSg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010131026590.14590@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu> <alpine.DEB.2.21.2010121659040.6487@felia> <20201012151816.GA1559916@kroah.com> <alpine.DEB.2.21.2010122022250.17866@felia>
 <20201013052317.GB330398@kroah.com> <alpine.DEB.2.21.2010130725370.14590@felia> <CADVatmNcUzT6Df4+V7VdwO0AzZ=74Sai7X0aFpYU5SO7b2NVSg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Sudip Mukherjee wrote:

> Hi Lukas,
> 
> On Tue, Oct 13, 2020 at 6:37 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
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
> <snip>
> > >
> > > Why not fix the things that it finds that are actually issues?  If there
> > > are no actual issues found, then perhaps you should use a better tool?  :)
> > >
> >
> > Completely agree. That is why I was against adding comments here and
> > elsewhere just to have the "good feeling of doing something" after the
> > tool reported a warning and we spend some time understanding the code to
> > conclude that we now understand the code better than the tool.
> 
> I think you are missing the point here. I sent the comment not because
> of any tool, I sent it because the code there was not that simple like
> other drivers and at a first glance its not apparent why there are no
> error checks. And, afaik, the only purpose of comments is to make the
> source code easier to understand.
>

That is fine. I think it is good to add comments to make the code more 
understandable.

Lukas
