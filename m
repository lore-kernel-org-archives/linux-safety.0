Return-Path: <bounce+72012+266+5278000+9232812@lists.elisa.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA734C4332F
	for <linux-safety@archiver.kernel.org>; Mon,  6 Dec 2021 15:36:26 +0000 (UTC)
X-Received: by 127.0.0.2 with SMTP id 73bOYY5279335xI6DZitZgGz; Mon, 06 Dec 2021 07:36:26 -0800
X-Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web12.53058.1638804985856439745
 for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 07:36:26 -0800
X-Received: by mail-yb1-f177.google.com with SMTP id y68so32489162ybe.1
        for <linux-safety@lists.elisa.tech>; Mon, 06 Dec 2021 07:36:25 -0800 (PST)
X-Gm-Message-State: tdYabWD1mFJMPsLl0rIQqxQ0x5278000AA=
X-Google-Smtp-Source: ABdhPJzCojeg/1/BS6q5520ALWRVtOy/OvS4vUUn6kbKnBq6RWOl12lhWGzmHNgig3ibX1nBXP6sz1zlTd5IaCi5DdA=
X-Received: by 2002:a25:4253:: with SMTP id p80mr43044018yba.312.1638804984948;
 Mon, 06 Dec 2021 07:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20211206150139.5463-1-milan.lakhani@codethink.co.uk>
In-Reply-To: <20211206150139.5463-1-milan.lakhani@codethink.co.uk>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Mon, 6 Dec 2021 16:36:14 +0100
Message-ID: <CAKXUXMxHScEHRhQCrz2zoeh4ju=v3RyLSaDXqWUTheFF9XE6RA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] fs/ext4: Remove unecessary deadstores
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: linux-safety@lists.elisa.tech, Nghia Le <nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1638804986;
 bh=tHDpSkoqMpMJg/XSr/jxbONViO19TegxDfXlKQH1NzE=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=fjlXeVuaKuiNpUNdgx1tK8T+ecYn5YJPlp5EuU+EIBqwByFxGuNU0XYLWy2NV3yRohv
 ZjbOjGrTawP//y8gSwAlDG8n+kHPoQDaM6wAlH24dHx7GExcqJaupJ/dAHTASXAiyMGyF
 QxwrDqTdhHtQoA9GrNuGH81tkUDdMLPlddc=
Message-ID: <20211206153614.BewQNKdHFNTH7XPLqOlXBplJ8zG19mnv0SvaFHtjShU@z>

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
> 
>
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#266): https://lists.elisa.tech/g/linux-safety/message/266
Mute This Topic: https://lists.elisa.tech/mt/87541425/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


