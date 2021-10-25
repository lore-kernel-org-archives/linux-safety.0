Return-Path: <SRS0=tpJ/=PN=lists.elisa.tech=bounce+72012+256+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A234C4332F
	for <linux-safety@archiver.kernel.org>; Mon, 25 Oct 2021 15:49:57 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F403160F02
	for <linux-safety@archiver.kernel.org>; Mon, 25 Oct 2021 15:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F403160F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id vynPYY5279335xAJe8NKctP5; Mon, 25 Oct 2021 08:49:56 -0700
X-Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.67.1635176995854193601
 for <linux-safety@lists.elisa.tech>;
 Mon, 25 Oct 2021 08:49:56 -0700
X-Received: by mail-yb1-f174.google.com with SMTP id t127so27075755ybf.13
        for <linux-safety@lists.elisa.tech>; Mon, 25 Oct 2021 08:49:55 -0700 (PDT)
X-Gm-Message-State: 20rUZbUdEYT46ixnyxCDcwDrx5278000AA=
X-Google-Smtp-Source: ABdhPJz1DgpSdLAtLxbNYG8Y9PrkVvknuAay4Cu7nsG3uBM38+UbbGFA8CmqX1dLV0493YP+t93gialpkEJMMU5zBs0=
X-Received: by 2002:a25:10d7:: with SMTP id 206mr17924710ybq.339.1635176994986;
 Mon, 25 Oct 2021 08:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174242.20627-1-nghialm78@gmail.com>
In-Reply-To: <20211021174242.20627-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Mon, 25 Oct 2021 17:49:44 +0200
Message-ID: <CAKXUXMxC+pGWzkNvM0N+RfM04-45RAVqaBWc9oV9_zbpfrvnsA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v2] ext4: remove useless resetting io_end_size in mpage_process_page()
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1635176996;
 bh=tYh1OLe7uoedQrNx7oUIbjYSO0oEVuyF62HjdGBRE0U=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=jT++TLC4HquwcyheIQ+5kI3vnC7XXhUAqUfL4nS6N2GFoKPA8/zxP/ZO2WtmGqdTp89
 CmpkCBTElBM9V/kftj43V2EyD5DepW8oMbrTlhZgfQH8/SFOTd7mYOcK9sA8xl9jV2NXX
 pzJS1p2C02m8NSWRuJGtT/Hai55awRXzfSA=
Message-ID: <20211025154944.M6sAbH2ge6OHTyOsh9YCLlgZAvREgIU7cPNNWA3dgnY@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#256): https://lists.elisa.tech/g/linux-safety/message/256
Mute This Topic: https://lists.elisa.tech/mt/86495840/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


