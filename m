Return-Path: <lukas.bulwahn@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80421C433FE
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 05:01:02 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.19314.1633237261040516677
 for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 22:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G3T+uXdg;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id z5so29835387ybj.2
        for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 22:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UG230xZhWAbqNgLAGGetzYn1slEWCnzMA4+he45/Xzw=;
        b=G3T+uXdgQlh9bENMcxnT1u+XZN24iiZnGLr1AbeRdqC5e5AEEsPmYl5jwBuwtOHJyK
         d+53HeCf/eN64d5cinbYGhzYAQVHobwsgpQEG+ng94tpu5ZZyVLPI0vI78w4TwTZDIGR
         CMEAqqdvWT4gRKmxDPUZ9sP2HJL8Fbflzj1kbC46XnxAilL/c+qoq2SWA7nrHKhXgS1v
         bIwcNLhrJWYOT5XEhy2uZZE7Y2tNCw2Ibv21VjtihcDdlWJmiA8+L3KcLJJouprODO7V
         RV7wcUKqIloJVUV3StGf9qZOtaVQIL/JCd97RHpMQgcdDmx/Zt2x8Wnj5mUc6k/ZlqZi
         onqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UG230xZhWAbqNgLAGGetzYn1slEWCnzMA4+he45/Xzw=;
        b=gbC9aGgWuF2ad9KagDm9YgLN0CrsAWzVDuCQ8h52Fw5oWv67CSPlRzM5NX/8zezjBm
         LAGtBRIV7vsxtiS9h+suAqT+rpWH0LVOTztxM75iErtM9QOA2HnfKG5qPNdiUwZ2vCgA
         /H2kUrXZYV9lop6ORz9lxn5XCHz3/qjWaIAMyBqkv5KFDmOv9C68uZyUW/AXMrMUaAwp
         KR8uiE3rQCmfgjpvWClgpTVZpMtYe98eL+6yhXP3hfp646GeCXUP2V+J4MvtAw7AnSH0
         vo3lpMsZdjflrNtkfv4bt5e1eyATibzr77VE1WRmMowp1zz7bPo1pfqhOh1KAZctZQ4E
         s3uA==
X-Gm-Message-State: AOAM532RzCtOuU47zMqMm4oS9SVBjyIytDO2PSY2+YFjimTKo8QVYmZa
	eEi4uWA+X2yNd6XQyZ3eZzMUp/KusyitQyXxGZA=
X-Google-Smtp-Source: 
 ABdhPJyi6IMctJP8uAhDTaLiIj0g40xVYdgAhoLQ8UECqf4JFjKVYOK8XD5cPjzqoRlcRuMzd9iTD8xAnB6iWmmZIOk=
X-Received: by 2002:a25:accb:: with SMTP id x11mr6704089ybd.154.1633237260197;
 Sat, 02 Oct 2021 22:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211002115347.77994-1-nghialm78@gmail.com>
In-Reply-To: <20211002115347.77994-1-nghialm78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 3 Oct 2021 07:00:49 +0200
Message-ID: <CAKXUXMxs7kxDhAfertYZ_=XVCFuX99dGAbo5MSGvQZY7zA58sg@mail.gmail.com>
Subject: Re: [PATCH v2] mm/hugetlb.c: remove dead store in demote_size_show()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Sun, 03 Oct 2021 05:01:02 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/251
Message-ID: <20211003050049.4neFNq3_q47CDcms3bcJIJz5wIXHqkxwxakd_Clmu-Y@z>

On Sat, Oct 2, 2021 at 1:53 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> The command "make clang-analyzer" detected a dead store.
>
> Remove demote_size and corresponding assignment in function
> demote_size_show() to fix dead store, as demote_size is never read
>

I suggest adding punctuation (a ".") at the end of this sentence.

Otherwise, this patch looks good.

Send the next revised patch out to the recommendations from
get_maintainers.pl and also CC: kernel-janitors
<kernel-janitors@vger.kernel.org> and me. Thanks.

Great work!

Lukas

> Signed-off-by: Nghia Le <nghialm78@gmail.com>
> ---
>  mm/hugetlb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 993efa70bce4..ef00e6ad0f6a 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3706,11 +3706,9 @@ static ssize_t demote_size_show(struct kobject *kobj,
>                                         struct kobj_attribute *attr, char *buf)
>  {
>         struct hstate *h;
> -       unsigned long demote_size;
>         int nid;
>
>         h = kobj_to_hstate(kobj, &nid);
> -       demote_size = h->demote_order;
>
>         return sysfs_emit(buf, "%lukB\n",
>                         (unsigned long)(PAGE_SIZE << h->demote_order) / SZ_1K);
> --
> 2.25.1
>

