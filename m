Return-Path: <SRS0=LXQb=PJ=lists.elisa.tech=bounce+72012+255+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA60C433F5
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 17:46:39 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D72D6135F
	for <linux-safety@archiver.kernel.org>; Thu, 21 Oct 2021 17:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D72D6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id dejLYY5279335xMjekRBIseY; Thu, 21 Oct 2021 10:46:38 -0700
X-Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.1250.1634838398131644274
 for <linux-safety@lists.elisa.tech>;
 Thu, 21 Oct 2021 10:46:38 -0700
X-Received: by mail-lj1-f172.google.com with SMTP id q16so711351ljg.3
        for <linux-safety@lists.elisa.tech>; Thu, 21 Oct 2021 10:46:37 -0700 (PDT)
X-Gm-Message-State: iF3w4jp7wxrf7GWx8qmY75qDx5278000AA=
X-Google-Smtp-Source: ABdhPJx3XS1zOV0qpUFRWAAfzIIazR7r5bzEgglEeUmFsktAPr2YdfZr7sVH/R7xn4Rl56HyLqB6SlkmzxKIlDWagkg=
X-Received: by 2002:a2e:3001:: with SMTP id w1mr7623686ljw.45.1634838396160;
 Thu, 21 Oct 2021 10:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021004914.17239-1-nghialm78@gmail.com> <CAKXUXMxbLZ=y9EC9KUCCi42rO+n6ceZoPXBiMEo8ZMay=+rTeQ@mail.gmail.com>
In-Reply-To: <CAKXUXMxbLZ=y9EC9KUCCi42rO+n6ceZoPXBiMEo8ZMay=+rTeQ@mail.gmail.com>
From: "Nghia Le" <nghialm78@gmail.com>
Date: Fri, 22 Oct 2021 00:46:24 +0700
Message-ID: <CADkY59vMu_MnDR3rH7EC_-wapFRELahveRQ2iHfO9oewBjCdiA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] ext4/inode.c: remove dead stores in mpage_process_page()
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
Content-Type: multipart/alternative; boundary="000000000000de4c7d05cee079b1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1634838398;
 bh=yfewLn+BWJQtY9xGxpWZWyu9GXsI6K+szSeOxbkv4Y8=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=e3s2QZ8v1lav2MTvKo1yLfGeT99Mo/yaYxnuXKUixIONiXVBO1utbYDFVQ+xgnb5JNI
 jAf3Cn7LLsq6w2VKt2jDzD1/yBOjQlwBDXFAHFO8XdUDv964JIwZZI6FmvDj152nDoLME
 3VyUgUEvSO14EdQ6I9EBxdRhUXE1bBuXsCU=
Message-ID: <20211021174624.m8BdZALg8Xi4Fdlxh3KIGMx0tdBU21_U--G1LyI1z-s@z>

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


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#255): https://lists.elisa.tech/g/linux-safety/message/255
Mute This Topic: https://lists.elisa.tech/mt/86480121/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-



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


 <div width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div> <hr>   L=
inks:<p>   You receive all messages sent to this group.    <p> <a target=3D=
"_blank" href=3D"https://lists.elisa.tech/g/linux-safety/message/255">View/=
Reply Online (#255)</a> |  <a target=3D"_blank" href=3D"mailto:nghialm78@gm=
ail.com?subject=3DPrivate:%20Re:%20Re%3A%20%5Blinux-safety%5D%20%5BPATCH%5D=
%20ext4%2Finode.c%3A%20remove%20dead%20stores%20in%20mpage_process_page%28%=
29">Reply To Sender</a>  | <a target=3D"_blank" href=3D"mailto:linux-safety=
@lists.elisa.tech?subject=3DRe:%20Re%3A%20%5Blinux-safety%5D%20%5BPATCH%5D%=
20ext4%2Finode.c%3A%20remove%20dead%20stores%20in%20mpage_process_page%28%2=
9">Reply To Group</a>   |  <a target=3D"_blank" href=3D"https://lists.elisa=
.tech/mt/86480121/5278000">Mute This Topic</a>  | <a href=3D"https://lists.=
elisa.tech/g/linux-safety/post">New Topic</a><br>    <a href=3D"https://lis=
ts.elisa.tech/g/linux-safety/editsub/5278000">Your Subscription</a> | <a hr=
ef=3D"mailto:linux-safety+owner@lists.elisa.tech">Contact Group Owner</a> |=
  <a href=3D"https://lists.elisa.tech/g/linux-safety/unsub">Unsubscribe</a>=
  [linux-safety@archiver.kernel.org]<br> <div width=3D"1" style=3D"color:wh=
ite;clear:both">_._,_._,_</div>=20


--000000000000de4c7d05cee079b1--
