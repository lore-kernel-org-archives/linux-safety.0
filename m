Return-Path: <SRS0=311t=E5=lists.elisa.tech=bounce+72012+190+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F4CC2D0E4
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 15:02:07 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635A620782
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 15:02:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="m14FfeZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635A620782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+190+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id h9v9YY5279335xdvY7YlWWtA; Mon, 23 Nov 2020 07:02:05 -0800
X-Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web11.36583.1606143725437785441
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 07:02:05 -0800
X-Received: by mail-il1-f195.google.com with SMTP id w8so16107506ilg.12
        for <linux-safety@lists.elisa.tech>; Mon, 23 Nov 2020 07:02:05 -0800 (PST)
X-Gm-Message-State: ZCUTL1uvABOzoLsdyMzqCHjux5278000AA=
X-Google-Smtp-Source: ABdhPJyPlSCcrkWuxpLElr435EbIzERKEmMpp/aPZIQlmUhmPcx7tNXoMxCzH+ew026RrC1J8NRQmtwcu022+ZhfdMs=
X-Received: by 2002:a92:35d7:: with SMTP id c84mr95549ilf.251.1606143724717;
 Mon, 23 Nov 2020 07:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20201116165407.8050-1-sudipm.mukherjee@gmail.com>
 <20201116170137.GA2587640@ulmo> <0ef6fc37-4e91-68a1-0744-90b4093ce5ba@codethink.co.uk>
In-Reply-To: <0ef6fc37-4e91-68a1-0744-90b4093ce5ba@codethink.co.uk>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 16:01:59 +0100
Message-ID: <CAKXUXMxzEBoVwuVFYnKCi004a7ytQfK+B-wjjE8i1J1Fzce6qw@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] PCI: tegra: Use PTR_ERR_OR_ZERO
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech, 
	linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606143725;
 bh=bW69FewzRQuV77NQGCnng2joDa/iL1CTOM8unR/SZ2Y=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=m14FfeZw0ep3yYgkuFjDafXBbENvXn4zhoNPf1i1RAD9fpi+NRyqhKTAuzYtm9/nPhp
 gB+6vuvrxSTj+ySVZo5jLBxc/PmFVWbX6RkUVG7ekzSUm6661lYLRJ1nAJP+4jUcHWkRb
 mtIrWluQX99kmjZPoSRQplmdrAJyIqHbbeY=

On Mon, Nov 23, 2020 at 3:51 PM Sudip Mukherjee
<sudip.mukherjee@codethink.co.uk> wrote:
>
>
> On 16/11/2020 17:01, Thierry Reding wrote:
> > On Mon, Nov 16, 2020 at 04:54:07PM +0000, Sudip Mukherjee wrote:
> >> Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
> >> we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
> >> doing 'return 0'.
> >>
> >> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> >> ---
> >>  drivers/pci/controller/pci-tegra.c | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > This has been proposed multiple times in the past and Bjorn and I have
> > agreed every time that this is not an improvement, so sorry, but NAK.
>
> Thanks Thierry and Neil. I have now added a blacklist script in our CI
> so "PTR_ERR_OR_ZERO" will not be flagged for anything in drivers/pci/*
> anymore in our testing.
>
>

Thanks, Sudip. I think that is a good idea to minimize churn on
subsystem maintainers from janitors.

We can continue to discuss how to share these settings on
ignore-rule-X-on-subsystem-Y with other "analysis tool CI
maintainers".

Lukas


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#190): https://lists.elisa.tech/g/linux-safety/message/190
Mute This Topic: https://lists.elisa.tech/mt/78296400/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


