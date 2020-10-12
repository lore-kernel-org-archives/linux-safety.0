Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.979.1602516294007291922
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 08:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhTqLk8z;
 spf=pass (domain: gmail.com, ip: 209.85.219.196, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-yb1-f196.google.com with SMTP id b138so11373082yba.5
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iPv7827Nls0k4D3zdHYccFHp2qugyVVdkpLdlibXylE=;
        b=jhTqLk8ziijLvUmU9B6FFv5qWVvghvIypTAAz4yDCb9Tsi07ce4ra6Lli4ckhNWrbA
         EDa+N9c5x2h9k4XpELr+JUw7zrtC6/HKjyfsYBKxiel+fSM+iDuFaswXd53hTourKfUp
         ZF69WNsQgr07CooGA4khxMVxCJFStjve1Jhw0I6T35ExN/wINwszRJ2AcDqrmaUsYA/9
         MDoIw7DuOQmKE5G4heILz7Sqhy0DeLMTmAmzOj6pebb6Y7WzUBIF2xFEh++TrYse8cK9
         +UPxQYwAClmqUW0SApmurYJ9osCJOZnWrz+t0aqH6ZFSYO/4JEfUAI3iUJsTsBfdB4GV
         ICVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iPv7827Nls0k4D3zdHYccFHp2qugyVVdkpLdlibXylE=;
        b=SMCKk0gFu8g0XxF4HzNoAC5oUtEFazGA5IPh1h6x6Ok3G5FiNYmwuyujR2teI8N3oY
         Xj8C+H0xicaNqX4YMNxcBAdiTE1IHPpycVJWGsAmdpnIyvaE6NcAxY2tsEB3JwbNU90E
         8/FnE6CQ2dACUGd1oiItBgr+x0KU3j41rIxROMy9Km4dWS1KkHAYn77hwRsQwwmOI53O
         QTwgsoasSjqEQ0oMamh9YRD6KisYxuoQr9ThrVcL+tu6rTVpbzoz7nMx33DSdND29h+5
         f0/bE+Iz9PUITvRK17nX2/ovrBau6335fpe2YyrN/U7RQpXUPWk7yMGu1fFOVdphmGCo
         /F5w==
X-Gm-Message-State: AOAM532jnShsm3N/+BcsCsXT4BJ47sLPhaSeWlUWGrXGdeTTH+T/6qR3
	AeysFn8RvF0tWGGz5ncjfRZoFrQCRlMo8eB4450=
X-Google-Smtp-Source: ABdhPJzT3A0THw8y5w7vuVFfaZQvrSDF6frvTQvfecNoHOrr6gPbO1w+ylVW9oKfyAfyhRhKATdYfCiVF3YktX4UYHA=
X-Received: by 2002:a25:e046:: with SMTP id x67mr31850217ybg.342.1602516293133;
 Mon, 12 Oct 2020 08:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010121550300.6487@felia>
In-Reply-To: <alpine.DEB.2.21.2010121550300.6487@felia>
From: "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
Date: Mon, 12 Oct 2020 16:24:16 +0100
Message-ID: <CADVatmN7d+Oy5iHTUK=azHsvFq9+s0rdcjUTz5m_K4Xrf+JvZA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-safety@lists.elisa.tech, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,

On Mon, Oct 12, 2020 at 3:11 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Sun, 11 Oct 2020, Sudip Mukherjee wrote:
>
> > Add a comment explaining why find_tt() will not return error even though
> > find_tt() is checking for NULL and other errors.
> >
> > Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>
> I get the intent of the comment but there is a large risk that somebody
> could remove the find_tt() call before the calling the function and there
> is no chance to then see later that the comment is actually wrong.

Removing the find_tt() will mean a major rework of the code.

>
> I guess you want to link this comment here to a code line above and
> request anyone touching the line above to reconsider the comment then.
>
> But there is no 'concept' for such kind of requests to changes and
> comments.
>
> So, the comment is true now, but might be true or wrong later.

If it is wrong later due to some code change then I guess someone will
need to send a patch to correct the comment.

>
> I am wondering if such comment deserves to be included if we cannot check
> its validity later...

I am failing to understand why will you not be able to check its
validity later. You just need to read the code to check it.

>
> I would prefer a simple tool that could check that your basic assumption
> on the code is valid and if it the basic assumption is still valid,
> just shut up any stupid tool that simply does not get that these calls
> here cannot return any error.
>
> We encountered this issue because of clang analyzer complaining, but it is
> clear that it is a false positive of that (smart but) incomplete tool.

I dont think it is a false positive. The error return value is not
checked and that is true. Only that it is not applicable because of
the way the coding is done.

>
> Do you intend to add comment for all false positives from all tools or are
> we going to find a better solution than that?

I think tools will always give you some false positives and you will
need to read the code to know if its false positive or not. I dont
think there is any tool yet which will only give true positives.


-- 
Regards
Sudip
