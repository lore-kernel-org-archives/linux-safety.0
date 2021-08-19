Return-Path: <SRS0=HIRf=NK=lists.elisa.tech=bounce+72012+242+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D612AC4338F
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 10:01:45 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5117261152
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 10:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5117261152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id TOgFYY5279335xjiGqtzB6Yv; Thu, 19 Aug 2021 03:01:44 -0700
X-Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.67789.1629367304272418623
 for <linux-safety@lists.elisa.tech>;
 Thu, 19 Aug 2021 03:01:44 -0700
X-Received: by mail-lf1-f51.google.com with SMTP id x27so11672013lfu.5
        for <linux-safety@lists.elisa.tech>; Thu, 19 Aug 2021 03:01:44 -0700 (PDT)
X-Gm-Message-State: mW0fiToumNmQiEicfGPFvjjwx5278000AA=
X-Google-Smtp-Source: ABdhPJyTiUq7iQOy2ymiOnRF0GYI93CRwCNJtJDx9/pakJnwk0q4hstH20ej0nbxSQiB6wn2YXT56wAQ1nL3r8/l0So=
X-Received: by 2002:a05:6512:b9f:: with SMTP id b31mr1186588lfv.96.1629367302084;
 Thu, 19 Aug 2021 03:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210818170109.62277-1-nghialm78@gmail.com> <CAKXUXMwcLmMxbszRRzYV+nBtJTG5pYhe9fLiQ3_RFSo2DjaZ_w@mail.gmail.com>
In-Reply-To: <CAKXUXMwcLmMxbszRRzYV+nBtJTG5pYhe9fLiQ3_RFSo2DjaZ_w@mail.gmail.com>
From: "Nghia Le" <nghialm78@gmail.com>
Date: Thu, 19 Aug 2021 17:01:31 +0700
Message-ID: <CADkY59uq24e4=F3r=Zz9NGtzQfvZp0TM3Yk3-ijT1Pt8y_ex1Q@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] parse-sublevel-option.h : Add new line and license identifier
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
Content-Type: multipart/alternative; boundary="0000000000003fda5405c9e6a3d4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1629367304;
 bh=UM7NdNpYohjBV6c2xDyXeHANA+tlruRHHMGw2mDQ/Z8=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=nFy2oZ4W0OufGyGW+5maFvnS1oyQaKQDYI7JdwR8sU5Fp1lNz623IohSRmhXWdaxoUv
 9LWxDlpRF269wcdqfMjC1nw5OAP1j02Qc6Nkqlnr1ZgGi8RqggKR2b0a66CUlWCWrJzu0
 vraBiU784sA78GNUI/OWrWkDvwf0jtNe1P4=

--0000000000003fda5405c9e6a3d4
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 12:11 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> On Wed, Aug 18, 2021 at 7:01 PM Nghia Le <nghialm78@gmail.com> wrote:
> >
> > Add the new line at the end of file and add SPDX license identifier
> GPL-2.0, thus removing warning while running checkpatch.pl script
> >
> > Signed-off-by: Nghia Le <nghialm78@gmail.com>
>
> Did you run checkpatch.pl on your own patch? What did it report?
>

  I  will add report in the PATCH v2

> ---
> >  tools/perf/util/parse-sublevel-options.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/parse-sublevel-options.h
> b/tools/perf/util/parse-sublevel-options.h
> > index 9b9efcc2aaad..bb44b5af2963 100644
> > --- a/tools/perf/util/parse-sublevel-options.h
> > +++ b/tools/perf/util/parse-sublevel-options.h
> > @@ -1,3 +1,5 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
>
> Do you understand the legal implications of adding this annotation?
> Are you among the authors to make this statement with sufficient
> confidence?
>
> It seems awkward to just annotate one file here, probably it is much
> better to have one commit that adds this annotation to all files in
> tools/perf/ if you are sure that this is all licensed GPL-2.0.
>

  Thanks for your comment. Originally, I had two reasons to add license
identifier
  1. To remove the warning, I referred lots of header file in the same
folder /tools/perf/util and
      and many of them have license identifier with SPDX is GPL-2.0. Then I
thought we can apply for file which
      doesn't have identifier explicitly
  2. I also refer the topic with long conversation while Greg K-H mentioned
about add SPDX for file without license
      identifier:
https://patchwork.kernel.org/project/xfs/patch/20171107020607.GA26910@magnolia/

   However, I totally agree with you that it is quite complicated in terms
of legal implication and I am not confident enough
   to change it at the moment. Hence, I will keep it as original version

