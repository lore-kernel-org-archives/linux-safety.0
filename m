Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.6043.1602528582875681865
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 11:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LFfnQoCW;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id l16so18136972eds.3
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 11:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=p/SLGlk8lpqhdtCEqGLGbSpvvJMdiNWjXO67jUFOW3U=;
        b=LFfnQoCWtE324d4apS2LWKLw1cOKxdfiM6I3RIdlp+Vkk8XlI/wcYIP4v1oWaaFH19
         6pmGEUnx3lXXVbDsMaXe+gaFEJX+V6a4e0DPr8SSYUkN+WsI5LNbSkBoO+IK7GB/diqm
         YkbJkdZ/lLSDxbNCdcvVVOtV3F446e4TAPsnU7cFTkzBGKQyItBHHiHUGwsYnufgQmD/
         33Wsqao1mevtYUYZ5gNa4Nk0y9VrRQR7BEGUdemKDMJohm48DC2y1ezq/WZsXK17Y5EU
         N6w/LbsROveFBWrITbN86yMHdsySNCquvcLCXKrP/ewHaF00/BBwBYKiue2B1oJLZ/SB
         cm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=p/SLGlk8lpqhdtCEqGLGbSpvvJMdiNWjXO67jUFOW3U=;
        b=qhq1fV+7DA5HprjFjAEphCAUaxY7hTadVGvUd343W8sZIN4KLBF+PnC2XL+ZdnvP+D
         22AZdqDUHMqZKpZ0xyeF98VrfQ7gP4tewWiPQuOYgw815bW5rNLQYenEbpCsblaKdUyK
         Mpko7olIwUXxjWp4YsRRTJpcWaCzEAF6h98BdysrkKOzpBEK+zhgJjH1si8jyqj9nrdf
         wbKQf6RHjWwe35qAYv8idsEcQ2bFJpMMKw8XCkTdMNrMBquTWyl+XNuDIeVITPIDRJxn
         GyLMS3UFbml0t5dzH8MPwcQTno2Fh0G2Ftv3cFrPBxV5f9aQwfk4SemT/cQuRmkZItMe
         X1oQ==
X-Gm-Message-State: AOAM532NFDkOwrdK8kISHJSSwAdhRx0CwyKg6X1h+4Q1brYA7zgXVF/d
	AYDuq5eAEYqarebgqvQgUEw=
X-Google-Smtp-Source: ABdhPJwkJnoYwh3Om3ZAoSvCcGzT1tSzp2LzOg9nL0NkfoOs4imbU5bBRWWBKyPxnhYuVPYXjo3lEg==
X-Received: by 2002:a05:6402:220f:: with SMTP id cq15mr16134446edb.24.1602528581256;
        Mon, 12 Oct 2020 11:49:41 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d57:fc00:a1bd:911e:26f6:597])
        by smtp.gmail.com with ESMTPSA id j5sm11114662ejt.52.2020.10.12.11.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 11:49:40 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 20:49:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-kernel <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech, 
    linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <CADVatmN7d+Oy5iHTUK=azHsvFq9+s0rdcjUTz5m_K4Xrf+JvZA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010122029540.17866@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <CADVatmN7d+Oy5iHTUK=azHsvFq9+s0rdcjUTz5m_K4Xrf+JvZA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 12 Oct 2020, Sudip Mukherjee wrote:

> 
> >
> > I am wondering if such comment deserves to be included if we cannot check
> > its validity later...
> 
> I am failing to understand why will you not be able to check its
> validity later. You just need to read the code to check it.
>

Well, I meant automatically checking the validity with some tool, like a 
tool (code analyzer, model checker, ...) that can check if a certain 
annotation holds.

> >
> > I would prefer a simple tool that could check that your basic assumption
> > on the code is valid and if it the basic assumption is still valid,
> > just shut up any stupid tool that simply does not get that these calls
> > here cannot return any error.
> >
> > We encountered this issue because of clang analyzer complaining, but it is
> > clear that it is a false positive of that (smart but) incomplete tool.
> 
> I dont think it is a false positive. The error return value is not
> checked and that is true. Only that it is not applicable because of
> the way the coding is done.
>

Maybe we have different understandings of a false positive reported by a 
tool...

My definitions are in the LPC 2020 presentation, Maintaining results from 
static analysis collaboratively, slide 4:
 
https://linuxplumbersconf.org/event/7/contributions/700/attachments/606/1088/LPC2020-Static-Analysis.pdf

So, for me, what you wrote above is exactly the definition of a
"False Tool Finding (False Positive, Type A)".

Given that Alan will accept to add a comment in the code, it is a "True 
Tool-Induced Change (True Positive, Type B)" because we can actually 
provide a reasonable patch based on what the tool reported (even though it 
is just supportive documentation, no change in the code).
 
> >
> > Do you intend to add comment for all false positives from all tools or are
> > we going to find a better solution than that?
> 
> I think tools will always give you some false positives and you will
> need to read the code to know if its false positive or not. I dont
> think there is any tool yet which will only give true positives.
>

Well, given humans provide some annotations to initially false positives, 
there is a fair chance that a tool only gives true positives after the 
annotations.

With 'just comments', the tool will continue to complain and we will need 
to read the code once again every time we did not know that that case was 
a false positive. That going to happen often, namely every time, a new 
developer looks at the tool report.

Let us check if an annotation can help beyond the current comment. This 
annotation can of course be provided later independently with another 
patch.

Lukas
