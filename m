Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0790BC433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 11:56:34 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.9845.1633175792935531401
 for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 04:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L8QT6zg3;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: nghialm78@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id x27so49524352lfu.5
        for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KErbxHvPVdYW2PUdOpsmeeK72DV+p4hfHHQDE5GELqU=;
        b=L8QT6zg3V4wE2xUJ70+oClTrJcueFEWh32q04TKIxRfZgqbJnMe8ONEtdrU7tBmlDn
         lZzwurpHggCN2v3JR88hMPCMHe6WOcDiBR+8/GqKBdUBQsgrjW+ReBr2yuQeHcpRc1Rh
         dqoYWsLZGK8XurxbYubnQkMshhyNjDd+nydAQzMVdLFM22wDY6eu2tV0eISJkj6+mjXU
         CauFJNdnnb/VKt4/SvTNxEPqMZ7jl6FVBmB4nTVCfucLugDzba5Wk2I6qdnbRK4pidw3
         c9iYkwew7llxLzXqzFUAuo5+0FoL8DhkmpKRXUTLkSMrq5J6ZJ1OT/QxyIm1FomgV8sf
         cDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KErbxHvPVdYW2PUdOpsmeeK72DV+p4hfHHQDE5GELqU=;
        b=LECtKY8fVc/gr8RfjHSihrPqkX3/sY8wm71pgUqw32CKSSmOQkWBNSsGWBHbAJIztx
         1594Dtl7mpiNP64denIJWkVN4xd6svEjf1UlnR+7u+alvvTdlDZzsgfW4yTaXeveSfdY
         T3E6HZqeWRi4/tDhkOYFidnbSe+MbscDW6mo95ufyrWiUGDvG1V/GvlS68RTszsXT8n/
         xRGHOafMls7geTb7gwTIChIi8Gv+MH5LCdpZ/VpklcZGLYFH5vc7H9qyqRb8pAwsPQpb
         bAEMyUFrYOi8p1VXjmEULDpAp1YpBa96DivqWcS1c5ZEMdJEub3K5W5nF60FJzgBXi1k
         7INQ==
X-Gm-Message-State: AOAM533yniiY61TrqOlxLfWo/cJy7GdqtACSkk3JxCa5fHvOxqorZ7FV
	dclIbojjNE6VYlTzkisOUQ8csUnzwnNVmYr+5C0=
X-Google-Smtp-Source: 
 ABdhPJwr1p2d+1DdlMg98LVCVJMRP8EkXgWR/MCVnGln3ma+A8ywoxviwnNGkmLwqJtieXzmNEo59ruoJzST7B8aQpk=
X-Received: by 2002:a05:6512:3e03:: with SMTP id
 i3mr3667068lfv.374.1633175790720;
 Sat, 02 Oct 2021 04:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211001175732.75170-1-nghialm78@gmail.com>
 <CAKXUXMwT+dH_OZc_eJBMtSfbcL5hvhBoFXXbd1b_AcM2sBvW0A@mail.gmail.com>
In-Reply-To: 
 <CAKXUXMwT+dH_OZc_eJBMtSfbcL5hvhBoFXXbd1b_AcM2sBvW0A@mail.gmail.com>
From: Nghia Le <nghialm78@gmail.com>
Date: Sat, 2 Oct 2021 18:56:20 +0700
Message-ID: 
 <CADkY59s+gU+jPJkMfaPLwSg-=RxY8LvnQT4x6UKpMFEN51PcUQ@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb.c: remove deadstore in demote_size_show()
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: multipart/alternative; boundary="000000000000dc991805cd5d5e93"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Sat, 02 Oct 2021 11:56:34 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/250

--000000000000dc991805cd5d5e93
Content-Type: text/plain; charset="UTF-8"

Dear Lukas,
Thank you for detailed comments as well as your help. Patch v2 is ready for
next review.
Best regards,
Nghia Le

