Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.41583.1602511901943584138
 for <linux-safety@lists.elisa.tech>;
 Mon, 12 Oct 2020 07:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSqQGv4d;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id e2so17691231wme.1
        for <linux-safety@lists.elisa.tech>; Mon, 12 Oct 2020 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=h5ZzfIQX6aukJHSw7vumw8xxwzN9YjqBKxEPTr4voAE=;
        b=nSqQGv4d++sbaaU/Uqp66MRg+uQGgvk/MSvA5vlGFCbMSMt0OStJjRchzQCer45lu1
         sD6cu6MorP8epgzgtim32sk/T6s60L1gH5V2n9lxP+wX7QriElKQUVayo2kJquXNU/kn
         AWlooPwo3XmGJcMCQ2AKYjgOnVmtVoVY+LRdx5kBbWtJI98HOJe1oTGkwnPjIGZfpOVl
         uA27gFQrBTWmbnf73lVnPqpjIl4vvoJ3TUfCN3yo+8JBhRAk1E97bbounECU0hdhaNNh
         d53cag1c6ewz4a9OON82EovWd1mlQ3CAhT1tXhbtCeNUpZx2UqBnW/njoONiHeaWS24t
         ODMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=h5ZzfIQX6aukJHSw7vumw8xxwzN9YjqBKxEPTr4voAE=;
        b=dUuTAKq/0E1p0QI965ZbcsPmDnbyYo6Gxrzr5Xotp6qe0OOA13lVafJdih5SqEWnQY
         WCskYPGECVc7d2YEKrBXihpbd6Ti8LIVombMOaOg4+BI+lnC8OQ52mzdVJ33W4KOJp29
         +GdGyXrDPnuDg1DM0DzABGcuXD+E/z3HYlxOWyRB5IMwGrmqqC3eZIwOeX0E7/vULWK8
         tRxq83iLhdqwigEA/kD3SAf/5v3vMemmQ/ithCbK9uaV/y1rrOqscYHdjJDh9sHMGl7U
         hfKR/x5b+oqgyKeKVUaRSg2O2S+qRqUnrLh16k8Qlmzuvi8Y9wRxhYEjCXYjamSSeo9y
         BilA==
X-Gm-Message-State: AOAM530G/BGxEq5d7Qe49Y3e7WvZfaxLC1zAUdGF8lgVekOr7Nm2N+t+
	I89DgvG1eS4o+1mTFj9DEGE=
X-Google-Smtp-Source: ABdhPJz4cQE56p19WC7uOYDWwXi0QBHomdFPb+2I5XMQ70Fc159welhBc/U++H1WJ8qlhMX+39I/wg==
X-Received: by 2002:a1c:9d90:: with SMTP id g138mr10989579wme.5.1602511900138;
        Mon, 12 Oct 2020 07:11:40 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d57:fc00:8472:203c:3ecb:c442])
        by smtp.gmail.com with ESMTPSA id b63sm25593091wme.9.2020.10.12.07.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 07:11:39 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 16:11:38 +0200 (CEST)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: Alan Stern <stern@rowland.harvard.edu>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech, 
    linux-usb@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: add comment about find_tt() not returning error
In-Reply-To: <20201011205008.24369-1-sudipm.mukherjee@gmail.com>
Message-ID: <alpine.DEB.2.21.2010121550300.6487@felia>
References: <20201011205008.24369-1-sudipm.mukherjee@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 11 Oct 2020, Sudip Mukherjee wrote:

> Add a comment explaining why find_tt() will not return error even though
> find_tt() is checking for NULL and other errors.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

I get the intent of the comment but there is a large risk that somebody 
could remove the find_tt() call before the calling the function and there 
is no chance to then see later that the comment is actually wrong.

I guess you want to link this comment here to a code line above and
request anyone touching the line above to reconsider the comment then.

But there is no 'concept' for such kind of requests to changes and 
comments.

So, the comment is true now, but might be true or wrong later.

I am wondering if such comment deserves to be included if we cannot check 
its validity later...

I would prefer a simple tool that could check that your basic assumption 
on the code is valid and if it the basic assumption is still valid, 
just shut up any stupid tool that simply does not get that these calls 
here cannot return any error.

We encountered this issue because of clang analyzer complaining, but it is 
clear that it is a false positive of that (smart but) incomplete tool.

Do you intend to add comment for all false positives from all tools or are 
we going to find a better solution than that?

I am happy to contribute to the smarter solution...
e.g., a cocci script that checks that the call is still there and then
always marking the related tool finding as false positive.

Lukas

> ---
>  drivers/usb/host/ehci-sched.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
> index 6dfb242f9a4b..0f85aa9b2fb1 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -244,6 +244,12 @@ static void reserve_release_intr_bandwidth(struct ehci_hcd *ehci,
>  
>  	/* FS/LS bus bandwidth */
>  	if (tt_usecs) {
> +		/*
> +		 * find_tt() will not return any error here as we have
> +		 * already called find_tt() before calling this function
> +		 * and checked for any error return. The previous call
> +		 * would have created the data structure.
> +		 */
>  		tt = find_tt(qh->ps.udev);
>  		if (sign > 0)
>  			list_add_tail(&qh->ps.ps_list, &tt->ps_list);
> @@ -1337,6 +1343,12 @@ static void reserve_release_iso_bandwidth(struct ehci_hcd *ehci,
>  			}
>  		}
>  
> +		/*
> +		 * find_tt() will not return any error here as we have
> +		 * already called find_tt() before calling this function
> +		 * and checked for any error return. The previous call
> +		 * would have created the data structure.
> +		 */
>  		tt = find_tt(stream->ps.udev);
>  		if (sign > 0)
>  			list_add_tail(&stream->ps.ps_list, &tt->ps_list);
> -- 
> 2.11.0
> 
> 
> 
> 
> 
> 
> 
