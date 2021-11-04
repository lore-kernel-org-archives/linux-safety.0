Return-Path: <SRS0=TIOS=PX=lists.elisa.tech=bounce+72012+263+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55FEC4332F
	for <linux-safety@archiver.kernel.org>; Thu,  4 Nov 2021 14:42:39 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E90611C1
	for <linux-safety@archiver.kernel.org>; Thu,  4 Nov 2021 14:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71E90611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id CAVMYY5279335xPmMe0AFNFF; Thu, 04 Nov 2021 07:42:39 -0700
X-Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.12740.1636036958624266031
 for <linux-safety@lists.elisa.tech>;
 Thu, 04 Nov 2021 07:42:38 -0700
X-Received: by mail-pg1-f181.google.com with SMTP id r28so5619187pga.0
        for <linux-safety@lists.elisa.tech>; Thu, 04 Nov 2021 07:42:38 -0700 (PDT)
X-Gm-Message-State: PoR2Ib9EVKFCYPVijEIL8wsqx5278000AA=
X-Google-Smtp-Source: ABdhPJzTn1ka2mKb23GgrfAgW/dadKsH6/1by8n4LtY+EXqzNgAOhfecYQqVVk7NnyETz+yjwmUSIw==
X-Received: by 2002:a05:6a00:1994:b0:47e:64e5:a1b3 with SMTP id d20-20020a056a00199400b0047e64e5a1b3mr47185136pfl.64.1636036957906;
        Thu, 04 Nov 2021 07:42:37 -0700 (PDT)
X-Received: from ubuntu ([171.224.180.34])
        by smtp.gmail.com with ESMTPSA id u2sm5064887pfi.120.2021.11.04.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:42:37 -0700 (PDT)
Date: Thu, 4 Nov 2021 21:42:32 +0700
From: "Nghia Le" <nghialm78@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] ipv6: remove useless assignment to newinet in tcp_v6_syn_recv_sock()
Message-ID: <20211104144232.GA32520@ubuntu>
References: <20211103232722.30999-1-nghialm78@gmail.com>
 <CAKXUXMx9kvY7g8VRsNfZPZ-8=EpCoGOsK7igHqjNQfJO4UwGBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx9kvY7g8VRsNfZPZ-8=EpCoGOsK7igHqjNQfJO4UwGBA@mail.gmail.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1636036959;
 bh=rX++puPX5C0eDXEU5lGU4pR5dzZ5+TT3kvHBZ7RU3mM=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=u7iWrO4pdAEc/So/ra0cyC3gLV7zoK33TzB5LRi2ReqdnzB9mEMoQZk4LtR3nrrp29r
 ZDZNpk47+Re2EgjKXHKkU8BtfS2gak39fkVTIFR24jYJLa6wtfp269pphoMU8zqS9aTGz
 tJymMJhtF/s4HmdSHqHLNTO0z1vv40aTmqY=
Message-ID: <20211104144232.6YRc6C5Im08lQ7C1C274uFW7aVcN-fb1E_PAbGKzBK4@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#263): https://lists.elisa.tech/g/linux-safety/message/263
Mute This Topic: https://lists.elisa.tech/mt/86805127/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


