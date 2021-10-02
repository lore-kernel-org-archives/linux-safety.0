Return-Path: <SRS0=Hq7p=OW=lists.elisa.tech=bounce+72012+250+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706EFC433F5
	for <linux-safety@archiver.kernel.org>; Sat,  2 Oct 2021 11:56:34 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF7B061AED
	for <linux-safety@archiver.kernel.org>; Sat,  2 Oct 2021 11:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF7B061AED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id N77nYY5279335x9IedIfRsgl; Sat, 02 Oct 2021 04:56:33 -0700
X-Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.9845.1633175792935531401
 for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 04:56:33 -0700
X-Received: by mail-lf1-f50.google.com with SMTP id x27so49524352lfu.5
        for <linux-safety@lists.elisa.tech>; Sat, 02 Oct 2021 04:56:32 -0700 (PDT)
X-Gm-Message-State: 6jhNGbRk49S0ZV8IEBwmpSUbx5278000AA=
X-Google-Smtp-Source: ABdhPJwr1p2d+1DdlMg98LVCVJMRP8EkXgWR/MCVnGln3ma+A8ywoxviwnNGkmLwqJtieXzmNEo59ruoJzST7B8aQpk=
X-Received: by 2002:a05:6512:3e03:: with SMTP id i3mr3667068lfv.374.1633175790720;
 Sat, 02 Oct 2021 04:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211001175732.75170-1-nghialm78@gmail.com> <CAKXUXMwT+dH_OZc_eJBMtSfbcL5hvhBoFXXbd1b_AcM2sBvW0A@mail.gmail.com>
In-Reply-To: <CAKXUXMwT+dH_OZc_eJBMtSfbcL5hvhBoFXXbd1b_AcM2sBvW0A@mail.gmail.com>
From: "Nghia Le" <nghialm78@gmail.com>
Date: Sat, 2 Oct 2021 18:56:20 +0700
Message-ID: <CADkY59s+gU+jPJkMfaPLwSg-=RxY8LvnQT4x6UKpMFEN51PcUQ@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] mm/hugetlb.c: remove deadstore in demote_size_show()
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: multipart/alternative; boundary="000000000000dc991805cd5d5e93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1633175793;
 bh=1jNN5Y3uIvq2xjTd11x0J+keqyUmQa6iVXjXPVOXd+0=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=sx0X9ISPTc6rW/eCs3kqPUCx1Gx/XMaIWZEuGKwLI3JKlgDoV79xPCIItVA/Q/FtLVA
 /5ZeF/flp+x7ZTXOwejSo3Acz4ShdsyBOZWB/MRw1KlCBGN1bQBxezkf+X+6EVA7MKJP8
 2RnTgq+wRlyDDyujJ4yhD9nTKzk1XvK2/r4=
Message-ID: <20211002115620.mIpFX1YH0pCC3Le2FFbkOMbWIsZXfEpuT1sbzU1__ng@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#250): https://lists.elisa.tech/g/linux-safety/message/250
Mute This Topic: https://lists.elisa.tech/mt/86006510/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-



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


 <div width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div> <hr>   L=
inks:<p>   You receive all messages sent to this group.    <p> <a target=3D=
"_blank" href=3D"https://lists.elisa.tech/g/linux-safety/message/250">View/=
Reply Online (#250)</a> |  <a target=3D"_blank" href=3D"mailto:nghialm78@gm=
ail.com?subject=3DPrivate:%20Re:%20Re%3A%20%5Blinux-safety%5D%20%5BPATCH%5D=
%20mm%2Fhugetlb.c%3A%20remove%20deadstore%20in%20demote_size_show%28%29">Re=
ply To Sender</a>  | <a target=3D"_blank" href=3D"mailto:linux-safety@lists=
.elisa.tech?subject=3DRe:%20Re%3A%20%5Blinux-safety%5D%20%5BPATCH%5D%20mm%2=
Fhugetlb.c%3A%20remove%20deadstore%20in%20demote_size_show%28%29">Reply To =
Group</a>   |  <a target=3D"_blank" href=3D"https://lists.elisa.tech/mt/860=
06510/5278000">Mute This Topic</a>  | <a href=3D"https://lists.elisa.tech/g=
/linux-safety/post">New Topic</a><br>    <a href=3D"https://lists.elisa.tec=
h/g/linux-safety/editsub/5278000">Your Subscription</a> | <a href=3D"mailto=
:linux-safety+owner@lists.elisa.tech">Contact Group Owner</a> |  <a href=3D=
"https://lists.elisa.tech/g/linux-safety/unsub">Unsubscribe</a>  [linux-saf=
ety@archiver.kernel.org]<br> <div width=3D"1" style=3D"color:white;clear:bo=
th">_._,_._,_</div>=20


--000000000000dc991805cd5d5e93--
