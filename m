Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97904C433FE
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 22:26:10 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.4276.1635200769326515949
 for <linux-safety@lists.elisa.tech>;
 Mon, 25 Oct 2021 15:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hFID7ulm;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: nghialm78@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id y26so12640244lfa.11
        for <linux-safety@lists.elisa.tech>;
 Mon, 25 Oct 2021 15:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NU5LkjiL2SbADvOR8nPmYgeurOZgvmbqex1bnwLoIXY=;
        b=hFID7ulmfUSg/QUP/N99rV1Yyc3IvWNe/8OUDp9uZ0xUXRTYgLh8p5olsiwv1mryFD
         YPAttW0K/V2FP/L38T5LcfFJdMDOZ3sMr7dSCrQ9vhqkM2PD2bf2PxU/KfFy/x3my8pt
         1uFXm+NxDN4+VasPUVokUUMXiYwuPZJCgIAAFLi0lV5ZuCBGQBSbX+s8tEFwk7BW5Ddl
         hiwBWdQ96/VfeVlF2y++KNvI/CELPY5rHq0YwaKobYHdCneVAPHH1KrWmbkBBbp9FHnK
         ZGC5gZDZghfD8sBaBWu79R8e6aGcDYoLhgOdaGrcNIuZvkE0ksBA8nrlCqr4omnVnRGi
         29CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NU5LkjiL2SbADvOR8nPmYgeurOZgvmbqex1bnwLoIXY=;
        b=CbYbvHq92a0cF/aJ3MAFlVHroma7s3S2bb7oYo6QDZ3tOUYfvCi5yBnhm3gmsKv39P
         UEk3EPD/5pq5uHSKrBCFx0tIOu+IHgNa3iX7qXzEgZwcNxsJ5y3FdbTi0xEwF5o0cW9K
         0LrSFg+LdsZ2um/hoZiV+B6HhMT/uB4PDpqgud0KLk44dN7195bZpFhbV2yLj8Twxrmp
         l8NR7OCf7wnujLOUjY1hY7vUuSmN8CPHaTzo/QrmQSzVBlq6uqC466mGX09a0Ch3rhkt
         hDmz+rFkmBBnTMV0TUL0ktIcCDgmVp8lHxGYAUehJlChjNHjY8qLoqXoCCeEGh61zwwp
         av5g==
X-Gm-Message-State: AOAM531SK5Zo7Gk+hbsK5iYsEaAnIL1l0ZXVH7I3uvK6sZUeImjY5Rzw
	6HBZXZggKfCF66Ic54E1PaLekD2/Do8KbuMdksA=
X-Google-Smtp-Source: 
 ABdhPJz2J9u8+AEiOIMz/kOOzK20Ad0gh3c48+iJaLWDtK3gx7m6d2vrc0FUioMsot/v081YpiEuw3mhDFjEkkMxGbk=
X-Received: by 2002:a05:6512:acb:: with SMTP id
 n11mr20153725lfu.222.1635200767383;
 Mon, 25 Oct 2021 15:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174242.20627-1-nghialm78@gmail.com>
 <CAKXUXMxC+pGWzkNvM0N+RfM04-45RAVqaBWc9oV9_zbpfrvnsA@mail.gmail.com>
In-Reply-To: 
 <CAKXUXMxC+pGWzkNvM0N+RfM04-45RAVqaBWc9oV9_zbpfrvnsA@mail.gmail.com>
From: Nghia Le <nghialm78@gmail.com>
Date: Tue, 26 Oct 2021 05:25:56 +0700
Message-ID: 
 <CADkY59uOUOjAZek6k_arWgnrYxD6SJqH=2Uy=3w5_tX9jQKUjQ@mail.gmail.com>
Subject: Re: [PATCH v2] ext4: remove useless resetting io_end_size in
 mpage_process_page()
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: multipart/alternative; boundary="000000000000e05c3805cf34d81c"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Mon, 25 Oct 2021 22:26:10 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/257

--000000000000e05c3805cf34d81c
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,
Thanks a lot for your comments, I fixed typos and submitted patch to public
mailing list.
Best regards,
Nghia Le

