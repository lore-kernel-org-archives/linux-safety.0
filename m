Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.12463.1597332227857098879
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 08:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=di4f5JU9;
 spf=softfail (domain: mab-labs.com, ip: 209.85.167.193, mailfrom: mab@mab-labs.com)
Received: by mail-oi1-f193.google.com with SMTP id h3so5337765oie.11
        for <linux-safety@lists.elisa.tech>; Thu, 13 Aug 2020 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydBoCjUNO8CuItKZB8pSG2P6q9zHi0J7AvgREn9AnV4=;
        b=di4f5JU9vbC6as8MkyKgrb0YONk3yHThAlkt3pV7JNp7m+NX98UviYf0x4pS+wHW64
         3+qwCiZx6t4jh3ytjWFjqbXd61h+NQZIbN7P9iwsPU9F0HL/zF0T52JEvfvt1CvifwrR
         ljNbwwVpXNO3RLjtlVHwlxuPSV50wSAOsypPN1b3MSMIQLEHS74hB6TfidWiQv5AbTAd
         da+qzcpzE8BikpEqWLZSiKu4NA7ZHJFCpJgBB+KO8ecSt3vQwv436J4vmiI17F2Rd1P8
         8NxOo/9FYyLAcde3EA0BUdljOuU3Owt0ixCcGOQiTuwzaRH1ci0rFUMUfntXEU0rflbE
         ioxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydBoCjUNO8CuItKZB8pSG2P6q9zHi0J7AvgREn9AnV4=;
        b=QMq9dw33lMqQ8DeDXgZRwELzTbvhXEJBjlRkhDmsHsSybBWdsVDcZdqNFmNgfFJ9OE
         wTuHV6Edg3mPsFeENDyRKjtyFT6S0BtKTNw41Y/NK4nx/oLYPrI2UbCuLnOQx7FzC06V
         +ghgHNBr/a1XcdSZtkKgM8NbY8rZiizmWQPhN6zCKdYGAy9sgJyp6v2wly/7sJTSFDr4
         XHifABvX2MsxHm9pxnfS8EVKIG5KaNFUetSAOc+dUkuTxTpQESD/OKuHXHQAQ38K1yam
         T0yMHm9+1UuBmU1RTdJLj9OMPwL5RMg/T3v7LdL5I0elVLlTgJV9lA9YKFtcpykem8jr
         TEfQ==
X-Gm-Message-State: AOAM5333YU/938MOYBWVeHlfe5S/ZycbwyJz2cEEyAoay07Sd28sS2Zb
	vZif2RFTrhxUOt45slXFmajPMD9iTGnlJlrWVowOiw==
X-Google-Smtp-Source: ABdhPJxtWQ9vY1uYNUB6xTfqUZPooeOhYqYvgzGLsl8nckDJsX1aEhhycZnlfQdYZbOZhTw6MfHXP9ChtPmM6572WRA=
X-Received: by 2002:aca:4e0c:: with SMTP id c12mr3695402oib.74.1597332227113;
 Thu, 13 Aug 2020 08:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <1e3cf82b34e2413bb0b438ef1adfa04b@smucm07j.europe.bmw.corp>
In-Reply-To: <1e3cf82b34e2413bb0b438ef1adfa04b@smucm07j.europe.bmw.corp>
From: "Mohammed Billoo" <mab@mab-labs.com>
Date: Thu, 13 Aug 2020 11:23:36 -0400
Message-ID: <CALkjhPogfjCx69uQ3GDzA_ei062ktrLh+S5gC_9b0ESK_Dsv=A@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
To: Lukas Bulwahn <Lukas.Bulwahn@bmw.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-safety@lists.elisa.tech
Content-Type: multipart/alternative; boundary="000000000000fc733505acc3e3b6"

--000000000000fc733505acc3e3b6
Content-Type: text/plain; charset="UTF-8"

