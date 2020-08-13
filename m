Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web11.11572.1597329950429100419
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=a4fj1mXY;
 spf=softfail (domain: mab-labs.com, ip: 209.85.167.195, mailfrom: mab@mab-labs.com)
Received: by mail-oi1-f195.google.com with SMTP id n128so1407881oif.0
        for <linux-safety@lists.elisa.tech>; Thu, 13 Aug 2020 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2isO17N/RPW9P0bDPZGpHfE1s5DrGWEWwk3rWxfslM=;
        b=a4fj1mXYObuad0duvTqFbFBezEvfN4GOQCfg8M7nD9besD9Wqo7QR9JRbvMoYb1Wco
         ohuF/iukSnI7ALrA0WFtGh0Ievte5lqYQw55MEvz4JBVlWZ7qi1nd1MVsA+Yum5+9fxm
         Y3KLmt4IXMTK31kuRuYd/wAGi5IEdkywjgXPCFiEGVNiGN6izBGUoM8QFkefawQAG+Ef
         YyjntZaQjUIEeCiosbY6AgHldp6re7t3EtXdBTiEiNCUqnehrNM6UG9QueTTFyGww/RN
         McLeVhSt13dpgZgWIls8PbNm4zBRfpFV30k07M4ISjan4D/ueWivfkG2I8nDgOZjbsBA
         oVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2isO17N/RPW9P0bDPZGpHfE1s5DrGWEWwk3rWxfslM=;
        b=P7nsXBW1Lpb3l35XhUX99l6kFxicFpHLBohNnOaeTE2KLGgonmEHGWahVbUta61F/o
         PxycxUpkbYPUK3cQzzF/p+0UVr1Up6dH+KoRlgmkzcCWyTprvbtGhJb9PwQi/0AFTvbR
         BwDUIvRvR1EerqnX02Bij43DWoVO+FWJb7omRER4kRkyWUaFwZt2tNhiRRdwz7k2k45/
         Gu/ENeBSYWcF6Bx9gNS9d/aUXh1mYZct2U0HnTC8GCh7LbLBtXYoVbCpWZcbI5F0Odt1
         ViCl13vzGNwDlQw1XPIQiZQTL9GOiD4tMF/BksPbA0kT/uiSYKgdx4Cs1Kn4rGf0O7Zo
         gMAw==
X-Gm-Message-State: AOAM530ZxL/ekYr5rLPoLemHBwWZncR3N2nk5o4pX8ywTN9b68TF6Y3j
	xTkm7HMZ3VlaIsao/x4OTclnRmV0gS/rCOECwBawFw==
X-Google-Smtp-Source: ABdhPJy6DLX7RZr6uku1K134d4YYtZaAPetSidFUIlEXO0vqspvVXe8YOOPOJvYJbhAhaygevIbNfa2vaM3o4DIa3ig=
X-Received: by 2002:aca:240b:: with SMTP id n11mr3802418oic.47.1597329948725;
 Thu, 13 Aug 2020 07:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200812234322.32355-1-mab@mab-labs.com> <9e9c2f28-b4e4-698d-f424-6973c486576f@linuxfoundation.org>
 <162ADAEB16525C4A.3117@lists.elisa.tech>
In-Reply-To: <162ADAEB16525C4A.3117@lists.elisa.tech>
From: "Mohammed Billoo" <mab@mab-labs.com>
Date: Thu, 13 Aug 2020 10:45:37 -0400
Message-ID: <CALkjhPpmHusUTaY1dbohM_Fc7UrGSXUav=evqg+6rauBdaVemA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
To: Mohammed Billoo <mab@mab-labs.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-safety@lists.elisa.tech
Content-Type: multipart/alternative; boundary="0000000000002f37af05acc35c52"

--0000000000002f37af05acc35c52
Content-Type: text/plain; charset="UTF-8"

I also had a few more questions regarding the overall format:
1. Is the header format in the semantic patch acceptable (i.e. referencing
the CWE that this particular semantic patch aims to address)?
2. Should we create a separate directory for ELISA within coccinelle?

