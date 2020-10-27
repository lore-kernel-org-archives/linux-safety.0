Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web08.11804.1603794210522072611
 for <linux-safety@lists.elisa.tech>;
 Tue, 27 Oct 2020 03:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NfR2PP7N;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id d78so822203wmd.3
        for <linux-safety@lists.elisa.tech>; Tue, 27 Oct 2020 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=1HuF32Z5KTiOxTygYUVi/qMQ1KCcUZz0TO13Zz3IK00=;
        b=NfR2PP7N/Rg6LWWMztIN6eYfgjHy9KyDzErdTy5zyBF9+E07Cxz77llGuGLsLnfQM0
         mWD4fDOoxqYeEsgtMG2iCXEKzCe/dsJby9t+wVnN7EoVMmNToOnpZcWF/pqR+GT3LzsY
         qwTCjLul3KuS3mhK4rBNtxKQGTJCzfISbUTpCQ87z9d86gYKT4jmE5S3cXGMfQ0wR9my
         FpiDX1tHuZzPOAUxQ8VVE9fFC+zhUl964BP3c/h+VrsEnGettcW0VoqsMmGQeDYxvp/E
         2JhjzzOYdYovFPYjq8zIMMmOE2w5FZv9jPYH8jYkFAlDV5w0gaN29VPBSgLOONGDd/er
         MsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=1HuF32Z5KTiOxTygYUVi/qMQ1KCcUZz0TO13Zz3IK00=;
        b=apZdUC5asIZ7bULnDP6ZexQwrLKbXu6KhFgMBEkoy6iFz32ZXwH95/5f04e1c6/g4h
         OYNxLQz9bSXesm51lHCHEDZtgUqXJrRftInlvu9c2+PUHJ/ieAlvzw5XY30mJRMNou8z
         3euOZzOogLigMGm4gxiCSKKVFu3YdEhAWoTNEeKt57gAKxaDL8xnFzECzJOFlVcqwwYr
         v5nUuuv42B8aw5OdfBVkRGOZCT/rvBWs6ig2KcJ9CZL+MzQRFGtj3wddt8pJ/D970JLW
         RbxE5mehMERKZcEwrOAU2YvJXSFX88685ub8voT0TCUiddMFPeq3PHnk0EyFiZV38lHP
         rzLw==
X-Gm-Message-State: AOAM533ItwAq8sCBIG0et8meKs12vFOS0xHoYITWIgx8x1RuruIqURMM
	w942VYya793i2Oyd+2FD3j0=
X-Google-Smtp-Source: ABdhPJyy7TGBV5v5r9pYAPOOi9cHULDXlTHRuei7IblMt+kETQeZQAGEcacFQVzqSskUr3LeJr0KCg==
X-Received: by 2002:a7b:cb8d:: with SMTP id m13mr1878197wmi.59.1603794209047;
        Tue, 27 Oct 2020 03:23:29 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2de9:3700:3160:107b:5425:634f])
        by smtp.gmail.com with ESMTPSA id 1sm1496014wre.61.2020.10.27.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:23:28 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 27 Oct 2020 11:23:27 +0100 (CET)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] misc: hisi_hikey_usb: use PTR_ERR_OR_ZERO
In-Reply-To: <7796cec8-e9e5-6c9b-176e-f2c30a845f0b@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.2010271119550.7937@felia>
References: <20201026180026.3350-1-sudipm.mukherjee@gmail.com> <alpine.DEB.2.21.2010270625520.7937@felia> <7796cec8-e9e5-6c9b-176e-f2c30a845f0b@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 27 Oct 2020, Sudip Mukherjee wrote:

> Hi Lukas,
> 
> On 27/10/2020 05:36, Lukas Bulwahn wrote:
> > 
> > 
> > On Mon, 26 Oct 2020, Sudip Mukherjee wrote:
> > 
> >> Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
> >> we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
> >> doing 'return 0'.
> >>
> >> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> >> ---
> 
> <snip>
> 
> > 
> > I think in the very long-term future, it would be nice if we can somehow 
> > link a finding from a specific tool (with some kind of URI) in the commit 
> > message or so.
> 
> I was thinking something almost similar, and was wondering if I can add
> the tool name with some tags and then it will be possible to generate
> some stats later about which tool fixed more things. I will send out a
> mail later today to lkml proposing that we use such a tag.
>
> I think adding URI is not possible until we have a persistent link to
> these reports. The report that I generate can only have last 4 days
> report, so the URI will not be valid after 4th day.
>

I would prefer to first include the reports into kernel ci db and maybe 
then we understand much better how to make those persistent links.

Lukas
