Return-Path: <SRS0=IOeA=GX=lists.elisa.tech=bounce+72012+235+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10290C433DB
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 01:12:38 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA6A23109
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 01:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AA6A23109
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+235+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id 2JL9YY5279335xRMGyQeke2u; Tue, 19 Jan 2021 17:12:36 -0800
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.21610.1611104840183392322
 for <linux-safety@lists.elisa.tech>;
 Tue, 19 Jan 2021 17:07:20 -0800
X-Received: by mail.kernel.org (Postfix) with ESMTPSA id 24B9023108
	for <linux-safety@lists.elisa.tech>; Wed, 20 Jan 2021 01:07:19 +0000 (UTC)
X-Received: by mail-ej1-f52.google.com with SMTP id r12so19826745ejb.9
        for <linux-safety@lists.elisa.tech>; Tue, 19 Jan 2021 17:07:19 -0800 (PST)
X-Gm-Message-State: uajOEq7zTzO2S6xkDbyscegFx5278000AA=
X-Google-Smtp-Source: ABdhPJxfJGCbBJT7icJ9Nc5mrXaX3NSE9o40e2Pu6NCFojB0Mv6SpI5ROTj5bhtWUpizkfF/MISHiC+dNrBSDEs/uUk=
X-Received: by 2002:a17:907:d01:: with SMTP id gn1mr4218134ejc.130.1611104837622;
 Tue, 19 Jan 2021 17:07:17 -0800 (PST)
MIME-Version: 1.0
References: <1611051980-3834-1-git-send-email-milan.lakhani@codethink.co.uk> <87y2gopjcx.fsf@meer.lwn.net>
In-Reply-To: <87y2gopjcx.fsf@meer.lwn.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Jan 2021 19:07:06 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+YW2K8YoLes8EAUy1WrFRzpYvtzvErOYbhw3zvZBoddQ@mail.gmail.com>
Message-ID: <CAL_Jsq+YW2K8YoLes8EAUy1WrFRzpYvtzvErOYbhw3zvZBoddQ@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] docs: Change reference that was to removed file
To: Jonathan Corbet <corbet@lwn.net>
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	sudip.mukherjee@codethink.co.uk, linux-safety@lists.elisa.tech, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Harry Wei <harryxiyou@gmail.com>, 
	Alex Shi <alex.shi@linux.alibaba.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1611105156;
 bh=5hlWmo8EYmGnNcsKBGZ8dbuAkvCrmnJ8hTgEH5FdPmA=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=pJYCLIRKZhoZ3V5rLHrqXPvzQPa1IZGGRTe+iAktFXsNzSGO7Y1IcDP3m93ju/rRWhr
 tMaIm0ncctyiCPbbezLqpeIilXRBxHOzTXLHBrMaJRG9mthy9176m1HhbM4hEk63IjNN5
 DqacSBqKVgekuHeWbBZK5D4Gwk3qZ9T/juw=

On Tue, Jan 19, 2021 at 6:01 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Milan Lakhani <milan.lakhani@codethink.co.uk> writes:
>
> [CC += Rob]
>
> > There were two references to
> > Documentation/devicetree/booting-without-of.rst for dtb format
> > information. This file has been removed, so I have changed the links to
> > Documentation/devicetree/usage-model.rst for this information, which
> > itself points to https://elinux.org/Device_Tree_Usage for an overview of
> > the device tree data format.
> >
> > Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> > ---
> >  Documentation/arm/booting.rst                | 2 +-
> >  Documentation/translations/zh_CN/arm/Booting | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/arm/booting.rst b/Documentation/arm/booting.rst
> > index a226345..5392d01 100644
> > --- a/Documentation/arm/booting.rst
> > +++ b/Documentation/arm/booting.rst
> > @@ -128,7 +128,7 @@ it.  The recommended placement is in the first 16KiB of RAM.
> >
> >  The boot loader must load a device tree image (dtb) into system ram
> >  at a 64bit aligned address and initialize it with the boot data.  The
> > -dtb format is documented in Documentation/devicetree/booting-without-of.rst.
> > +dtb format is documented in Documentation/devicetree/usage-model.rst.
>
> Except that ... usage-model.rst doesn't actually document the DTB
> format.  Perhaps we should instead substitute a link that does what's
> promised here?

Yes, it's in the DT spec. I'd point to
'https://www.devicetree.org/specifications/' so it's always going to
show the latest. And that's the link we have elsewhere in the kernel.

usage-model.rst is also something needing updating...

Rob


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#235): https://lists.elisa.tech/g/linux-safety/message/235
Mute This Topic: https://lists.elisa.tech/mt/79948363/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


