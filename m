Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2C9C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:42:39 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.12740.1636036958624266031
 for <linux-safety@lists.elisa.tech>;
 Thu, 04 Nov 2021 07:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q2sc26fR;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id r28so5619187pga.0
        for <linux-safety@lists.elisa.tech>;
 Thu, 04 Nov 2021 07:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+MCr81lxpsTzeWFkJmfElBQo01kW7yvGUIM0k2mbgis=;
        b=q2sc26fRCHmDSsru3axdtXI42qDEAxk6bHiv6x6K+828s5BcvgOTShqAdolpuYtORs
         wltAlyzh4BSJegP+wG6f9rAGBxuA/bsYGMgpH3ip3GzHFpC6sjui9rHezFPTcKcUHEA6
         oUpnyasGB9HRYwRNCp5lYilIP+bq/Rysttdq9SeP+73SbBYAfaT5EnWZu6U+hncafhqM
         V3HLJhZpJX4wOew/hlY9h0+saC1ajgl3RsgWjPp/wzp/uUMfhb9SV2K42cB57YU57en7
         T5Xct5QdEJR7K7d+3faccfPWLb0JE+pp59u0KrB+IDWJsHEGkGaEV67+2GRlJ2Yl7vIt
         Pz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+MCr81lxpsTzeWFkJmfElBQo01kW7yvGUIM0k2mbgis=;
        b=at+W9iEfS5hA9uojGGWSSwbPAnmDzuB8lZgpNYjaccvc77gpmoghFfOorXVNLCueub
         +2aPkfpLM+em9h6TkSO2dy51YbHm4UhqLell9WY3ikX+h4o19m/JuTZXaWOMHiKN6xaA
         l7l94dKVf067/+1zSts6cUl/4BIvnDxy8ST1kFf09fCTeOGBmQ2jGkzSQ9puVt5ZKrGk
         LFee16YHZKpzSm/TXEbBsALJBleTBqAmJQ5sbzCtOih1u64hAPkATpFdAzRnLtAGHD1+
         i6n/yXzryLpQtZC0tNGTnUnLgKVOoqqtO1P+ASaLiJyAX2LuHe2A60IXAocSAiq9Ua7l
         wwLw==
X-Gm-Message-State: AOAM533DutbDNl0mcmviSdEvIuF4gKRvJZ+d1g7H8RZHkmOdkMHyVHKe
	dDr8bocdyripRLnV2ioFYLE=
X-Google-Smtp-Source: 
 ABdhPJzTn1ka2mKb23GgrfAgW/dadKsH6/1by8n4LtY+EXqzNgAOhfecYQqVVk7NnyETz+yjwmUSIw==
X-Received: by 2002:a05:6a00:1994:b0:47e:64e5:a1b3 with SMTP id
 d20-20020a056a00199400b0047e64e5a1b3mr47185136pfl.64.1636036957906;
        Thu, 04 Nov 2021 07:42:37 -0700 (PDT)
Received: from ubuntu ([171.224.180.34])
        by smtp.gmail.com with ESMTPSA id
 u2sm5064887pfi.120.2021.11.04.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:42:37 -0700 (PDT)
Date: Thu, 4 Nov 2021 21:42:32 +0700
From: Nghia Le <nghialm78@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Subject: Re: [PATCH] ipv6: remove useless assignment to newinet in
 tcp_v6_syn_recv_sock()
Message-ID: <20211104144232.GA32520@ubuntu>
References: <20211103232722.30999-1-nghialm78@gmail.com>
 <CAKXUXMx9kvY7g8VRsNfZPZ-8=EpCoGOsK7igHqjNQfJO4UwGBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAKXUXMx9kvY7g8VRsNfZPZ-8=EpCoGOsK7igHqjNQfJO4UwGBA@mail.gmail.com>
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Thu, 04 Nov 2021 14:42:39 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/263

On Thu, Nov 04, 2021 at 07:50:18AM +0100, Lukas Bulwahn wrote:
> On Thu, Nov 4, 2021 at 12:28 AM Nghia Le <nghialm78@gmail.com> wrote:
> >
> > The newinet value is initialized with inet_sk() in a block code starting
> > from checking condition of protocol to exiting by returning newsk
> > structure. Along the code path, newinet is never read. Thus, assignment
> > to newinet is wredundant and can be removed.
> >
> 
> Just a bit improving your English:
> 
> s/in a block code starting from checking condition of protocol to
> exiting by returning newsk structure/in a block code to handle sockets
> for the ETH_P_IP protocol/
> 
> s/Along the code path/Along this code path/
> 
> s/wredundant/redundant/
> 
> I would prefer "needless" or "useless" to "redundant", but all words are okay.
> 
> Lukas
> 
> > Signed-off-by: Nghia Le <nghialm78@gmail.com>
> > ---
> >  net/ipv6/tcp_ipv6.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> > index 2cc9b0e53ad1..551fce49841d 100644
> > --- a/net/ipv6/tcp_ipv6.c
> > +++ b/net/ipv6/tcp_ipv6.c
> > @@ -1263,7 +1263,6 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
> >
> >                 inet_sk(newsk)->pinet6 = tcp_inet6_sk(newsk);
> >
> > -               newinet = inet_sk(newsk);
> >                 newnp = tcp_inet6_sk(newsk);
> >                 newtp = tcp_sk(newsk);
> >
> > --
> > 2.25.1
> >
Thanks Lukas, I revised and submitted patch to public mailing list.
Best regards,
Nghia Le