Thanks
Mohammed

On Thu, Aug 13, 2020 at 10:42 AM Mohammed Billoo via lists.elisa.tech
<mab=mab-labs.com@lists.elisa.tech> wrote:

> Shuah,
>
> Apologies for the spam. I didn't format the initial correctly and needed
> two more tries to get it right (according to the kernel
> standard/best-practice). I can resubmit this patch.
>
> Thanks
>
> On Thu, Aug 13, 2020 at 10:39 AM Shuah Khan <skhan@linuxfoundation.org>
> wrote:
>
>> Hi Mohammed,
>>
>> Thanks for your patch.
>>
>> On 8/12/20 5:43 PM, Mohammed Billoo wrote:
>> > This semantic patch looks for variables that are initialized to
>> > constants, arrays that are both declared and indexed with constants.
>> > A false positive will occur  when a variable is initialized to 0, which
>> > must happen for auto variables. This will be resolved in a future patch.
>> >
>> > The patch was tested against the following snippet:
>> >
>> > int main()
>> > {
>> >      int iarr[54]; /* instance 1 */
>> >      int j = 0;    /* instance 2 */
>> >      int i = 1;    /* instance 3 */
>> >      iarr[0] = 3;  /* instance 4 */
>> >      return 0;
>> > }
>> >
>> > and it correctly identified instances 1, 3, and 4. It incorrectly
>> > identified instance 2, which will be addressed in a future patch.
>>
>> Please include the output from the tool that corresponds to your
>> changes to the script in the commit log on a kernel file.
>>
>> Also I see 3 patches with incremental changes to the script. Please
>> make this a patch series which will make it easier for reviewers.
>>
>> thanks,
>> -- Shuah
>>
>
>
> --
> Mohammed A Billoo
> Founder
> MAB Labs, LLC
> www.mab-labs.com
> 201-338-2022
> 
>
>

-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022

--0000000000002f37af05acc35c52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I also had a few more questions regarding the overall=
 format:</div><div>1. Is the header format in the semantic patch acceptable=
 (i.e. referencing the CWE that this particular semantic patch aims to addr=
ess)?</div><div>2. Should we create a separate directory for ELISA within c=
occinelle?</div><div><br></div><div>Thanks</div><div>Mohammed<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Aug 13, 2020 at 10:42 AM Mohammed Billoo via lists.elisa.tech &lt;mab=
=3Dmab-labs.com@lists.elisa.tech&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Shuah,</div><div><br></d=
iv><div>Apologies for the spam. I didn&#39;t format the initial correctly a=
nd needed two more tries to get it right (according to the kernel standard/=
best-practice). I can resubmit this patch. <br></div><div><br></div><div>Th=
anks</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Aug 13, 2020 at 10:39 AM Shuah Khan &lt;<a href=3D"mailto=
:skhan@linuxfoundation.org" target=3D"_blank">skhan@linuxfoundation.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi M=
ohammed,<br>
<br>
Thanks for your patch.<br>
<br>
On 8/12/20 5:43 PM, Mohammed Billoo wrote:<br>
&gt; This semantic patch looks for variables that are initialized to<br>
&gt; constants, arrays that are both declared and indexed with constants.<=
br>
&gt; A false positive will occur=C2=A0 when a variable is initialized to 0=
, which<br>
&gt; must happen for auto variables. This will be resolved in a future pat=
ch.<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Mohammed A Billoo</div><div>Founder</div><div>MAB Labs, LLC<=
/div><div><a href=3D"http://www.mab-labs.com" target=3D"_blank">www.mab-lab=
s.com</a></div><div>201-338-2022<br></div></div></div>



<p></p><p></p></blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"=
ltr"><div dir=3D"ltr"><div>Mohammed A Billoo</div><div>Founder</div><div>MA=
B Labs, LLC</div><div><a href=3D"http://www.mab-labs.com" target=3D"_blank"=
>www.mab-labs.com</a></div><div>201-338-2022<br></div></div></div>

--0000000000002f37af05acc35c52--