On Mon, Oct 25, 2021 at 10:49 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> On Thu, Oct 21, 2021 at 7:43 PM Nghia Le <nghialm78@gmail.com> wrote:
> >
> > The command "make clang-analyzer" detects dead stores.
>
> maybe mention that it detects dead stores in mpage_process_page().
>
> >
> > Do not reset io_end_size to 0 in the current paths, as the function
> > exists on those paths wihout further using io_end_sized.
>
> just a few typo:
>
> s/exists/exits/
> s/wihout/without/
> s/io_end_sized/io_end_size/
>
> So far it looks good. Can you correct those minor points above and
> then we should be fine...
>
> Lukas
>
> >
> > Signed-off-by: Nghia Le <nghialm78@gmail.com>
> > ---
> >  fs/ext4/inode.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > index 0f06305167d5..03efed2ed1ea 100644
> > --- a/fs/ext4/inode.c
> > +++ b/fs/ext4/inode.c
> > @@ -2260,7 +2260,6 @@ static int mpage_process_page(struct mpage_da_data
> *mpd, struct page *page,
> >                         mpd->map.m_len = 0;
> >                         mpd->map.m_flags = 0;
> >                         io_end_vec->size += io_end_size;
> > -                       io_end_size = 0;
> >
> >                         err = mpage_process_page_bufs(mpd, head, bh,
> lblk);
> >                         if (err > 0)
> > @@ -2285,7 +2284,6 @@ static int mpage_process_page(struct mpage_da_data
> *mpd, struct page *page,
> >         } while (lblk++, (bh = bh->b_this_page) != head);
> >
> >         io_end_vec->size += io_end_size;
> > -       io_end_size = 0;
> >         *map_bh = false;
> >  out:
> >         *m_lblk = lblk;
> > --
> > 2.25.1
> >
>

--000000000000e05c3805cf34d81c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lukas,<div>Thanks a lot for your comments, I fixed typo=
s and submitted patch to public mailing list.</div><div>Best regards,</div>=
<div>Nghia Le</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Oct 25, 2021 at 10:49 PM Lukas Bulwahn &lt;<a hr=
ef=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Oct 21=
, 2021 at 7:43 PM Nghia Le &lt;<a href=3D"mailto:nghialm78@gmail.com" targe=
t=3D"_blank">nghialm78@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The command &quot;make clang-analyzer&quot; detects dead stores.<br>
<br>
maybe mention that it detects dead stores in mpage_process_page().<br>
<br>
&gt;<br>
&gt; Do not reset io_end_size to 0 in the current paths, as the function<br=
>
&gt; exists on those paths wihout further using io_end_sized.<br>
<br>
just a few typo:<br>
<br>
s/exists/exits/<br>
s/wihout/without/<br>
s/io_end_sized/io_end_size/<br>
<br>
So far it looks good. Can you correct those minor points above and<br>
then we should be fine...<br>
<br>
Lukas<br>
<br>
&gt;<br>
&gt; Signed-off-by: Nghia Le &lt;<a href=3D"mailto:nghialm78@gmail.com" tar=
get=3D"_blank">nghialm78@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 fs/ext4/inode.c | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c<br>
&gt; index 0f06305167d5..03efed2ed1ea 100644<br>
&gt; --- a/fs/ext4/inode.c<br>
&gt; +++ b/fs/ext4/inode.c<br>
&gt; @@ -2260,7 +2260,6 @@ static int mpage_process_page(struct mpage_da_da=
ta *mpd, struct page *page,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0mpd-&gt;map.m_len =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0mpd-&gt;map.m_flags =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0io_end_vec-&gt;size +=3D io_end_size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0io_end_size =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0err =3D mpage_process_page_bufs(mpd, head, bh, lblk);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (err &gt; 0)<br>
&gt; @@ -2285,7 +2284,6 @@ static int mpage_process_page(struct mpage_da_da=
ta *mpd, struct page *page,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (lblk++, (bh =3D bh-&gt;b_thi=
s_page) !=3D head);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io_end_vec-&gt;size +=3D io_end_size;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0io_end_size =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*map_bh =3D false;<br>
&gt;=C2=A0 out:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*m_lblk =3D lblk;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</blockquote></div>

--000000000000e05c3805cf34d81c--

