Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.110.1600360132592493978
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 09:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P7hP83RG;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id e22so3151517edq.6;
        Thu, 17 Sep 2020 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=suo12S+NGVmFSCQAjTpPm5fuQjn2ysBoNCsUclvmktE=;
        b=P7hP83RGm6xBdmKEIeybx9JbRJPcA9ZCi9buK7aPW4QC0FFMV0SOyGKcyUKoW7PaqX
         lP6rG1YKUVIa0o1NzCZ442qa/i9P4IrRhX9o8JKvrvMFLYTMkxAsEx/yuc9JPcuO9941
         namwq8wtiTj/pf5WLDXHePn2+3j+N9uqBB5+Q6nmI99JgKeO3KjryGXo8N+ugX4TQ5gJ
         omLq2ywBUjqu0JcIujeqXaWT2cbCwuo5FjM0BWg2CP0DFpTU/C1OmUWqhGVILjQV4ox3
         z1Yke1YDSpA8IBpb5Yv5gINPtCbv37tMB3hDW6hWvsBFdLthm75Df9Pb9VQN1dXBhIF6
         OQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=suo12S+NGVmFSCQAjTpPm5fuQjn2ysBoNCsUclvmktE=;
        b=N2qagLu5EGOMKDynETej9wEczS3JoCmUuXuq64pw+I/NlIGLBYGy4tWdzLNweGyPU5
         Q/xxoyClWx2WR/iaY+S/3jXGGvjIslPiIyk/KEY2SdyNT95HGMNwJBdW/OrYp5Pxivj6
         9R5EOe0AjIHrNQrOXQQNwuLJX86Gu8pIaCNs5uh+tnojcTvaAWH5d166HyyeIJ3xpGNh
         LBrHZK/5Hvl4gprZ1BrUKZOsJyz1NctYyDYrTx7F1DdRtVkD/4QSvTh1vKWerpM/iYls
         8sq3JSdGNPiR3Xt80fJToUPS6SrlJFjPDpkrcDk4iz7gO+QhbwkaRWUYrL6B4oQpufcf
         3b6g==
X-Gm-Message-State: AOAM531Gcw568DbYg44q/79fwUyjsVRsJ3cbBplc8nFzOVYXnDOp2Q5I
	Afwq/1PiuuHtY0WmXWCKkb4=
X-Google-Smtp-Source: ABdhPJworcBSu8bdjeLT+C3J9sOgOUvh+6JFYNfV0OAKyThS3xKT9bka6yIrEowIIAvkD8+Z/5/U5Q==
X-Received: by 2002:a50:fc83:: with SMTP id f3mr34895429edq.102.1600360130809;
        Thu, 17 Sep 2020 09:28:50 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2da3:1100:b096:8628:b410:46b3])
        by smtp.gmail.com with ESMTPSA id i25sm138884edt.1.2020.09.17.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 09:28:50 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 18:28:49 +0200 (CEST)
X-X-Sender: lukas@felia
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>, 
    "development-process@lists.elisa.tech" <development-process@lists.elisa.tech>
Subject: Re: [linux-safety] [ELISA Development Process WG] [PATCH] mm: vmscan: provide a change to the development-process group
In-Reply-To: <BY5PR11MB41954AB0A7968933F7DA6314883E0@BY5PR11MB4195.namprd11.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2009171825170.9985@felia>
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com> <BY5PR11MB419520C95C248EFDB49A3DEA883E0@BY5PR11MB4195.namprd11.prod.outlook.com> <alpine.DEB.2.21.2009171729190.9985@felia>
 <BY5PR11MB41954AB0A7968933F7DA6314883E0@BY5PR11MB4195.namprd11.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 17 Sep 2020, Paoloni, Gabriele wrote:

