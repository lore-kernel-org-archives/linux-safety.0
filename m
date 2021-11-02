Return-Path: <SRS0=mrKE=PV=lists.elisa.tech=bounce+72012+260+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B56BC433EF
	for <linux-safety@archiver.kernel.org>; Tue,  2 Nov 2021 19:14:15 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A73C60F02
	for <linux-safety@archiver.kernel.org>; Tue,  2 Nov 2021 19:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A73C60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id S5ZlYY5279335xdToShcRI2T; Tue, 02 Nov 2021 12:14:14 -0700
X-Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.1.1635880446467233770
 for <linux-safety@lists.elisa.tech>;
 Tue, 02 Nov 2021 12:14:06 -0700
X-Received: by mail-pf1-f173.google.com with SMTP id o14so7012117pfu.10
        for <linux-safety@lists.elisa.tech>; Tue, 02 Nov 2021 12:14:06 -0700 (PDT)
X-Gm-Message-State: HiyyNo6nmV6Gs0mBP67pOtYGx5278000AA=
X-Google-Smtp-Source: ABdhPJwrgErZzX8rDjz9uDX1y8od3dEycyg1IlHDEAnkonVBWvSYayoMozTq6Vv4lNbcwxQ6EfqqDA==
X-Received: by 2002:a05:6a00:2186:b0:47c:f63:a6e9 with SMTP id h6-20020a056a00218600b0047c0f63a6e9mr39237957pfi.26.1635880445889;
        Tue, 02 Nov 2021 12:14:05 -0700 (PDT)
X-Received: from ubuntu ([171.224.180.34])
        by smtp.gmail.com with ESMTPSA id h4sm3332722pjm.14.2021.11.02.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 12:14:05 -0700 (PDT)
Date: Wed, 3 Nov 2021 02:14:00 +0700
From: "Nghia Le" <nghialm78@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] io_uring: remove redundant assignment to ret in io_register_iowq_max_workers()
Message-ID: <20211102191400.GA28342@ubuntu>
References: <20211029155936.18094-1-nghialm78@gmail.com>
 <CAKXUXMwKzf8+wjA_kFhBjETPs-6ZBgHmHP_q7pi6er=1RxpQBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwKzf8+wjA_kFhBjETPs-6ZBgHmHP_q7pi6er=1RxpQBA@mail.gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1635880454;
 bh=geW5ZLCaWJlmf2/iaLcl+3HuMpAOWPR3lbgpgxvTm3Y=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=xKYRicGlaF5kr71fzhhaNLC527GYyFxlTtAtq98v80PXpjKJzIOTgKwwCXkFHI01p7l
 wvgls8IMJARNDVn7YyL0rpabau/D9yhS2jM2X16EanUzetFYsH+pwQJ8giqYX0RsTJ6gb
 hEK4obpSk8xi/sofySEc+ILSGoJkVBa0OPE=
Message-ID: <20211102191400.d5M8RmSYBurqvU8duzurQImyVT4fwIYi5MTgKuDI_X0@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#260): https://lists.elisa.tech/g/linux-safety/message/260
Mute This Topic: https://lists.elisa.tech/mt/86680054/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