With regards to the directory name, it wasn't meant to be for this specific
group, but a sensible category to put these patches in. In my experience,
misc becomes a catch-all for everything else, promotes laziness, and things
end up being a mess. Does it make sense to create another directory that
contains patches that are specific to catching CWEs (e.g. a directory
called "safety" or "safety-critical") that don't obviously fall into the
other non-misc directories?

On Thu, Aug 13, 2020 at 11:16 AM <Lukas.Bulwahn@bmw.de> wrote:

> To your questions, here is my opinion...
>
> 1. Is the header format in the semantic patch acceptable (i.e. referencing
> the CWE that this particular semantic patch aims to address)?
>
> Actually, I think we should that for the existing rules as well.
>
> I was thinking of the following format:
>
> # Addresses: CWE-414 ("Missing Lock Check")
>
> or
>
> # Contributes-to: Missing Lock Check [CWE-414]
>
> I think it is good discussion to have with Julia Lawall, Dan Carpenter,
> Luc Van Oostenryck, Joe Perches, etc. to see how they would want to
> maintain such information within their tools.
>
>
> 2. Should we create a separate directory for ELISA within coccinelle?
>
> No, we do not structure according to the contributor, then the kernel
> architecture would be "linus directory", "andrew directory", "shuah
> directory", etc.
>
> I would suggest that we could roughly structure according the existing
> structure for coccinelle and the CWE structure.
>
>
> Lukas
>
> P.S.: We need to set groups.io not to generate HTML emails on responses
> etc. when we want to engage with the kernel community. Let us check if we
> get that set up.
>
>

-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022

--000000000000fc733505acc3e3b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>With regards to the directory name, it wasn&#39;t mea=
nt to be for this specific group, but a sensible category to put these patc=
hes in. In my experience, misc becomes a catch-all for everything else, pro=
motes laziness, and things end up being a mess. Does it make sense to creat=
e another directory that contains patches that are specific to catching CWE=
s (e.g. a directory called &quot;safety&quot; or &quot;safety-critical&quot=
;) that don&#39;t obviously fall into the other non-misc directories?</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Aug 13, 2020 at 11:16 AM &lt;<a href=3D"mailto:Lukas.Bulwahn@bmw.de">Luka=
s.Bulwahn@bmw.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">To your questions, here is my opinion...<br>
<br>
1. Is the header format in the semantic patch acceptable (i.e. referencing =
the CWE that this particular semantic patch aims to address)?<br>
<br>
Actually, I think we should that for the existing rules as well.<br>
<br>
I was thinking of the following format:<br>
<br>
# Addresses: CWE-414 (&quot;Missing Lock Check&quot;)<br>
<br>
or<br>
<br>
# Contributes-to: Missing Lock Check [CWE-414]<br>
<br>
I think it is good discussion to have with Julia Lawall, Dan Carpenter, Luc=
 Van Oostenryck, Joe Perches, etc. to see how they would want to maintain s=
uch information within their tools.<br>
<br>
<br>
2. Should we create a separate directory for ELISA within coccinelle?<br>
<br>
No, we do not structure according to the contributor, then the kernel archi=
tecture would be &quot;linus directory&quot;, &quot;andrew directory&quot;,=
 &quot;shuah directory&quot;, etc.<br>
<br>
I would suggest that we could roughly structure according the existing stru=
cture for coccinelle and the CWE structure.<br>
<br>
<br>
Lukas<br>
<br>
P.S.: We need to set <a href=3D"http://groups.io" rel=3D"noreferrer" target=
=3D"_blank">groups.io</a> not to generate HTML emails on responses etc. whe=
n we want to engage with the kernel community. Let us check if we get that =
set up.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Mohammed A Billoo</div><di=
v>Founder</div><div>MAB Labs, LLC</div><div><a href=3D"http://www.mab-labs.=
com" target=3D"_blank">www.mab-labs.com</a></div><div>201-338-2022<br></div=
></div></div></div>

--000000000000fc733505acc3e3b6--
