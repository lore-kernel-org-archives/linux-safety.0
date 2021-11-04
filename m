Return-Path: <lukas.bulwahn@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CF3C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 06:50:31 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web08.8146.1636008630981790956
 for <linux-safety@lists.elisa.tech>;
 Wed, 03 Nov 2021 23:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GDD8TZtE;
 spf=pass (domain: gmail.com, ip: 209.85.219.172,
 mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id v7so12352848ybq.0
        for <linux-safety@lists.elisa.tech>;
 Wed, 03 Nov 2021 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jbigMQy/07dRRWZojAU06C3gwE/zcPHHk34UE76WuUI=;
        b=GDD8TZtEcgDiKulO3xNcb7YQy7rWktGLjFhFAeDLnY6nRPPwYSR0Zk4rvohgWdRiAn
         uOL7VCxh3KE9ZZh6krCZzmP1/r8sgUh3wX0GRioHL/xC5y6GNEWabVVplCBP7k0px9Ag
         Zvi6dbNcfQiTm8/QvckKpx0ccYdQV/g/Fdi8GeDu+D2v+MaVo0OFTEgs+BCSV1zZxZ6H
         QLznw53c1b8gDTXdQTd0J12VAqg+2re/D9NQSmI08S5Q7jJuhPI1qmUaAs88Y1/pdU1J
         uJyoO/Na630wMO+9wJK2nRuNSBh8yxZq2lbPW8EEwPgk68kOsGD8aZgfSZ/qoKz6XJdd
         Lokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jbigMQy/07dRRWZojAU06C3gwE/zcPHHk34UE76WuUI=;
        b=dBW8amlGARnmjz0citu+m2jXHmnrQAlsiMKt6A1BJZktVMw26GbRjbgVue80Bit3sA
         RtWjaG7iyt7F0PiurLmTDTqquVLKzOd3AFfj/jTm1CMbNLJtt6rbWPSOx1gGG4wBxNHw
         BxryBbTyXt1GtjZVvhIRy8QSvYvd6+5slaZP/NNXZ+Ixpd7f19tm7y/4UG1vl82poAjD
         q0ndO9W4Qjpobb1JRRxfNa2DMgXY/nb/z4PnSe9f/vINDvB1KVB+Pzq8yCX19Mlg5PpT
         w8MhiuMB8o8ZnSQVhWaUZL3PR4Y3PEu1eh6wJ64UoZKh29RA/jIPVvTqNOs97rbapVCQ
         Il5Q==
X-Gm-Message-State: AOAM5326xR3njKeLalijgKlP/wEp1G1H0Pc0rr1TH2boBMFfHjcw1hl5
	tVeV51dGRf1Ls0fgthuMrRQKb8B5pw8EXkGe9uM=
X-Google-Smtp-Source: 
 ABdhPJxfOrAbXdUpPLp9ArufFHpJ2XU++lTUHPDUJ4M25X6WX5vPmqDvtJaxt65HnOvGiv+HdqDRtW1j/ZelhDXfg2M=
X-Received: by 2002:a25:34d5:: with SMTP id
 b204mr41535991yba.154.1636008629986;
 Wed, 03 Nov 2021 23:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211103232722.30999-1-nghialm78@gmail.com>
In-Reply-To: <20211103232722.30999-1-nghialm78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 4 Nov 2021 07:50:18 +0100
Message-ID: 
 <CAKXUXMx9kvY7g8VRsNfZPZ-8=EpCoGOsK7igHqjNQfJO4UwGBA@mail.gmail.com>
Subject: Re: [PATCH] ipv6: remove useless assignment to newinet in
 tcp_v6_syn_recv_sock()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Thu, 04 Nov 2021 06:50:31 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/262

On Thu, Nov 4, 2021 at 12:28 AM Nghia Le <nghialm78@gmail.com> wrote:
>
> The newinet value is initialized with inet_sk() in a block code starting
> from checking condition of protocol to exiting by returning newsk
> structure. Along the code path, newinet is never read. Thus, assignment
> to newinet is wredundant and can be removed.
>

Just a bit improving your English:

s/in a block code starting from checking condition of protocol to
exiting by returning newsk structure/in a block code to handle sockets
for the ETH_P_IP protocol/

s/Along the code path/Along this code path/

s/wredundant/redundant/

I would prefer "needless" or "useless" to "redundant", but all words are okay.

Lukas

> Signed-off-by: Nghia Le <nghialm78@gmail.com>
> ---
>  net/ipv6/tcp_ipv6.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index 2cc9b0e53ad1..551fce49841d 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -1263,7 +1263,6 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
>
>                 inet_sk(newsk)->pinet6 = tcp_inet6_sk(newsk);
>
> -               newinet = inet_sk(newsk);
>                 newnp = tcp_inet6_sk(newsk);
>                 newtp = tcp_sk(newsk);
>
> --
> 2.25.1
>

