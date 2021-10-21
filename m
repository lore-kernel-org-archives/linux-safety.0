Return-Path: <nghialm78@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC99C433FE
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 17:46:39 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.1250.1634838398131644274
 for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 10:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dNuy6+bz;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: nghialm78@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id q16so711351ljg.3
        for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=veOpaI2lq7Avo3H4TlvtOuH0NziWVw+uIveWwX3gX3o=;
        b=dNuy6+bzHWDIA/x8OiF33HgYLNOfyKs8xFy3dDzfe+i+mNRRuEFgNGESqb6aghf8LU
         IXmWcZYbcLjSr6YHOfBqGQGFmZIa385a6/cOIoFVHYJzh2GqJHY9SANT3P6N1+m0xQti
         udyeiky69BijxvdHnEYGMjMFH6S5/fFYzXhwCrlTsMODCSOroRTsIh0TK/ioclxNyqbq
         hqvtMipPzdB85l+suxurIKhg5AlUmPS6Q55Hq+DAXkU1qzBqxqEtbyk0bcO1VlRq5Obi
         Kh8jmyRNE07V7Qi2D7LwUqaE33ggY++MAY47FTsOVsQ53KeFQL0IdXzrI0qu4dMkXM8f
         qZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=veOpaI2lq7Avo3H4TlvtOuH0NziWVw+uIveWwX3gX3o=;
        b=Ij/jidD0OdceVC5FgRr8NllHSc6v+nbx/1MK11vfcc8z2bTWxaJq/YRdtqSfCfEycW
         q/p8jLn/KUhBL5Iq+OrSBL8ls+j1djkEdASyoZQetMJ5ShtXvhQH0nPSqzVjUNmtSgGY
         3fZ9p8nVXnb1J68bCNeVC0HT98PO/7fuVNrTExFkGxdQHAc+hu/TB1JmyWROjTiOf5xu
         Ubux8ymdUXEM0V06geZz1NUue2rASe7CnhiU+dnItg791F5mi4lZBlCpVLBViG0iyelJ
         OJneisjGGbPfe0LyAonaUCsm4hb0kria6ZjxeWOYR/YpYp0YYPD0U60q/O8h68V9l+9l
         HYHw==
X-Gm-Message-State: AOAM533GwZZ/Az8IQa3exv8sFrVINCvBlAXMuv2qICh+zXD9Z+LJ9X0N
	WQGZn4yKUUupk04QJkxP7uDXB9NeYTcmRuOQjwU=
X-Google-Smtp-Source: 
 ABdhPJx3XS1zOV0qpUFRWAAfzIIazR7r5bzEgglEeUmFsktAPr2YdfZr7sVH/R7xn4Rl56HyLqB6SlkmzxKIlDWagkg=
X-Received: by 2002:a2e:3001:: with SMTP id w1mr7623686ljw.45.1634838396160;
 Thu, 21 Oct 2021 10:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021004914.17239-1-nghialm78@gmail.com>
 <CAKXUXMxbLZ=y9EC9KUCCi42rO+n6ceZoPXBiMEo8ZMay=+rTeQ@mail.gmail.com>
In-Reply-To: 
 <CAKXUXMxbLZ=y9EC9KUCCi42rO+n6ceZoPXBiMEo8ZMay=+rTeQ@mail.gmail.com>
From: Nghia Le <nghialm78@gmail.com>
Date: Fri, 22 Oct 2021 00:46:24 +0700
Message-ID: 
 <CADkY59vMu_MnDR3rH7EC_-wapFRELahveRQ2iHfO9oewBjCdiA@mail.gmail.com>
Subject: Re: [PATCH] ext4/inode.c: remove dead stores in mpage_process_page()
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
Content-Type: multipart/alternative; boundary="000000000000de4c7d05cee079b1"
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Thu, 21 Oct 2021 17:46:39 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/255

--000000000000de4c7d05cee079b1
Content-Type: text/plain; charset="UTF-8"

Dear Lukas,
Thanks for your comments, I submitted  patch v2 for the revision
Best regards,
Nghia Le

On Thu, Oct 21, 2021 at 10:57 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> On Thu, Oct 21, 2021 at 2:50 AM Nghia Le <nghialm78@gmail.com> wrote:
> >
> > The command "make clang-analyzer" detected dead stores.
> >
>
> Use present tense here. s/detected/detects/
>
> > Removed the all the assignments io_end_size=0 to fix dead stores, as
> > io_end_size is never read.
> >
>
> Use imperative here. So: s/Removed/Remove/
>
> drop the first "the".
>
> Maybe a better wording is:
>
> Do not reset io_end_size to 0 in the current paths, as the function
> exists on those paths without further using io_end_size.
>
> ... and the subject line could be "ext4: remove useless resetting
> io_end_size in mpage_process_page()".
>
> I hope this helps.
>
> Lukas
>
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

--000000000000de4c7d05cee079b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Lukas,<div>Thanks for your comments, I submitted=C2=
=A0 patch v2 for the revision</div><div>Best regards,</div><div>Nghia Le</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Oct 21, 2021 at 10:57 PM Lukas Bulwahn &lt;<a href=3D"mailto:luk=
as.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Thu, Oct 21, 2021 at 2:50 A=
M Nghia Le &lt;<a href=3D"mailto:nghialm78@gmail.com" target=3D"_blank">ngh=
ialm78@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The command &quot;make clang-analyzer&quot; detected dead stores.<br>
&gt;<br>
<br>
Use present tense here. s/detected/detects/<br>
<br>
&gt; Removed the all the assignments io_end_size=3D0 to fix dead stores, as=
<br>
&gt; io_end_size is never read.<br>
&gt;<br>
<br>
Use imperative here. So: s/Removed/Remove/<br>
<br>
drop the first &quot;the&quot;.<br>
<br>
Maybe a better wording is:<br>
<br>
Do not reset io_end_size to 0 in the current paths, as the function<br>
exists on those paths without further using io_end_size.<br>
<br>
... and the subject line could be &quot;ext4: remove useless resetting<br>
io_end_size in mpage_process_page()&quot;.<br>
<br>
I hope this helps.<br>
<br>
Lukas<br>
<br>
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

--000000000000de4c7d05cee079b1--

