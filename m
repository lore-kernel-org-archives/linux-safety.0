Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web12.7185.1602577505353169009
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 01:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QUjOIjM0;
 spf=pass (domain: gmail.com, ip: 209.85.219.195, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-yb1-f195.google.com with SMTP id h9so15492526ybm.4
        for <linux-safety@lists.elisa.tech>; Tue, 13 Oct 2020 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yb8uf1yPz5kaBwo/Czxv6SGb8eqvWHd/MSZ3XQ2Vi/0=;
        b=QUjOIjM0KrH/aLS1ph9lySWsHWQx1pHFSw1wYRy9z8pn6WVQwNzB1V9aoKeAXVE6CX
         VWGSpt8a0vzTG+LUJypOBnACtBk0Fc56LLMnqqWDrl5B8VEPayx/YtAEBZ38zwbuDMd0
         ed4iN3Amc2mpGFHz004yjbejwN4iwub6dpZR74j0wps7vnTRUR8/r/XtWb56KAdadEJa
         9iEzZfxtKZbVSsNIW0hDW89UdRPxjwmo6KMs6+affBm68FCwfEmpMKsfzVDjE/VK+S7f
         xt18lMJDnyV2I4rZOziUZ1P8NU/UZGccqhG42lEVrbHp8xs9Ybc10Hz03Ld+Y4lbw+C2
         BuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yb8uf1yPz5kaBwo/Czxv6SGb8eqvWHd/MSZ3XQ2Vi/0=;
        b=E0mvCr58NObF6mmW061dwZ05M5kJBVx//ohN1onMr94bmKiHKND8NamIGySnoF6/vh
         nH1D+ZtLwPjcHScH2bn/ShP+AbOpsnh1LDace0fZYmM+WBl2eNE8NUi9l30LZvGDDP7X
         ccQXUQMU7RyjtD62F/x7scf+VtlYY14lVeKiVQ4Y9Q0wBBPq5vaqjYCqLeMeV8Xlxk5P
         VBf57vxjRt9LMAAnE/ZkAIPHLMuv6JI8cbuarFLFc0jhFCxNNAJfdM4WIDO2UC7bwkkh
         X0muzT/gaCR6DwLZHkimXGrgA8OtvPxw+kMfP9JOQZKCPHyGvFcxh+ACf+KvTY89ARMZ
         OBNg==
X-Gm-Message-State: AOAM530eIA1HtS85/K1Jw/eWZyIB0Fyw8sLSVPhzcahQG4hKe4NXZm9A
	JzbcAhuC3hgn3Wga4/nalNMi7EWdvDNaxhlISn8=
X-Google-Smtp-Source: ABdhPJySApp9x9zfOYAVifM5CshLWnRdvhNLRlJpT7ZLNFcQEbmf6GC1o6S1rHaDXsk1JeO08TWzANjnU5JDtt6QRQ8=
X-Received: by 2002:a25:e046:: with SMTP id x67mr36342627ybg.342.1602577504560;
 Tue, 13 Oct 2020 01:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com>
 <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu>
 <alpine.DEB.2.21.2010121659040.6487@felia> <20201012151816.GA1559916@kroah.com>
 <alpine.DEB.2.21.2010122022250.17866@felia> <20201013052317.GB330398@kroah.com>
 <alpine.DEB.2.21.2010130725370.14590@felia>
In-Reply-To: <alpine.DEB.2.21.2010130725370.14590@felia>
From: "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
Date: Tue, 13 Oct 2020 09:24:28 +0100
Message-ID: <CADVatmNcUzT6Df4+V7VdwO0AzZ=74Sai7X0aFpYU5SO7b2NVSg@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,

On Tue, Oct 13, 2020 at 6:37 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Tue, 13 Oct 2020, Greg Kroah-Hartman wrote:
>
> > On Mon, Oct 12, 2020 at 08:25:30PM +0200, Lukas Bulwahn wrote:
> > >
> > >
> > > On Mon, 12 Oct 2020, Greg Kroah-Hartman wrote:
> > >
> > > > On Mon, Oct 12, 2020 at 05:10:21PM +0200, Lukas Bulwahn wrote:
> > > > > And for the static analysis finding, we need to find a way to ignore this
> > > > > finding without simply ignoring all findings or new findings that just
> > > > > look very similar to the original finding, but which are valid.
> > > >
<snip>
> >
> > Why not fix the things that it finds that are actually issues?  If there
> > are no actual issues found, then perhaps you should use a better tool?  :)
> >
>
> Completely agree. That is why I was against adding comments here and
> elsewhere just to have the "good feeling of doing something" after the
> tool reported a warning and we spend some time understanding the code to
> conclude that we now understand the code better than the tool.

I think you are missing the point here. I sent the comment not because
of any tool, I sent it because the code there was not that simple like
other drivers and at a first glance its not apparent why there are no
error checks. And, afaik, the only purpose of comments is to make the
source code easier to understand.


-- 
Regards
Sudip
