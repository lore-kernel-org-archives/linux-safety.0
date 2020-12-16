Return-Path: <SRS0=9q2m=FU=lists.elisa.tech=bounce+72012+226+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A85BC4361B
	for <linux-safety@archiver.kernel.org>; Wed, 16 Dec 2020 16:24:08 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73ED2313B
	for <linux-safety@archiver.kernel.org>; Wed, 16 Dec 2020 16:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73ED2313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+226+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id NYEnYY5279335xdnxWX9PbNE; Wed, 16 Dec 2020 08:24:07 -0800
X-Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web12.10728.1608135846586466568
 for <linux-safety@lists.elisa.tech>;
 Wed, 16 Dec 2020 08:24:06 -0800
X-Received: by mail-il1-f175.google.com with SMTP id r17so23040557ilo.11
        for <linux-safety@lists.elisa.tech>; Wed, 16 Dec 2020 08:24:06 -0800 (PST)
X-Gm-Message-State: 4IzOvZ7DMh953zI7hT3s3Bnxx5278000AA=
X-Google-Smtp-Source: ABdhPJwkqOAXm8a4QuFJ0LmuF7/IVDcDbIwBRirh9B20sKkTNjn1fYuQwLEzzaqpyrnicYKSWu9vhr5lkBPGuQzt6gc=
X-Received: by 2002:a92:cd8c:: with SMTP id r12mr45547828ilb.221.1608135845670;
 Wed, 16 Dec 2020 08:24:05 -0800 (PST)
MIME-Version: 1.0
References: <1608061835-5118-1-git-send-email-milan.lakhani@codethink.co.uk>
 <20201215201639.cuq7xtyanbk6bxan@debian> <3ab65bf4-6bb8-82a0-572b-cd44fefbaae7@codethink.co.uk>
 <05356dac-c547-e71c-7ec4-f474d5ad655e@codethink.co.uk>
In-Reply-To: <05356dac-c547-e71c-7ec4-f474d5ad655e@codethink.co.uk>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Wed, 16 Dec 2020 17:23:54 +0100
Message-ID: <CAKXUXMzqLO6b0NTtbQ1BtW6OaxR+8-UijoqGLUJhp=pULQE8ow@mail.gmail.com>
Subject: Re: [linux-safety] E-mail addresses for kernel contributors to send patches to
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: linux-safety@lists.elisa.tech
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: multipart/alternative; boundary="000000000000d4f21b05b6974d39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608135847;
 bh=Iq704AQmoz4LO4jPXW0AfBH2wpLEdirldKUk7Iumns0=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=MGqu5RZHfVdbCOb10rmhICWhGxhyALGfkazSBwZMo6ervUVAkWSY5ZWG2dl5/0/EKof
 4+jcrzZ1I2yMQARgo0XPwm208S+9mEleFC8+ouoESr0/3PmA44IwScsk1V4LfrJmoi0fs
 ttGYOIsalrZO/eWaXTRorfHnZKrXYEXvww0=

--000000000000d4f21b05b6974d39
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 16, 2020 at 5:16 PM Milan Lakhani <milan.lakhani@codethink.co.uk>
wrote:

> Hi,
>
> I made the below changes and sent the documentation patch version 2,
>
> In case there are any other new contributors wondering the best place to
> send their kernel patches, I now send mine to:
>
> kernel@vger.kernel.org (Kernel mailing list)
> linux-safety@lists.elisa.tech (ELISA safety list)
> The maintainers (obtained by running 'git show HEAD | perl
> scripts/get_maintainer.pl --separator , --nokeywords --nogit
> --nogit-fallback --norolestats --nol' if the HEAD commit is the patch)
>
> For driver patches I'll also include devel@driverdev.osuosl.org and Greg
> gregkh@linuxfoundation.org, while for a documentation patch I'll include
> the linux-doc@vger.kernel.org list.
>
>
Patches to documentation should also be sent to Jonathan Corbet and they
should apply on top of his doc-next branch.

Here are some hints from Jonathan on the submission of patches to him:

https://www.kernel.org/doc/html/latest/doc-guide/maintainer-profile.html

Also make sure that document generation has no warnings.

Lukas


> Milan
>
> On 15/12/2020 20:32, Milan Lakhani wrote:
> > Hi Sudip,
> >
> > On 15/12/2020 20:16, Sudip Mukherjee wrote:
> >> Hi Milan,
> >>
> >> On Tue, Dec 15, 2020 at 07:50:35PM +0000, Milan Lakhani wrote:
> >>> Renumber the steps in submit-checklist.rst as some numbers were
> >>> skipped.
> >>>
> >>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> >> Maybe you can also add:
> >> Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")
> > Will add this :)
> >>
> >> But I am confused about why you have added Greg and staging list instead
> >> of 'linux-doc@vger.kernel.org'.
> >
> > I was a bit unsure since the whole repository is called staging so I
> > was thinking these different folders may use the same lists and didn't
> > pay attention that the staging list had the word 'drivers', I'm clear
> > on the different lists now though. I'll change the drivers list for
> > the one you mention there.
> >
> > Thanks,
> > Milan
> >
> >>
> >> --
> >> Regards
> >> Sudip
> >>
> >>
> >>
> >>
> >>
> >>
>
>
> 
>
>
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#226): https://lists.elisa.tech/g/linux-safety/message/226
Mute This Topic: https://lists.elisa.tech/mt/79004338/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-



