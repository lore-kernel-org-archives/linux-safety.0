Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.11468.1597329715217413489
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 07:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=aN9lbnP4;
 spf=softfail (domain: mab-labs.com, ip: 209.85.210.66, mailfrom: mab@mab-labs.com)
Received: by mail-ot1-f66.google.com with SMTP id c4so4913413otf.12
        for <linux-safety@lists.elisa.tech>; Thu, 13 Aug 2020 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SME+9Nkyb6Cs065SM43FJmg3cr+gOWqpFpRTpHFFSMc=;
        b=aN9lbnP4gQkogmMDa4GbncLcL8oJpKONoCYcKt9Cw9ORolqQEdprcaMASCe4HAj60Y
         ok+KkWVNs57W1ZPVZtYFa65dIc9J3BueTZv2cVClzGpXaNzmegA+aD5MJEMX699Gm4Kr
         1Z/ZKmAR4PANiTuKWgom1ws/B7XwptSlVyn1fnSeQD5lrRhWRUm8vwuAVDBMfMq/Zj/w
         zAYQY5hfv4Jry34gjkXWp06Lwl9AXvSc369RT/XYlwz6N43B0xgWbxCkGMkbhGSsx53v
         +rH7JJvGz8qI0iKmLlrS26t0+Pss99xaPM3JOo19wjbvKSN7Ekdk6o9UTHm4pM84PhUD
         KajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SME+9Nkyb6Cs065SM43FJmg3cr+gOWqpFpRTpHFFSMc=;
        b=VI3eUqCutglFuK3F/B35g79l3HowlboF5oJlWZUUCGrz3pwkjlkdCAwcpc2EAGnceQ
         gcalZqInFts/VO2RUdUv3+2P6ddORhZxJTbgwjpemYuymdDTLqfzC9OJedKneHb//EPw
         APncz5FhzdrTpnrbrZnoaDm8T2ERMls4CqJUK46BzAZ7bfBnTfSnock+f1mnBQt+Damf
         RuUnQ2wrKZwpY14waSCEC0ZZoeEqzc3ZaXo3Y0YSYT8BQH50GlUVdn2x0iyNTi9EqZER
         aQSfdwAgOc3WsbYqgwt76JNiHZttwdlv8A7pnKuvW7qpY3Wed9aU9kPkolHKzxTNWUXH
         T0Aw==
X-Gm-Message-State: AOAM531ky/joktjkeAIfW0G+iGGxxcuwB9DMqV1aAbA50Of4JnqbOrI8
	4yrN+pa9VqCh9iO8wdbcv764C1vC2d0YtDVWRe5T/w==
X-Google-Smtp-Source: ABdhPJy/GOiwpQ2gKjFzvpZwx9XkFG3Q8ckxcenZ+z0yOxSteWIhUPvnsiUZ5RxoaUd58jtjhX+Po3YNSaXkLBgPRq8=
X-Received: by 2002:a05:6830:11ca:: with SMTP id v10mr1846993otq.44.1597329714558;
 Thu, 13 Aug 2020 07:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200812234322.32355-1-mab@mab-labs.com> <9e9c2f28-b4e4-698d-f424-6973c486576f@linuxfoundation.org>
In-Reply-To: <9e9c2f28-b4e4-698d-f424-6973c486576f@linuxfoundation.org>
From: "Mohammed Billoo" <mab@mab-labs.com>
Date: Thu, 13 Aug 2020 10:41:43 -0400
Message-ID: <CALkjhPrpvf10Hd1OKbzJF3AJzYOyqR5wf1rya7QgCpeBMBAvFA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-safety@lists.elisa.tech
Content-Type: multipart/alternative; boundary="00000000000039d07805acc34e3c"

--00000000000039d07805acc34e3c
Content-Type: text/plain; charset="UTF-8"

Shuah,

Apologies for the spam. I didn't format the initial correctly and needed
two more tries to get it right (according to the kernel
standard/best-practice). I can resubmit this patch.

Thanks

On Thu, Aug 13, 2020 at 10:39 AM Shuah Khan <skhan@linuxfoundation.org>
wrote:

> Hi Mohammed,
>
> Thanks for your patch.
>
> On 8/12/20 5:43 PM, Mohammed Billoo wrote:
> > This semantic patch looks for variables that are initialized to
> > constants, arrays that are both declared and indexed with constants.
> > A false positive will occur  when a variable is initialized to 0, which
> > must happen for auto variables. This will be resolved in a future patch.
> >
> > The patch was tested against the following snippet:
> >
> > int main()
> > {
> >      int iarr[54]; /* instance 1 */
> >      int j = 0;    /* instance 2 */
> >      int i = 1;    /* instance 3 */
> >      iarr[0] = 3;  /* instance 4 */
> >      return 0;
> > }
> >
> > and it correctly identified instances 1, 3, and 4. It incorrectly
> > identified instance 2, which will be addressed in a future patch.
>
> Please include the output from the tool that corresponds to your
> changes to the script in the commit log on a kernel file.
>
> Also I see 3 patches with incremental changes to the script. Please
> make this a patch series which will make it easier for reviewers.
>
> thanks,
> -- Shuah
>


-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022

--00000000000039d07805acc34e3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Shuah,</div><div><br></div><div>Apologies for the spa=
m. I didn&#39;t format the initial correctly and needed two more tries to g=
et it right (according to the kernel standard/best-practice). I can resubmi=
t this patch. <br></div><div><br></div><div>Thanks</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13, 202=
0 at 10:39 AM Shuah Khan &lt;<a href=3D"mailto:skhan@linuxfoundation.org">s=
khan@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Mohammed,<br>
<br>
Thanks for your patch.<br>
<br>
On 8/12/20 5:43 PM, Mohammed Billoo wrote:<br>
&gt; This semantic patch looks for variables that are initialized to<br>
&gt; constants, arrays that are both declared and indexed with constants.<b=
r>
&gt; A false positive will occur=C2=A0 when a variable is initialized to 0,=
 which<br>
&gt; must happen for auto variables. This will be resolved in a future patc=
h.<br>
&gt; <br>
&gt; The patch was tested against the following snippet:<br>
&gt; <br>
&gt; int main()<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int iarr[54]; /* instance 1 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int j =3D 0;=C2=A0 =C2=A0 /* instance 2 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i =3D 1;=C2=A0 =C2=A0 /* instance 3 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iarr[0] =3D 3;=C2=A0 /* instance 4 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; }<br>
&gt; <br>
&gt; and it correctly identified instances 1, 3, and 4. It incorrectly<br>
&gt; identified instance 2, which will be addressed in a future patch.<br>
<br>
Please include the output from the tool that corresponds to your<br>
changes to the script in the commit log on a kernel file.<br>
<br>
Also I see 3 patches with incremental changes to the script. Please<br>
make this a patch series which will make it easier for reviewers.<br>
<br>
thanks,<br>
-- Shuah<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Mohammed A Billoo</div><div>Founder</=
div><div>MAB Labs, LLC</div><div><a href=3D"http://www.mab-labs.com" target=
=3D"_blank">www.mab-labs.com</a></div><div>201-338-2022<br></div></div></di=
v>

--00000000000039d07805acc34e3c--
