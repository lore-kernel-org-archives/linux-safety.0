Return-Path: <lukas.bulwahn@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B8EC433F5
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 05:14:06 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web08.7511.1633151645433211843
 for <linux-safety@lists.elisa.tech>;
 Fri, 01 Oct 2021 22:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mTI45zbe;
 spf=pass (domain: gmail.com, ip: 209.85.219.178,
 mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id u32so24834319ybd.9
        for <linux-safety@lists.elisa.tech>;
 Fri, 01 Oct 2021 22:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RUmKshxPlNCpz+egbSeMXWfy/fJa76IcUV/lvJg9NUc=;
        b=mTI45zbe/tmz+w808TWPd28VQfOcd7m7IqnmphcSgXTjnKl16j2GW7HWlrlzE9rC6r
         j/cIN6MJjwBjUm3ODteuyl2vFG9buHv/4Ey0XbryPxbXuCXl1u1+9n+1DIFCG271KVu5
         MoS2GUtOktw/73Bnb/ExV2+6bmgWXNlFHaR+EzvPeyTJcxmbkQROnM3vnNIJXEMwmvGL
         0yzRoot5Etq+vkiWZnmzgZKunGzVv5vMBV7pc3xANnCY4eRpfAuyv8WNLsjVCOzFqr3p
         a0quasf7iFQbp4G+zvq/b8/NTtU5dxHyzZMCyjVvjy7gizIzbAfMS9adAv2jXVshO24R
         Vrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUmKshxPlNCpz+egbSeMXWfy/fJa76IcUV/lvJg9NUc=;
        b=WJp/EtqkAPwPqg3NNmivnCxNiMyIUOLfCXNeUAeFU7Ys7EolXNc+UP96psZEBgzTHd
         pUNfLydXAqTpRndRW8NxY1KDaV3u/Piw59XZVuhq2Kg5TovDhl/wO4nDUpdlnPgNkp8F
         QLe5/jodYf8nwtkNzVbNnsVG1a3n+dGXMJZpExNhlK0E2ovLsdIH5YftzOKRAKy0ZqYY
         CR6DF5LdYf91HGMEFECH+IGRDKwL1Kbj8LMf0UsoNDm0zRQgnYs+pizuvokndWhgLfx7
         qNmyFKhh7Hzh4cwbuKTsPRwqA372D4lleqs7AoqVhYTIGoW8CV1aV7NNTYLhdx7WIl1d
         9VCw==
X-Gm-Message-State: AOAM532HJ1dO/OSgqy+hnoh5OFIGlaq/sT/ahEt7gf1bjDkqRXN9lvyo
	tuQPeI15dwmt3GR0qApGUDYFnAbxZTQmZEFDSaQ=
X-Google-Smtp-Source: 
 ABdhPJx7MH6NbIOMB0h50FqrVMFJU1vlj6wEMWECxnA14s0RVkxu7c8CkNddMyBVvDRX9z8pYy9H+zFARY8qWX/66hA=
X-Received: by 2002:a25:accb:: with SMTP id x11mr1801161ybd.154.1633151644552;
 Fri, 01 Oct 2021 22:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211001175732.75170-1-nghialm78@gmail.com>
In-Reply-To: <20211001175732.75170-1-nghialm78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 2 Oct 2021 07:13:54 +0200
Message-ID: 
 <CAKXUXMwT+dH_OZc_eJBMtSfbcL5hvhBoFXXbd1b_AcM2sBvW0A@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb.c: remove deadstore in demote_size_show()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Sat, 02 Oct 2021 05:14:06 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/248

Just some minor improvements for the language:

On Fri, Oct 1, 2021 at 7:57 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> Deadstore was detected by CodeCheck tool (ELISA group)

Hints:
  - Use active instead of passive tense
  - It is detected by "make clang-analyzer". The CodeChecker tool is
just the webUI frontend.
  - Dead store is written as two words (with a space between dead and store).

So, make it:
The command "make clang-analyzer" detected a dead store.

>
> Removed demote_size and relevant assignment in function demote_size_show()
> to fix deadstore issue of which stored value to demote_size is never read
>

Hints:
  - Use imperative form.
  - ... and just some better English grammar.

So make it:
Remove demote_size and corresponding assignment in function demote_size_show()
to fix dead store, as demote_size is never read.

Also change deadstore to dead store in subject.

Other than that, it looks good to me.

Send a PATCH v2 here. Then, we check again and you can send the patch
out to the maintainers.

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