>  #ifndef _PERF_PARSE_SUBLEVEL_OPTIONS_H
> >  #define _PERF_PARSE_SUBLEVEL_OPTIONS_H
> >
> > @@ -8,4 +10,5 @@ struct sublevel_option {
> >
> >  int perf_parse_sublevel_options(const char *str, struct sublevel_option
> *opts);
> >
> > -#endif
> > \ No newline at end of file
> > +#endif
> > +
>
> Now, you are adding an empty new line to this file. Can you create a
> patch that ends with #endif and a newline instead? That seems much
> more common throughout the whole kernel tree.
>

    I will update in PATCH v2

Good luck, we are anxiously waiting for your patch v2.
>
> Lukas
>
    Thank you for your detailed comments

Nghia Le


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#242): https://lists.elisa.tech/g/linux-safety/message/242
Mute This Topic: https://lists.elisa.tech/mt/84977020/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-



--0000000000003fda5405c9e6a3d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 12:11 AM Luka=
s Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, Aug 18, 2021 at 7:01 PM Nghia Le &lt;<a href=3D"mailto:nghialm=
78@gmail.com" target=3D"_blank">nghialm78@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add the new line at the end of file and add SPDX license identifier GP=
L-2.0, thus removing warning while running <a href=3D"http://checkpatch.pl"=
 rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> script<br>
&gt;<br>
&gt; Signed-off-by: Nghia Le &lt;<a href=3D"mailto:nghialm78@gmail.com" tar=
get=3D"_blank">nghialm78@gmail.com</a>&gt;<br>
<br>
Did you run <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_=
blank">checkpatch.pl</a> on your own patch? What did it report?<br></blockq=
uote><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 I=C2=A0 will add report in t=
he PATCH v2</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
&gt; ---<br>
&gt;=C2=A0 tools/perf/util/parse-sublevel-options.h | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/tools/perf/util/parse-sublevel-options.h b/tools/perf/uti=
l/parse-sublevel-options.h<br>
&gt; index 9b9efcc2aaad..bb44b5af2963 100644<br>
&gt; --- a/tools/perf/util/parse-sublevel-options.h<br>
&gt; +++ b/tools/perf/util/parse-sublevel-options.h<br>
&gt; @@ -1,3 +1,5 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +<br>
<br>
Do you understand the legal implications of adding this annotation?<br>
Are you among the authors to make this statement with sufficient<br>
confidence?<br>
<br>
It seems awkward to just annotate one file here, probably it is much<br>
better to have one commit that adds this annotation to all files in<br>
tools/perf/ if you are sure that this is all licensed GPL-2.0.<br></blockqu=
ote><div>=C2=A0</div><div>=C2=A0 Thanks for your comment. Originally, I had=
 two reasons to add license identifier</div><div>=C2=A0 1. To remove the wa=
rning, I referred lots of header file in the same folder /tools/perf/util a=
nd=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 and many of them have license ident=
ifier with SPDX is GPL-2.0. Then I thought we can apply for file which</div=
><div>=C2=A0 =C2=A0 =C2=A0 doesn&#39;t have identifier explicitly</div><div=
>=C2=A0 2. I also refer the topic with long conversation while Greg K-H men=
tioned about add SPDX for file without license</div><div>=C2=A0 =C2=A0 =C2=
=A0 identifier:=C2=A0 <a href=3D"https://patchwork.kernel.org/project/xfs/p=
atch/20171107020607.GA26910@magnolia/">https://patchwork.kernel.org/project=
/xfs/patch/20171107020607.GA26910@magnolia/</a></div><div><br></div><div>=
=C2=A0 =C2=A0However, I totally agree with you that it is quite complicated=
 in terms of legal implication and I am not confident enough=C2=A0</div><di=
v>=C2=A0 =C2=A0to change it at the moment. Hence, I will keep it as origina=
l version</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt;=C2=A0 #ifndef _PERF_PARSE_SUBLEVEL_OPTIONS_H<br>
&gt;=C2=A0 #define _PERF_PARSE_SUBLEVEL_OPTIONS_H<br>
&gt;<br>
&gt; @@ -8,4 +10,5 @@ struct sublevel_option {<br>
&gt;<br>
&gt;=C2=A0 int perf_parse_sublevel_options(const char *str, struct sublevel=
_option *opts);<br>
&gt;<br>
&gt; -#endif<br>
&gt; \ No newline at end of file<br>
&gt; +#endif<br>
&gt; +<br>
<br>
Now, you are adding an empty new line to this file. Can you create a<br>
patch that ends with #endif and a newline instead? That seems much<br>
more common throughout the whole kernel tree.<br></blockquote><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 I will update in PATCH v=
2</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Good luck, we are anxiously waiting for your patch v2.<br>
<br>
Lukas<br></blockquote><div>=C2=A0 =C2=A0 Thank you for your detailed commen=
ts</div><div><br></div><div>Nghia Le=C2=A0</div></div></div>


 <div width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div> <hr>   L=
inks:<p>   You receive all messages sent to this group.    <p> <a target=3D=
"_blank" href=3D"https://lists.elisa.tech/g/linux-safety/message/242">View/=
Reply Online (#242)</a> |  <a target=3D"_blank" href=3D"mailto:nghialm78@gm=
ail.com?subject=3DPrivate:%20Re:%20Re%3A%20%5Blinux-safety%5D%20%5BPATCH%5D=
%20parse-sublevel-option.h%20%3A%20Add%20new%20line%20and%20license%20ident=
ifier">Reply To Sender</a>  | <a target=3D"_blank" href=3D"mailto:linux-saf=
ety@lists.elisa.tech?subject=3DRe:%20Re%3A%20%5Blinux-safety%5D%20%5BPATCH%=
5D%20parse-sublevel-option.h%20%3A%20Add%20new%20line%20and%20license%20ide=
ntifier">Reply To Group</a>   |  <a target=3D"_blank" href=3D"https://lists=
.elisa.tech/mt/84977020/5278000">Mute This Topic</a>  | <a href=3D"https://=
lists.elisa.tech/g/linux-safety/post">New Topic</a><br>    <a href=3D"https=
://lists.elisa.tech/g/linux-safety/editsub/5278000">Your Subscription</a> |=
 <a href=3D"mailto:linux-safety+owner@lists.elisa.tech">Contact Group Owner=
</a> |  <a href=3D"https://lists.elisa.tech/g/linux-safety/unsub">Unsubscri=
be</a>  [linux-safety@archiver.kernel.org]<br> <div width=3D"1" style=3D"co=
lor:white;clear:both">_._,_._,_</div>=20


--0000000000003fda5405c9e6a3d4--
