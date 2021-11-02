Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0198CC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 19:14:07 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.1.1635880446467233770
 for <linux-safety@lists.elisa.tech>;
 Tue, 02 Nov 2021 12:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gh7XDenf;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: nghialm78@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id o14so7012117pfu.10
        for <linux-safety@lists.elisa.tech>;
 Tue, 02 Nov 2021 12:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JfxSrvGxJTJL44rBdmmBDcTDV77db1qGzG/D+n9HYrY=;
        b=gh7XDenfV98xAzQ0PoAp2GD1QH0quqWomqxHDg9vSpt7tywDNnVhgw+dzGn6h9EHMw
         mFbgy9NOr/vOryfXsvT3+A8OwgLWaCiWCROlfzE4W1OhKLLusQMT5Yg3EdWVV8MGCAbQ
         nuuN12tfe5zKB5eOjljNF4Z8bdnUNIE5TgljA63DLrUEaomo8XKpJLIa7nFn3nPKkfId
         oalfGh6STDahzNeglAH0MBtg4mamquSDIp/iNqzmjXtEzIPtfh4SrOMAEZCPWpPjOMHr
         4ilhP4PEdXN0+4Kkwy5z55xX4tWV2c8DJzb0RoeES4eMtS1uOXUfO/5p5XkNW4RB8EUE
         lDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JfxSrvGxJTJL44rBdmmBDcTDV77db1qGzG/D+n9HYrY=;
        b=HwwZ7PadqvyyIk/m9NnrpLYYhR9WjTavuECvvj7lRC2R5l0SJTgqfHluWs6Itvylhr
         PR7iW+YaT5ovrMn6JgwF6pSePrzJ+s2X7GMeXcLnS3sEQojafeNqGlHL5ovvaoC8j+4O
         IPFBICIW4Qv0SfJ2pRB2e+9UYt4C0TtjNxvHXZexFD7E6TbfExsXJC5MqqFumfx/F01M
         x+JvF796EU4UkW+/nJpZoNs6Gcyf7EJzaj/A2FkyQXwy40Y9DjzyaTD1/ScEMFP+Inri
         WQJrKc7rjFZdt81+BZs8PSmwa7nTBdhYLghHqj5FUCpGiQYrqq0V4nR/mJOgQ9Rasosn
         eyRg==
X-Gm-Message-State: AOAM531yL5J45RvP9UlwtwrX/K20nyZEMFzBobMoZwRrNt4P4DXczI6p
	rEcbQcPkRYwSi9zQxV1JNaQ=
X-Google-Smtp-Source: 
 ABdhPJwrgErZzX8rDjz9uDX1y8od3dEycyg1IlHDEAnkonVBWvSYayoMozTq6Vv4lNbcwxQ6EfqqDA==
X-Received: by 2002:a05:6a00:2186:b0:47c:f63:a6e9 with SMTP id
 h6-20020a056a00218600b0047c0f63a6e9mr39237957pfi.26.1635880445889;
        Tue, 02 Nov 2021 12:14:05 -0700 (PDT)
Received: from ubuntu ([171.224.180.34])
        by smtp.gmail.com with ESMTPSA id
 h4sm3332722pjm.14.2021.11.02.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 12:14:05 -0700 (PDT)
Date: Wed, 3 Nov 2021 02:14:00 +0700
From: Nghia Le <nghialm78@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Subject: Re: [PATCH] io_uring: remove redundant assignment to ret in
 io_register_iowq_max_workers()
Message-ID: <20211102191400.GA28342@ubuntu>
References: <20211029155936.18094-1-nghialm78@gmail.com>
 <CAKXUXMwKzf8+wjA_kFhBjETPs-6ZBgHmHP_q7pi6er=1RxpQBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAKXUXMwKzf8+wjA_kFhBjETPs-6ZBgHmHP_q7pi6er=1RxpQBA@mail.gmail.com>
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Tue, 02 Nov 2021 19:14:07 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/260

On Tue, Nov 02, 2021 at 05:30:54PM +0100, Lukas Bulwahn wrote:
> On Fri, Oct 29, 2021 at 6:00 PM Nghia Le <nghialm78@gmail.com> wrote:
> >
> > After the assignment, no paths but only exit path 'err' using ret as
> > return value. However,before going to exit path 'err', ret is changed
> > as the return value of io_wq_max_workers(). Hence, the assignment is
> > redundant and can be removed.
> >
> 
> Just a few comments on wording:
> 
>  After the assignment, no paths but only exit path 'err' using ret as
> return value.
> 
> -> in proper English (as far as I understand):
> 
> Only the exit path with label 'err' uses ret as return value.
> 
I still keep 'After the assignment' to emphasize that we don't involve
the value of ret before the assignment.
> ---
> However, before going to exit path 'err', ret is changed as the return
> value of io_wq_max_workers().
> 
> -> in proper English (as far as I understand):
> 
> However, before exiting through this path with label 'err', ret is
> assigned with the return value of io_wq_max_workers().
> 
> ---
> Hence, the assignment is redundant and can be removed.
> 
> How about?
> 
> Hence, the initial assignment is redundant and can be removed.
> 
> 
> Other than that, it looks good. How about rephrasing a bit as above
> and then sending it to the authors?
> 
> Lukas
> 
> > Signed-off-by: Nghia Le <nghialm78@gmail.com>
> > ---
> >  fs/io_uring.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/fs/io_uring.c b/fs/io_uring.c
> > index acc05ff3aa19..d18f1f46ca83 100644
> > --- a/fs/io_uring.c
> > +++ b/fs/io_uring.c
> > @@ -10800,7 +10800,6 @@ static __cold int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
> >         memcpy(ctx->iowq_limits, new_count, sizeof(new_count));
> >         ctx->iowq_limits_set = true;
> >
> > -       ret = -EINVAL;
> >         if (tctx && tctx->io_wq) {
> >                 ret = io_wq_max_workers(tctx->io_wq, new_count);
> >                 if (ret)
> > --
> > 2.25.1
> >
Thanks Lukas, I submitted patch.

