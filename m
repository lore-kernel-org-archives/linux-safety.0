Return-Path: <SRS0=CcMt=PJ=lists.elisa.tech=bounce+72012+253+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B291C433FE
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 15:57:39 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7D8611CE
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 15:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC7D8611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id jYSlYY5279335xKAyK0r52Cb; Thu, 21 Oct 2021 08:57:38 -0700
X-Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web12.11384.1634831857832482017
 for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 08:57:38 -0700
X-Received: by mail-yb1-f180.google.com with SMTP id r184so351585ybc.10
        for <linux-safety@lists.elisa.tech>; Thu, 21 Oct 2021 08:57:37 -0700 (PDT)
X-Gm-Message-State: Bi2HLMlnPKxgELUXCzfulbZFx5278000AA=
X-Google-Smtp-Source: ABdhPJxTawHIHo/gh3eK2b7yNUNiI7Tk8eaHySwupR0ktNAG+dfU9HVZpQXCprV7zUfXiWL5B2OlHaVKNJutY7UbXq8=
X-Received: by 2002:a25:10d7:: with SMTP id 206mr6991845ybq.339.1634831856931;
 Thu, 21 Oct 2021 08:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021004914.17239-1-nghialm78@gmail.com>
In-Reply-To: <20211021004914.17239-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Thu, 21 Oct 2021 17:57:29 +0200
Message-ID: <CAKXUXMxbLZ=y9EC9KUCCi42rO+n6ceZoPXBiMEo8ZMay=+rTeQ@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] ext4/inode.c: remove dead stores in mpage_process_page()
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1634831858;
 bh=wDgwk69LuipE3dvJ9NPtjKN1D8lK+abIv66MInBuwoY=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=GxbOQ9O2tCBxS26RxOtzWizMSPe+qHHXa5Mi/ElDl1znUS803YBGCcq4MO1WT6dtYdg
 A8pyJBxsbU847ymP9XQpFFSM2Q7gfgj8WQxXErm8ZTqU7NlyzM6O9IkDxv1OoUR9cp1jg
 vyOfmU9lf4dcTF1vbceFYGsej2VHZ1veBHk=
Message-ID: <20211021155729.8-XhbogCPNrXcPhr8dEjBR45VqBNWHnwkPoB2wdX3o4@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#253): https://lists.elisa.tech/g/linux-safety/message/253
Mute This Topic: https://lists.elisa.tech/mt/86480121/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