> 
> 
> > -----Original Message-----
> > From: development-process@lists.elisa.tech <development-
> > process@lists.elisa.tech> On Behalf Of Lukas Bulwahn
> > Sent: Thursday, September 17, 2020 5:44 PM
> > To: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> > Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>; linux-
> > safety@lists.elisa.tech; development-process@lists.elisa.tech
> > Subject: Re: [linux-safety] [ELISA Development Process WG] [PATCH] mm:
> > vmscan: provide a change to the development-process group
> > 
> > 
> > 
> > On Thu, 17 Sep 2020, Paoloni, Gabriele wrote:
> > 
> > > > -----Original Message-----
> > > > From: development-process@lists.elisa.tech <development-
> > > > process@lists.elisa.tech> On Behalf Of Lukas Bulwahn
> > > > Sent: Thursday, September 17, 2020 10:44 AM
> > > > To: linux-safety@lists.elisa.tech
> > > > Cc: development-process@lists.elisa.tech; Lukas Bulwahn
> > > > <lukas.bulwahn@gmail.com>
> > > > Subject: [ELISA Development Process WG] [PATCH] mm: vmscan: provide
> > a
> > > > change to the development-process group
> > > >
> > > > I think this change is needed for safety, whatever that might mean to
> > you.
> > > >
> > > > I am unqualified to really make a change here, as I have no clue what this
> > > > code does, nor what my change does, but sure, the testing and
> > verification
> > > > reference process can now point out the required next steps in the
> > > > reference process to test this code and code change.
> > > >
> > > > Good luck :)
> > > >
> > > > Not intended for distribution to the general kernel mailing lists.
> > > >
> > > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > > ---
> > > > I would like to submit such a patch, what do I need to do according to
> > > > the expected testing and verification recommendations for safety-
> > related
> > > > systems?
> > >
> > > Probably the problem is not just limited to submitting patches, but I think it
> > > is a good starting point.
> > >
> > > >
> > > > Please help me. What do I need to compile, what test do I need to run,
> > > > which verification tool do I need to employ for this change?
> > >
> > > Right. I have tried to reformulate the problem as "ok I am looking at or I am
> > > trying to change one or more code lines, so I would like to understand if
> > such
> > > code lines are tested today and how".
> > > Right now if we had a s maintained structural coverage report we could tell
> > > if the impacted code lines are covered and by which tests...I could not find
> > it
> > > so I guess that so far we are missing it....am I wrong?
> > >
> > > As next step I went to look at the function wrapping the impacted code line
> > > that in this case is kswapd. I could not find it tested in the Kunit framework.
> > >
> > > As next steps then I would run the available tests in
> > > https://elixir.bootlin.com/linux/latest/source/tools/testing/selftests
> > > in conjunction with GCOV trying to figure out if that line is covered already
> > > somehow.
> > >
> > > There are probably smarter, better, faster ways to elaborate on this...so
> > > here I just put down what I would do in order to figure this out...
> > >
> > 
> > Gab, these are GREAT ideas and approaches. So, do we intend to provide
> > methods, tools and documentation to really do these things you suggest?
> > 
> > That makes the intensions more tangible to me; if we try to find out
> > how we and anyone else can get that information in some 'easy' way.
> > 
> > You can imagine that for a single-line change, you are suggesting probably
> > quite some few days of work of investigation to get this information,
> > right?
> 
> Unless together with the test frameworks in Linux we start maintaining a
> corresponding structural coverage report that would instantly map the
> affected code lines against the corresponding test.
> 
> Then reading the corresponding test we can figure out if the tests are still
> valid (i.e. - black box - have I changed any behavior with my patch compared
> to the expected result of the tests? or - white box - am I able to reach my
> new change using the current test suites?)
> 
> My feeling is that we just need to get started putting together a more
> structured test framework and report and them the problem as presented
> by this patch would be very straightforward
> 

Show me and I will believe you, Gab :)

If we can pull this off, we could actually impress some people in the 
kernel community.

This sounds like a plan that could serve as reference for the next 
patch to come...

Lukas