On Sat, Oct 2, 2021 at 12:14 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> Just some minor improvements for the language:
>
> On Fri, Oct 1, 2021 at 7:57 PM Nghia Le <nghialm78@gmail.com> wrote:
> >
> > Deadstore was detected by CodeCheck tool (ELISA group)
>
> Hints:
>   - Use active instead of passive tense
>   - It is detected by "make clang-analyzer". The CodeChecker tool is
> just the webUI frontend.
>   - Dead store is written as two words (with a space between dead and
> store).
>
> So, make it:
> The command "make clang-analyzer" detected a dead store.
>
> >
> > Removed demote_size and relevant assignment in function
> demote_size_show()
> > to fix deadstore issue of which stored value to demote_size is never read
> >
>
> Hints:
>   - Use imperative form.
>   - ... and just some better English grammar.
>
> So make it:
> Remove demote_size and corresponding assignment in function
> demote_size_show()
> to fix dead store, as demote_size is never read.
>
> Also change deadstore to dead store in subject.
>
> Other than that, it looks good to me.
>
> Send a PATCH v2 here. Then, we check again and you can send the patch
> out to the maintainers.
>
> Lukas
>
> > Signed-off-by: Nghia Le <nghialm78@gmail.com>
> > ---
> >  mm/hugetlb.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 993efa70bce4..ef00e6ad0f6a 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -3706,11 +3706,9 @@ static ssize_t demote_size_show(struct kobject
> *kobj,
> >                                         struct kobj_attribute *attr,
> char *buf)
> >  {
> >         struct hstate *h;
> > -       unsigned long demote_size;
> >         int nid;
> >
> >         h = kobj_to_hstate(kobj, &nid);
> > -       demote_size = h->demote_order;
> >
> >         return sysfs_emit(buf, "%lukB\n",
> >                         (unsigned long)(PAGE_SIZE << h->demote_order) /
> SZ_1K);
> > --
> > 2.25.1
> >
>

--000000000000dc991805cd5d5e93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Lukas,<div>Thank you for detailed comments as well as=
 your help. Patch v2 is ready for next review.</div><div>Best regards,</div=
><div>Nghia Le</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sat, Oct 2, 2021 at 12:14 PM Lukas Bulwahn &lt;<a hr=
ef=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Just some mino=
r improvements for the language:<br>
<br>
On Fri, Oct 1, 2021 at 7:57 PM Nghia Le &lt;<a href=3D"mailto:nghialm78@gma=
il.com" target=3D"_blank">nghialm78@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Deadstore was detected by CodeCheck tool (ELISA group)<br>
<br>
Hints:<br>
=C2=A0 - Use active instead of passive tense<br>
=C2=A0 - It is detected by &quot;make clang-analyzer&quot;. The CodeChecker=
 tool is<br>
just the webUI frontend.<br>
=C2=A0 - Dead store is written as two words (with a space between dead and =
store).<br>
<br>
So, make it:<br>
The command &quot;make clang-analyzer&quot; detected a dead store.<br>
<br>
&gt;<br>
&gt; Removed demote_size and relevant assignment in function demote_size_sh=
ow()<br>
&gt; to fix deadstore issue of which stored value to demote_size is never r=
ead<br>
&gt;<br>
<br>
Hints:<br>
=C2=A0 - Use imperative form.<br>
=C2=A0 - ... and just some better English grammar.<br>
<br>
So make it:<br>
Remove demote_size and corresponding assignment in function demote_size_sho=
w()<br>
to fix dead store, as demote_size is never read.<br>
<br>
Also change deadstore to dead store in subject.<br>
<br>
Other than that, it looks good to me.<br>
<br>
Send a PATCH v2 here. Then, we check again and you can send the patch<br>
out to the maintainers.<br>
<br>
Lukas<br>
<br>
&gt; Signed-off-by: Nghia Le &lt;<a href=3D"mailto:nghialm78@gmail.com" tar=
get=3D"_blank">nghialm78@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 mm/hugetlb.c | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/mm/hugetlb.c b/mm/hugetlb.c<br>
&gt; index 993efa70bce4..ef00e6ad0f6a 100644<br>
&gt; --- a/mm/hugetlb.c<br>
&gt; +++ b/mm/hugetlb.c<br>
&gt; @@ -3706,11 +3706,9 @@ static ssize_t demote_size_show(struct kobject =
*kobj,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct kobj_attribute *attr, char *buf)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct hstate *h;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long demote_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nid;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h =3D kobj_to_hstate(kobj, &amp;nid);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0demote_size =3D h-&gt;demote_order;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sysfs_emit(buf, &quot;%lukB\n&=
quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(unsigned long)(PAGE_SIZE &lt;&lt; h-&gt;demote_order) =
/ SZ_1K);<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</blockquote></div>

--000000000000dc991805cd5d5e93--

