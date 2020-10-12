Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.721.1602515424695859261
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 08:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lUD7+AsC;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id b8so6376003wrn.0
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=mkuNs+7XxlEVvtkC9IIAwWFcSgj3h27AZFQnWZFm0XA=;
        b=lUD7+AsC3gIYyuLjGVkGz6YiVnzefUHoKy63QYSNowSifa9yEth6OS7GbALyfbMTnr
         LvGTXyj7YkXluF2uD9dqQnuvjVR8sebs6lreneRQ5UYklalKSg8hSwL7XtVYdSCITphA
         6VmeQ8r4y2fXb8UQaxh/FVLnvuhzoyWwEaHfgjCtgA6EeO7agVwqK2i9dtf7U4DPMEMJ
         LSkgWoHtBoO8sD9NxY3EpZKVM+gxKt5WvICVfVYmWCRk6YWntGNc7G57vVSObnOVCAIo
         IMtIdelwKZzw7FmbW3qiIxI/3aCDdjnWAjhC82l+zk0ZJvGPVPq6q7bjlp3AmYTk8rZM
         6KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=mkuNs+7XxlEVvtkC9IIAwWFcSgj3h27AZFQnWZFm0XA=;
        b=YIKHDeA+qoktOaj/lU3H78SRWyYP0zkFduMcQaxXSPv1Bz1FBO+pl15crTR5ZoORAD
         xdVjm78cyOaYEyhcCGbSLP10C9+Yw3LqtBZlzDwapJbimLrIhku2cs0waDCxnKB0SgNo
         +GdBtKtCPyVF9qzLkB+2kL6qHBQ9hNHjxp5LrXsXCZyf0je5O9qDrmLrN03iQKMy4mzh
         zh3JcbKKTuxrQ1OCrItqTsvkhE/ARei1hI49k/2CIol1ZGdaOhkXvLJQUlEVjJ4dxUcu
         DNw8kMlvmzX3kIBOSfDn0qZaJdcgE3NLbflNsqQcNtpf9ddiE+NjXmUshdqVyaREZdZB
         2AOw==
X-Gm-Message-State: AOAM5326UbKE2EWaVUlsyLttXLneA+GCRUgj+Fu+ahKvLZxY+ck/9fry
	/l9h7fMfzAlPzVQs7WSjCMA=
X-Google-Smtp-Source: ABdhPJyFfLN8mAuNx/DYHdt0jVUfqeX8Dq1RkoyYSUAkOjaB1Na7Vv03X4kTC2bPoZCBiPZ8BFtgGA==
X-Received: by 2002:adf:f305:: with SMTP id i5mr25025707wro.346.1602515423074;
        Mon, 12 Oct 2020 08:10:23 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d57:fc00:8472:203c:3ecb:c442])
        by smtp.gmail.com with ESMTPSA id c185sm2406624wma.44.2020.10.12.08.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 08:10:22 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 17:10:21 +0200 (CEST)
X-X-Sender: lukas@felia
To: Alan Stern <stern@rowland.harvard.edu>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech, 
    linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201012145710.GA631710@rowland.harvard.edu>
Message-ID: <alpine.DEB.2.21.2010121659040.6487@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia> <20201012145710.GA631710@rowland.harvard.edu>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 12 Oct 2020, Alan Stern wrote:

> On Mon, Oct 12, 2020 at 04:11:38PM +0200, Lukas Bulwahn wrote:
> > 
> > 
> > On Sun, 11 Oct 2020, Sudip Mukherjee wrote:
> > 
> > > Add a comment explaining why find_tt() will not return error even though
> > > find_tt() is checking for NULL and other errors.
> > > 
> > > Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > 
> > I get the intent of the comment but there is a large risk that somebody 
> > could remove the find_tt() call before the calling the function and there 
> > is no chance to then see later that the comment is actually wrong.
> 
> Why would anybody do that?  Who would deliberately go change a driver in 
> a way that is obviously wrong and would break it?  Especially when such 
> changes are likely to cause compile errors?
> 
> There are tons of changes one might make to any program that will leave 
> it syntactically valid but will cause it to fail.  What's special about 
> removing the early calls to find_tt()?
> 
> > I guess you want to link this comment here to a code line above and
> > request anyone touching the line above to reconsider the comment then.
> 
> That really seems unnecessary.
> 
> > But there is no 'concept' for such kind of requests to changes and 
> > comments.
> > 
> > So, the comment is true now, but might be true or wrong later.
> > 
> > I am wondering if such comment deserves to be included if we cannot check 
> > its validity later...
> > 
> > I would prefer a simple tool that could check that your basic assumption 
> > on the code is valid and if it the basic assumption is still valid, 
> > just shut up any stupid tool that simply does not get that these calls 
> > here cannot return any error.
> 
> Real code contains so many assumptions, especially if you include ones 
> which are obvious to everybody, that such a tool seems impractical.
>

I fear that problem applies to all static code analysis tools I have seen; 
at some point, the remaining findings are simply obviously wrong to 
everybody but the tool does not get those assumptions and continues 
complaining, making the tool seem impractical.

Alan, so would you be willing to take patches where _anyone_ simply adds 
comments on what functions returns, depending on what this person might 
consider just not obvious enough?

Or are you going to simply reject this 'added a comment' patch here?

I am not arguing either way, it is just that it is unclear to me what the 
added value of the comment really is here.

And for the static analysis finding, we need to find a way to ignore this 
finding without simply ignoring all findings or new findings that just 
look very similar to the original finding, but which are valid.

Lukas
