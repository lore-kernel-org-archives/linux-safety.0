Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.6005.1602570959494391043
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 23:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=L7xRjYu9;
 spf=pass (domain: linuxfoundation.org, ip: 198.145.29.99, mailfrom: gregkh@linuxfoundation.org)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2E52B208D5;
	Tue, 13 Oct 2020 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602570958;
	bh=OzYDo5bge4BHECOk5mX0aFz05bzK8pdkGElBQ1KpmNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7xRjYu9OMo8UhZ4EV4S6Y5fTrGlKZl3lraCMK5dVN1BJVxsLW8qiwPwuCx9aPkeU
	 Yc6OcdLtenHmToCHgEaVlh5KNxIOObFt7ac5Mq+yilUxfh3VPUNupmMWXN1bNk2ZtR
	 FmET11Lu7NScF3xybyZcem/crqgcZ3ZpRDiNlFbo=
Date: Tue, 13 Oct 2020 08:36:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
	linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
Message-ID: <20201013063636.GA1663576@kroah.com>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com>
 <alpine.DEB.2.21.2010121550300.6487@felia>
 <20201012145710.GA631710@rowland.harvard.edu>
 <alpine.DEB.2.21.2010121659040.6487@felia>
 <20201012151816.GA1559916@kroah.com>
 <alpine.DEB.2.21.2010122022250.17866@felia>
 <20201013052317.GB330398@kroah.com>
 <alpine.DEB.2.21.2010130725370.14590@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010130725370.14590@felia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2020 at 07:37:34AM +0200, Lukas Bulwahn wrote:
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
> > > > Then I suggest you fix the tool that "flagged" this, surely this is not
> > > > the only thing it detected with a test like this, right?
> > > > 
> > > > What tool reported this?
> > > >
> > > 
> > > Sudip and I are following on clang analyzer findings.
> > > 
> > > On linux-next, there is new build target 'make clang-analyzer' that 
> > > outputs a bunch of warnings, just as you would expect from such static 
> > > analysis tools.
> > 
> > Why not fix the things that it finds that are actually issues?  If there
> > are no actual issues found, then perhaps you should use a better tool?  :)
> >
> 
> Completely agree. That is why I was against adding comments here and 
> elsewhere just to have the "good feeling of doing something" after the 
> tool reported a warning and we spend some time understanding the code to 
> conclude that we now understand the code better than the tool.
> 
> If you know a better tool, we will use it :) unfortunately, there is no 
> easy way of finding out that a tool just reports false positives and not a 
> single true positive among 1000 reports...

Who is "forcing" you to use any tool?  What is your goal here?

greg k-h
