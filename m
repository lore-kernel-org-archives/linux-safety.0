Return-Path: <lukas.bulwahn@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529B5C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:31:06 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.253.1635870665690811171
 for <linux-safety@lists.elisa.tech>;
 Tue, 02 Nov 2021 09:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmBDH2ne;
 spf=pass (domain: gmail.com, ip: 209.85.219.179,
 mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id s186so30325997yba.12
        for <linux-safety@lists.elisa.tech>;
 Tue, 02 Nov 2021 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VcSDdcOUystfykUPXO0jA/xYb8jaE4IY6QKSLltzHbQ=;
        b=TmBDH2ne7GQNaTQVH/SENi3W8YDB61zQAil9PThJbLvqTHxYkkq07McRktFU6Qw5fs
         oWGkDIciJqN8qjWGow+YmapmFtZY5lea0JjqoVHObKE2n43bmTGhPbAMtHI4LXcUo/Gs
         mOPH8LnBkTJZbU5V8xgPN9Ju3aKj3E+xGmhJ09Q52HgmwKaIvkg3G8PiqfFDmm2FBVcN
         +6KUoJbZDHkwNFtM9RtXhI7OO9VthNB9BTr+62qp3+xCRLkF83H1fB8LF35hbi2t0PXg
         aMY1nj43Z9UDNTLrVHNEnxR2LrerN8hqjeF55SAhHfWJHGob2A0Z4cXbeHr8+RkJY1aH
         /zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VcSDdcOUystfykUPXO0jA/xYb8jaE4IY6QKSLltzHbQ=;
        b=bk12K+XrvlPmQF0r53TsIopYkoxuy4KPTKWO3hc+Tnr1CLcTYyuGuibxlQJg7Ajw4j
         r8tLzHJRTSpl6NXKvmfD9sQcbc4xYXkDhMjzSLrrD+qH4XPsdX8dnf/kPdo7gGkFF0eP
         gOxylY4FHPCDLiVMNVR3G+RF0+4s7bLbImopNaYGaL1RS+saAsVNuwoLaIpSOZ+KlwT8
         jooGFxl1FMUVsxH4ykGq8fRSFojjsM9oK0tiVOPf+kpjf6bkdqZjmnuvsshp4Bw6X+qH
         VsljE68bQWrBC/qZiiWWdXmNGP7s8NgtzSJt1k+z3G/FTjAdidyMLVvcqNR8HiHiQYbB
         DJDg==
X-Gm-Message-State: AOAM531BPGkiPgYbmChqP+SIYvx+JYOW/kDu8oX6g3IqbZVotIfjRfoD
	lMoB02gVXhwEoyB7dXJYo130nx6H/Swsp7SuK13hBKao0Jw=
X-Google-Smtp-Source: 
 ABdhPJynHm2YTzSSHMInV4+U8021Y27DXXnieDLJEYrq+Rg2bJLh1hmGOr9bajtQ/05GHRVBMmfzyBcRnz65+weSKuA=
X-Received: by 2002:a25:71c3:: with SMTP id
 m186mr38817337ybc.434.1635870664691;
 Tue, 02 Nov 2021 09:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211029155936.18094-1-nghialm78@gmail.com>
In-Reply-To: <20211029155936.18094-1-nghialm78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 2 Nov 2021 17:30:54 +0100
Message-ID: 
 <CAKXUXMwKzf8+wjA_kFhBjETPs-6ZBgHmHP_q7pi6er=1RxpQBA@mail.gmail.com>
Subject: Re: [PATCH] io_uring: remove redundant assignment to ret in
 io_register_iowq_max_workers()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Tue, 02 Nov 2021 16:31:06 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/259

On Fri, Oct 29, 2021 at 6:00 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> After the assignment, no paths but only exit path 'err' using ret as
> return value. However,before going to exit path 'err', ret is changed
> as the return value of io_wq_max_workers(). Hence, the assignment is
> redundant and can be removed.
>

Just a few comments on wording:

 After the assignment, no paths but only exit path 'err' using ret as
return value.

-> in proper English (as far as I understand):

Only the exit path with label 'err' uses ret as return value.

---
However, before going to exit path 'err', ret is changed as the return
value of io_wq_max_workers().

-> in proper English (as far as I understand):

However, before exiting through this path with label 'err', ret is
assigned with the return value of io_wq_max_workers().

---
Hence, the assignment is redundant and can be removed.

How about?

Hence, the initial assignment is redundant and can be removed.


Other than that, it looks good. How about rephrasing a bit as above
and then sending it to the authors?

Lukas

> Signed-off-by: Nghia Le <nghialm78@gmail.com>
> ---
>  fs/io_uring.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index acc05ff3aa19..d18f1f46ca83 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -10800,7 +10800,6 @@ static __cold int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
>         memcpy(ctx->iowq_limits, new_count, sizeof(new_count));
>         ctx->iowq_limits_set = true;
>
> -       ret = -EINVAL;
>         if (tctx && tctx->io_wq) {
>                 ret = io_wq_max_workers(tctx->io_wq, new_count);
>                 if (ret)
> --
> 2.25.1
>

