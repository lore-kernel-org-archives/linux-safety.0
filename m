Return-Path: <lukas.bulwahn@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0361C433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:36:26 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web12.53058.1638804985856439745
 for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 07:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rnc0pYHu;
 spf=pass (domain: gmail.com, ip: 209.85.219.177,
 mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id y68so32489162ybe.1
        for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jJkccAM7qkFYX+zETaAlVw8olC7TpePVILstk/GEQA=;
        b=Rnc0pYHuhfqQjtVPyL22cojdjaNic2+gUXC83dtlwN3LEEpAPNNjF5ObTzzX0tpOI3
         qsiEjXNa2uiUMO4LgorwIgMc/VvWbc15hYa8x7qi77y2JBCgU133KpFfHqi8y1+PDVNu
         6ZJvbfL+jGb4nw8FciUjd20Msrr4MBDDqZwQb6XE5SIiiQp8AD/5AXH3gsk40W+mb0SO
         xINo/7r+OE/KkF3ao2/sEVV9tfltTBMFpWyqsAigpXGCuvv6A1SCXz6dUQlLvYTp+/sn
         9r9CnB7Q70uN87ZGu4BW4uwJlxUBM87DqZn1QuW4ITYDP/VwJ4921uD8wQFRQq6ECsJ7
         UTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jJkccAM7qkFYX+zETaAlVw8olC7TpePVILstk/GEQA=;
        b=01wigQgs54M6Wn1jrXMwqKhFWqca6dFIokb1CGkgMc0vcgmUyTeYXryPhME8TZ0t4Y
         6BTREwm79wTrR0Dbrcg5Wjk6s4+ga9390joUsN2ZHimUyhQ+Q2qJ/WdW7ROzVBuOakSZ
         gpfYhq/7sf8+itUrAIl281nOJ1gmltzwZZeg6nBpr634Nff0f9eY3HDqTlo85Js1bcWd
         8jk4dPPomOrXijMqZi8HZtMLPxHoV2VVKsSKL5E5zBeUCgeUraHcwUt6cdx+Zoqn+wt9
         3NIeqtHjmssgrI/YWktOxfG1k/RVlft+vYMl9UaUEc2wwC0AeOTppVCJNi/NmngY77yL
         QMxQ==
X-Gm-Message-State: AOAM531j5AHPjyDC1AOzNVU+X81WbA/pOEq6Q7+OTGsdq0Wf1rVe4J5j
	U2Hev2vcw99JqsdUFzfUUdKY1xmxDgvvg/XgbWo=
X-Google-Smtp-Source: 
 ABdhPJzCojeg/1/BS6q5520ALWRVtOy/OvS4vUUn6kbKnBq6RWOl12lhWGzmHNgig3ibX1nBXP6sz1zlTd5IaCi5DdA=
X-Received: by 2002:a25:4253:: with SMTP id
 p80mr43044018yba.312.1638804984948;
 Mon, 06 Dec 2021 07:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20211206150139.5463-1-milan.lakhani@codethink.co.uk>
In-Reply-To: <20211206150139.5463-1-milan.lakhani@codethink.co.uk>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 6 Dec 2021 16:36:14 +0100
Message-ID: 
 <CAKXUXMxHScEHRhQCrz2zoeh4ju=v3RyLSaDXqWUTheFF9XE6RA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] fs/ext4: Remove unecessary deadstores
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: linux-safety@lists.elisa.tech, Nghia Le <nghialm78@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Mon, 06 Dec 2021 15:36:26 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/266

On Mon, Dec 6, 2021 at 4:01 PM Milan Lakhani
<milan.lakhani@codethink.co.uk> wrote:
>

I think you do need to provide a commit message. The change looks
reasonable, except dropping the assignment to frame->entries.

The commit message should explain why this should be dropped.

> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  fs/ext4/namei.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 52c9bd154122..f341478e9740 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -2432,7 +2432,6 @@ static int ext4_dx_add_entry(handle_t *handle, struct ext4_filename *fname,
>         if (err != -ENOSPC)
>                 goto cleanup;
>
> -       err = 0;
>         /* Block full, should compress but for now just split */
>         dxtrace(printk(KERN_DEBUG "using %u of %u node entries\n",
>                        dx_get_count(entries), dx_get_limit(entries)));
> @@ -2507,7 +2506,7 @@ static int ext4_dx_add_entry(handle_t *handle, struct ext4_filename *fname,
>                         /* Which index block gets the new entry? */
>                         if (at - entries >= icount1) {
>                                 frame->at = at - entries - icount1 + entries2;
> -                               frame->entries = entries = entries2;
> +                               frame->entries;

This looks strange: you still want to assign frame->entries = entries2, right?

>                                 swap(frame->bh, bh2);
>                         }
>                         dx_insert_block((frame - 1), hash2, newblock);
> @@ -3183,8 +3182,6 @@ int __ext4_unlink(handle_t *handle, struct inode *dir, const struct qstr *d_name
>                 retval = ext4_mark_inode_dirty(handle, dir);
>                 if (retval)
>                         goto out;
> -       } else {
> -               retval = 0;
>         }
>         if (inode->i_nlink == 0)
>                 ext4_warning_inode(inode, "Deleting file '%.*s' with no links",
> --
> 2.25.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#265): https://lists.elisa.tech/g/linux-safety/message/265
> Mute This Topic: https://lists.elisa.tech/mt/87541425/1714638
> Group Owner: linux-safety+owner@lists.elisa.tech
> Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [lukas.bulwahn@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

