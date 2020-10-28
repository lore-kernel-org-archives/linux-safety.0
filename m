Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.539.1603906736982794105
 for <linux-safety@lists.elisa.tech>;
 Wed, 28 Oct 2020 10:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uoRMTe+G;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: xiyou.wangcong@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id k1so227080ilc.10
        for <linux-safety@lists.elisa.tech>; Wed, 28 Oct 2020 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ozYCZRgZqvrBNZwSGWpcjHZ/UebLYVQ2msLNU5VY5Mo=;
        b=uoRMTe+GToyjDoY9/GaktCa1BeSuPzVAR3/boLPppUGl2qn34CK74mw2rIzAvM3ugD
         SQ2p3aZO5PqkKhiOBdyBW8DBlPIF/Tcc6+83P3KSglxaTdhTl9wHL0mu6LpQJ/aNPYGk
         /aDeRn5tXPMYv6ZrqEqshKEqAMefYDA42I2NAyiczmdob/fE6/C17lTpYjIm3i2nHFub
         K7djTFNomWxGyjgJgYaExtWgiUrXfPoe1d3WFjoYg76WLdF5US+sBtUNs/orjJRmkjIT
         oyE1avb6xQqwp/xtMx5iZ1T0D8ckNdMumCO27aucVma7HiOGSBhpTihnODBRV/SORZ9K
         jh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozYCZRgZqvrBNZwSGWpcjHZ/UebLYVQ2msLNU5VY5Mo=;
        b=SVvkQ+FYsZf+mx8PLrVjbAhNA8fP6kaKZcPQWZWJjKsBV7EHmEmQNDkqN4aWB9xksr
         PzM/CSUWgNsEpk6u+80lHrS0J3SMBsCYSvG3qCPGr0vgxW15zmBNeKaErhCnOmynkZjM
         BY4kOcjH5jBQVj+S60KUtd8jf2yzTwN0ofTdxRnvJAe4VSz8AB3PMDXFp6wfAAA2KX56
         R7BLp5Ctf7Q+058Tu5udc4XFjJBAyISgd08N/iKKPqWpRrQ2pDUoWXoyDE8wpKcXqd2M
         ox9qIUkNQIcceWDSMrggSKPlTwxK+2X3HcUbGGrjel5Bha8HWcBpEWODvDVpsCh6SBbn
         jk0A==
X-Gm-Message-State: AOAM533Uh8iRabqrPej8Rxdigwe6jw2KPMGWD/GnIj9FQEupZORXY3sW
	U3vSGuYngIPAW1sQ4MgBcfOftKnGPFgu9zUkqXA=
X-Google-Smtp-Source: ABdhPJwBVHlD8D4vAAXos2Nzvs1/eRlOYVtS1b+L4Ik0PIOGENFpsUsLpxj2nAxw9y6dHLnM6j3+R7WB5l0ZfZPRLMc=
X-Received: by 2002:a92:c04c:: with SMTP id o12mr171588ilf.22.1603906736261;
 Wed, 28 Oct 2020 10:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201028113533.26160-1-lukas.bulwahn@gmail.com> <d956a5a5-c064-3fd4-5e78-809638ba14ef@redhat.com>
In-Reply-To: <d956a5a5-c064-3fd4-5e78-809638ba14ef@redhat.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 28 Oct 2020 10:38:45 -0700
Message-ID: <CAM_iQpUfE2f3QBFY6r0_D2mzFK_SsmFXdA-1p3h7yquM8912fg@mail.gmail.com>
Subject: Re: [PATCH] net: cls_api: remove unneeded local variable in tc_dump_chain()
To: Tom Rix <trix@redhat.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Linux Kernel Network Developers <netdev@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2020 at 6:59 AM Tom Rix <trix@redhat.com> wrote:
>
>
> On 10/28/20 4:35 AM, Lukas Bulwahn wrote:
> > @@ -2971,13 +2963,11 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
> >               if (!dev)
> >                       return skb->len;
> >
> > -             parent = tcm->tcm_parent;
> > -             if (!parent) {
> > +             if (!tcm->tcm_parent)
> >                       q = dev->qdisc;
> > -                     parent = q->handle;
>
> This looks like a an unused error handler.
>
> and the later call to
>
> if (TC_H_MIN(tcm->tcm_parent)
>
> maybe should be
>
> if (TC_H_MIN(parent))

When tcm->tcm_parent is 0, TC_H_MIN(tcm->tcm_parent) is also 0,
so we will not hit that if branch.

So, I think Lukas' patch is correct.

Thanks.