--000000000000d4f21b05b6974d39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 5:16 PM Milan=
 Lakhani &lt;<a href=3D"mailto:milan.lakhani@codethink.co.uk">milan.lakhani=
@codethink.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi,<br>
<br>
I made the below changes and sent the documentation patch version 2,<br>
<br>
In case there are any other new contributors wondering the best place to <=
br>
send their kernel patches, I now send mine to:<br>
<br>
<a href=3D"mailto:kernel@vger.kernel.org" target=3D"_blank">kernel@vger.ke=
rnel.org</a> (Kernel mailing list)<br>
linux-safety@lists.elisa.tech (ELISA safety list)<br>
The maintainers (obtained by running &#39;git show HEAD | perl <br>
scripts/<a href=3D"http://get_maintainer.pl" rel=3D"noreferrer" target=3D"=
_blank">get_maintainer.pl</a> --separator , --nokeywords --nogit <br>
--nogit-fallback --norolestats --nol&#39; if the HEAD commit is the patch)=
<br>
<br>
For driver patches I&#39;ll also include <a href=3D"mailto:devel@driverdev=
.osuosl.org" target=3D"_blank">devel@driverdev.osuosl.org</a> and Greg <br>
<a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank">gregkh@lin=
uxfoundation.org</a>, while for a documentation patch I&#39;ll include <br>
the <a href=3D"mailto:linux-doc@vger.kernel.org" target=3D"_blank">linux-d=
oc@vger.kernel.org</a> list.<br>
<br></blockquote><div><br></div><div>Patches to documentation should also =
be sent to Jonathan Corbet and they should apply on top of his doc-next bra=
nch.</div><div><br></div><div>Here are some hints from Jonathan on the subm=
ission of patches to him:</div><div><br></div><div><a href=3D"https://www.k=
ernel.org/doc/html/latest/doc-guide/maintainer-profile.html">https://www.ke=
rnel.org/doc/html/latest/doc-guide/maintainer-profile.html</a><br></div><di=
v><br></div><div>Also make sure that document generation has no warnings.</=
div><div><br></div><div>Lukas</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
Milan<br>
<br>
On 15/12/2020 20:32, Milan Lakhani wrote:<br>
&gt; Hi Sudip,<br>
&gt;<br>
&gt; On 15/12/2020 20:16, Sudip Mukherjee wrote:<br>
&gt;&gt; Hi Milan,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Dec 15, 2020 at 07:50:35PM +0000, Milan Lakhani wrote:<br=
>
&gt;&gt;&gt; Renumber the steps in submit-checklist.rst as some numbers we=
re <br>
&gt;&gt;&gt; skipped.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Milan Lakhani &lt;<a href=3D"mailto:milan.lakh=
ani@codethink.co.uk" target=3D"_blank">milan.lakhani@codethink.co.uk</a>&gt=
;<br>
&gt;&gt; Maybe you can also add:<br>
&gt;&gt; Fixes: 72deb455b5ec (&quot;block: remove CONFIG_LBDAF&quot;)<br>
&gt; Will add this :)<br>
&gt;&gt;<br>
&gt;&gt; But I am confused about why you have added Greg and staging list =
instead<br>
&gt;&gt; of &#39;<a href=3D"mailto:linux-doc@vger.kernel.org" target=3D"_b=
lank">linux-doc@vger.kernel.org</a>&#39;.<br>
&gt;<br>
&gt; I was a bit unsure since the whole repository is called staging so I =
<br>
&gt; was thinking these different folders may use the same lists and didn&=
#39;t <br>
&gt; pay attention that the staging list had the word &#39;drivers&#39;, I=
&#39;m clear <br>
&gt; on the different lists now though. I&#39;ll change the drivers list f=
or <br>
&gt; the one you mention there.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Milan<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Regards<br>
&gt;&gt; Sudip<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>


 <div width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div> <hr> Li=
nks:<p>   You receive all messages sent to this group.    <p> <a target=3D"=
_blank" href=3D"https://lists.elisa.tech/g/linux-safety/message/226">View/R=
eply Online (#226)</a> |  <a target=3D"_blank" href=3D"mailto:lukas.bulwahn=
@gmail.com?subject=3DPrivate:%20Re:%20Re%3A%20%5Blinux-safety%5D%20E-mail%2=
0addresses%20for%20kernel%20contributors%20to%20send%20patches%20to">Reply =
To Sender</a>  | <a target=3D"_blank" href=3D"mailto:linux-safety@lists.eli=
sa.tech?subject=3DRe:%20Re%3A%20%5Blinux-safety%5D%20E-mail%20addresses%20f=
or%20kernel%20contributors%20to%20send%20patches%20to">Reply To Group</a>  =
 |  <a target=3D"_blank" href=3D"https://lists.elisa.tech/mt/79004338/52780=
00">Mute This Topic</a>  | <a href=3D"https://lists.elisa.tech/g/linux-safe=
ty/post">New Topic</a><br>    <a href=3D"https://lists.elisa.tech/g/linux-s=
afety/editsub/5278000">Your Subscription</a> | <a href=3D"mailto:linux-safe=
ty+owner@lists.elisa.tech">Contact Group Owner</a> |  <a href=3D"https://li=
sts.elisa.tech/g/linux-safety/unsub">Unsubscribe</a>  [linux-safety@archive=
r.kernel.org]<br> <div width=3D"1" style=3D"color:white;clear:both">_._,_._=
,_</div>=20


--000000000000d4f21b05b6974d39--
