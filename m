Return-Path: <lukas.bulwahn@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A39C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:49:57 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.67.1635176995854193601
 for <linux-safety@lists.elisa.tech>;
 Mon, 25 Oct 2021 08:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f/XZPbxJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id t127so27075755ybf.13
        for <linux-safety@lists.elisa.tech>;
 Mon, 25 Oct 2021 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rTCjhTyjOLYMeX0XAKvtO4OSRTmRshaq+0Gq64h9RfU=;
        b=f/XZPbxJP6vb5PPXViKihGZ/sFaXLWTufb6rCq5MiBp6ObU/hV5Uguie4XLzmjJI44
         TWp7XuXQ7Qn1JOmw/Uc7uX1uIYESkwBIbHMB+YQww/O1dYv3LtUft71AQm4JeEWFXFVn
         NwKjsT0x3s15XgEdMtspJsjkuWzt123mbsXLGEvfyRKt6U5QvMVJ51qGXCThe6v13r0s
         iwjl6i4AM/DtNSblslW59VwPq/Rry+MS7tndyi68AxnJ4aA/QqkVyHKg7LoA6+Bw8elK
         Ko66xIdlFovKwD2Kxaw3PE3f6tnbg8GRyPb71WP8AP0IjRMF1HWyZYVbc/qLc+VdrO8I
         Fa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rTCjhTyjOLYMeX0XAKvtO4OSRTmRshaq+0Gq64h9RfU=;
        b=z1Q2+ZhjN/hztUgDFn0kvOvQ3cT2dZzrzTsdNypaoL2m/WidRWp2PclfFakqf59yX8
         yNespdIguZqWVgi3c4HVSe4GIUbHw0mv63L4nCqTLrOAhgu/0IIdf2Yvv/Gm+Ry43LrQ
         AEvbHNaBR2gaP1iOn8vPnbiVDp6ZkI9UnglP7y7BRv3MbwPMLwDgXFLb/qasKWhUETTj
         4HFjBbe41TP07SlTnhxZUlUYND4nWdaZ8A4y97deF4I5P1NmawTwJe0o8cSSKE9oZjg5
         7hM6kDj7l/vLtJXxTs1ssZYeNatBhXmhDi3naj4Rr5KFM2/76lHrZjg/elY19hnXBYdW
         buVg==
X-Gm-Message-State: AOAM532VeiMrQs9Modtl+85f5lnqdf47nyjfvmaGYlsDzkhVrFRBo3OP
	WPo0dVlT9aV3lVPlmoLiYpwzk1uAsxnEv7RxLNk=
X-Google-Smtp-Source: 
 ABdhPJz1DgpSdLAtLxbNYG8Y9PrkVvknuAay4Cu7nsG3uBM38+UbbGFA8CmqX1dLV0493YP+t93gialpkEJMMU5zBs0=
X-Received: by 2002:a25:10d7:: with SMTP id
 206mr17924710ybq.339.1635176994986;
 Mon, 25 Oct 2021 08:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174242.20627-1-nghialm78@gmail.com>
In-Reply-To: <20211021174242.20627-1-nghialm78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 25 Oct 2021 17:49:44 +0200
Message-ID: 
 <CAKXUXMxC+pGWzkNvM0N+RfM04-45RAVqaBWc9oV9_zbpfrvnsA@mail.gmail.com>
Subject: Re: [PATCH v2] ext4: remove useless resetting io_end_size in
 mpage_process_page()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Mon, 25 Oct 2021 15:49:57 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/256

On Thu, Oct 21, 2021 at 7:43 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> The command "make clang-analyzer" detects dead stores.

maybe mention that it detects dead stores in mpage_process_page().

>
> Do not reset io_end_size to 0 in the current paths, as the function
> exists on those paths wihout further using io_end_sized.

just a few typo:

s/exists/exits/
s/wihout/without/
s/io_end_sized/io_end_size/

So far it looks good. Can you correct those minor points above and
then we should be fine...

Lukas

>
> Signed-off-by: Nghia Le <nghialm78@gmail.com>
> ---
>  fs/ext4/inode.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 0f06305167d5..03efed2ed1ea 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -2260,7 +2260,6 @@ static int mpage_process_page(struct mpage_da_data *mpd, struct page *page,
>                         mpd->map.m_len = 0;
>                         mpd->map.m_flags = 0;
>                         io_end_vec->size += io_end_size;
> -                       io_end_size = 0;
>
>                         err = mpage_process_page_bufs(mpd, head, bh, lblk);
>                         if (err > 0)
> @@ -2285,7 +2284,6 @@ static int mpage_process_page(struct mpage_da_data *mpd, struct page *page,
>         } while (lblk++, (bh = bh->b_this_page) != head);
>
>         io_end_vec->size += io_end_size;
> -       io_end_size = 0;
>         *map_bh = false;
>  out:
>         *m_lblk = lblk;
> --
> 2.25.1
>

