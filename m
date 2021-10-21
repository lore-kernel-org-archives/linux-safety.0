Return-Path: <lukas.bulwahn@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49AAC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 15:57:38 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web12.11384.1634831857832482017
 for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 08:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZhQCh2R5;
 spf=pass (domain: gmail.com, ip: 209.85.219.180,
 mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id r184so351585ybc.10
        for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dBLowXB9jigYul+hft1U569RmSRlA0UmLtDJbFRQj7g=;
        b=ZhQCh2R5nwBRUeqvFdLCtCJWOLyAd2muk8sQ55RVlmt26b0F7zAg2nHI9CFtHWq0qF
         qCk9l2ZwwYWGB4PYZy/aaZ2rDvMctrpGnJHqSpYuxXdMQQRgTQ0lp5xj5O1ZL4unpppW
         BJwOu7gpwIzrxgILqi4E6oyDPCgUXGNYZEgC09oiohs4pKb/JEY2CDKMbJYtXOyOBhNf
         efMIdEkAHDsOLprsCj5V9QjG+MW+vpquRFXr90yoHDpAxGQwKaJ9MUCKnn/4tBtC2W8M
         2pbAilFevU+OABrN63WUPJQyclBb05oabb5mUkxjkd+0hyANTfxa3bQqZTCSgQb9AQaD
         ArbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBLowXB9jigYul+hft1U569RmSRlA0UmLtDJbFRQj7g=;
        b=GwXH3H2ph17ADSherE0D/3Qj3+jn3woL5VkXL7K6eNK1bRoC9/OHOutoGl+COCOM6n
         4oH2i0qJyWH8flnkbD6z6Q4mdQnV1MbkKbtXDPgeqIUuo91aLsxF3O7sSh78u3nFB7xf
         UrT8fvZxqhFOOOxXlnXi4BLCA1dMxWZLsU6ru88Cwt0DaECl1sWL0v7wyS1KnNFBp0eU
         O5ib/RXyaL2FXq9C/HSgmX0KES4Z20csn69NtU/9MsLXF/xRIM4csYzdvwVA4du+s1nt
         RWZ08KIm01LCgfXkYLS6nCt1rL32Ql2d25gwZBCL5Jc5QDHoHgL6N3m/PCktZdTG6qUb
         74jw==
X-Gm-Message-State: AOAM532byXoYZoAu55iZlBHA1Gw3aQj3kQza/7bwnoMB/AWeNGk6z1ka
	fU7matw+ulRLCM3sWGXE+A1seokbVVQR5VQy6Y8=
X-Google-Smtp-Source: 
 ABdhPJxTawHIHo/gh3eK2b7yNUNiI7Tk8eaHySwupR0ktNAG+dfU9HVZpQXCprV7zUfXiWL5B2OlHaVKNJutY7UbXq8=
X-Received: by 2002:a25:10d7:: with SMTP id 206mr6991845ybq.339.1634831856931;
 Thu, 21 Oct 2021 08:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021004914.17239-1-nghialm78@gmail.com>
In-Reply-To: <20211021004914.17239-1-nghialm78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 21 Oct 2021 17:57:29 +0200
Message-ID: 
 <CAKXUXMxbLZ=y9EC9KUCCi42rO+n6ceZoPXBiMEo8ZMay=+rTeQ@mail.gmail.com>
Subject: Re: [PATCH] ext4/inode.c: remove dead stores in mpage_process_page()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Thu, 21 Oct 2021 15:57:38 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/253

On Thu, Oct 21, 2021 at 2:50 AM Nghia Le <nghialm78@gmail.com> wrote:
>
> The command "make clang-analyzer" detected dead stores.
>

Use present tense here. s/detected/detects/

> Removed the all the assignments io_end_size=0 to fix dead stores, as
> io_end_size is never read.
>

Use imperative here. So: s/Removed/Remove/

drop the first "the".

Maybe a better wording is:

Do not reset io_end_size to 0 in the current paths, as the function
exists on those paths without further using io_end_size.

... and the subject line could be "ext4: remove useless resetting
io_end_size in mpage_process_page()".

I hope this helps.

Lukas

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

