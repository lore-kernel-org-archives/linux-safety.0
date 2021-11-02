Return-Path: <SRS0=QGoX=PV=lists.elisa.tech=bounce+72012+259+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55E1C433FE
	for <linux-safety@archiver.kernel.org>; Tue,  2 Nov 2021 16:31:06 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729C160EB8
	for <linux-safety@archiver.kernel.org>; Tue,  2 Nov 2021 16:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 729C160EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id soE6YY5279335x1YCV6ZIqje; Tue, 02 Nov 2021 09:31:06 -0700
X-Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.253.1635870665690811171
 for <linux-safety@lists.elisa.tech>;
 Tue, 02 Nov 2021 09:31:05 -0700
X-Received: by mail-yb1-f179.google.com with SMTP id s186so30325997yba.12
        for <linux-safety@lists.elisa.tech>; Tue, 02 Nov 2021 09:31:05 -0700 (PDT)
X-Gm-Message-State: LTMwR82pj1BmMSxvGycAQ2GVx5278000AA=
X-Google-Smtp-Source: ABdhPJynHm2YTzSSHMInV4+U8021Y27DXXnieDLJEYrq+Rg2bJLh1hmGOr9bajtQ/05GHRVBMmfzyBcRnz65+weSKuA=
X-Received: by 2002:a25:71c3:: with SMTP id m186mr38817337ybc.434.1635870664691;
 Tue, 02 Nov 2021 09:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211029155936.18094-1-nghialm78@gmail.com>
In-Reply-To: <20211029155936.18094-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Tue, 2 Nov 2021 17:30:54 +0100
Message-ID: <CAKXUXMwKzf8+wjA_kFhBjETPs-6ZBgHmHP_q7pi6er=1RxpQBA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] io_uring: remove redundant assignment to ret in io_register_iowq_max_workers()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1635870666;
 bh=PtUoknkvhpG5YwQm3xnGnaBNyu/CJga8mnvYMQBhsu0=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=Rl+UOT8G4uSwjiK9172Fh5ifGV32YbWEcz/eQYNatsBRuk/cGr2Zq53upVqEbCPAXjf
 tVq1kwgA0FbKGlnjpvqNp6GWmvZRvwOOi/paISaMbQ5U5uMtcQqHzz/G/xdINiMXTCwY8
 SivYq2DVnW4t0xV7spZ5FI+Mraliin6ELz0=
Message-ID: <20211102163054.K5YPt5btosUtfrDibI_CW306GOFtRArIDr3ul4N1Hn4@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#259): https://lists.elisa.tech/g/linux-safety/message/259
Mute This Topic: https://lists.elisa.tech/mt/86680054/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


