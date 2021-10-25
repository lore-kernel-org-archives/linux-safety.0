Return-Path: <SRS0=VXCp=PN=lists.elisa.tech=bounce+72012+257+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3B8C4332F
	for <linux-safety@archiver.kernel.org>; Mon, 25 Oct 2021 22:26:11 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7537561039
	for <linux-safety@archiver.kernel.org>; Mon, 25 Oct 2021 22:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7537561039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id acjVYY5279335xCagov8sBpB; Mon, 25 Oct 2021 15:26:10 -0700
X-Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.4276.1635200769326515949
 for <linux-safety@lists.elisa.tech>;
 Mon, 25 Oct 2021 15:26:09 -0700
X-Received: by mail-lf1-f54.google.com with SMTP id y26so12640244lfa.11
        for <linux-safety@lists.elisa.tech>; Mon, 25 Oct 2021 15:26:09 -0700 (PDT)
X-Gm-Message-State: lQaTcNOo0ItdBi2iwtRBkrwAx5278000AA=
X-Google-Smtp-Source: ABdhPJz2J9u8+AEiOIMz/kOOzK20Ad0gh3c48+iJaLWDtK3gx7m6d2vrc0FUioMsot/v081YpiEuw3mhDFjEkkMxGbk=
X-Received: by 2002:a05:6512:acb:: with SMTP id n11mr20153725lfu.222.1635200767383;
 Mon, 25 Oct 2021 15:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174242.20627-1-nghialm78@gmail.com> <CAKXUXMxC+pGWzkNvM0N+RfM04-45RAVqaBWc9oV9_zbpfrvnsA@mail.gmail.com>
In-Reply-To: <CAKXUXMxC+pGWzkNvM0N+RfM04-45RAVqaBWc9oV9_zbpfrvnsA@mail.gmail.com>
From: "Nghia Le" <nghialm78@gmail.com>
Date: Tue, 26 Oct 2021 05:25:56 +0700
Message-ID: <CADkY59uOUOjAZek6k_arWgnrYxD6SJqH=2Uy=3w5_tX9jQKUjQ@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v2] ext4: remove useless resetting io_end_size in mpage_process_page()
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
Content-Type: multipart/alternative; boundary="000000000000e05c3805cf34d81c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1635200770;
 bh=tBpBKe/wmFeZ0j0gxnXB9NtN5bhxrmRUvsvKAm33EGs=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=GP6QJKJPX1zFuG/gPsVnYJ86dhbxlhfldPaV1FNYHOwx+V/c9W+XvwSSPULLiZ2IchZ
 rRAPA2BnzgUqmc0nNyPOHvh2/gn/dHtVdHvLFOdMw+/9NsNiXPccDD/jPLZV8qedLtcSU
 JRkpAlwzpSfRW37B8gQwTEZKM5zdR9RkI0s=
Message-ID: <20211025222556.bC2XwTOnnVmeV_TqhtHrRheeB7eoPmj58U40tikCD7g@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#257): https://lists.elisa.tech/g/linux-safety/message/257
Mute This Topic: https://lists.elisa.tech/mt/86495840/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-



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


 <div width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div> <hr>   L=
inks:<p>   You receive all messages sent to this group.    <p> <a target=3D=
"_blank" href=3D"https://lists.elisa.tech/g/linux-safety/message/257">View/=
Reply Online (#257)</a> |  <a target=3D"_blank" href=3D"mailto:nghialm78@gm=
ail.com?subject=3DPrivate:%20Re:%20Re%3A%20%5Blinux-safety%5D%20%5BPATCH%20=
v2%5D%20ext4%3A%20remove%20useless%20resetting%20io_end_size%20in%20mpage_p=
rocess_page%28%29">Reply To Sender</a>  | <a target=3D"_blank" href=3D"mail=
to:linux-safety@lists.elisa.tech?subject=3DRe:%20Re%3A%20%5Blinux-safety%5D=
%20%5BPATCH%20v2%5D%20ext4%3A%20remove%20useless%20resetting%20io_end_size%=
20in%20mpage_process_page%28%29">Reply To Group</a>   |  <a target=3D"_blan=
k" href=3D"https://lists.elisa.tech/mt/86495840/5278000">Mute This Topic</a=
>  | <a href=3D"https://lists.elisa.tech/g/linux-safety/post">New Topic</a>=
<br>    <a href=3D"https://lists.elisa.tech/g/linux-safety/editsub/5278000"=
>Your Subscription</a> | <a href=3D"mailto:linux-safety+owner@lists.elisa.t=
ech">Contact Group Owner</a> |  <a href=3D"https://lists.elisa.tech/g/linux=
-safety/unsub">Unsubscribe</a>  [linux-safety@archiver.kernel.org]<br> <div=
 width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div>=20


--000000000000e05c3805cf34d81c--
