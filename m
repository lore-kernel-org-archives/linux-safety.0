Return-Path: <SRS0=q5WX=GX=lists.elisa.tech=bounce+72012+234+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C1EC433DB
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 00:21:17 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA67822C9E
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 00:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA67822C9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+234+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id WOeiYY5279335xmNvoVm0gFV; Tue, 19 Jan 2021 16:21:16 -0800
X-Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by mx.groups.io with SMTP id smtpd.web09.20983.1611101829189401121
 for <linux-safety@lists.elisa.tech>;
 Tue, 19 Jan 2021 16:17:09 -0800
X-Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1BFAA52BF;
	Wed, 20 Jan 2021 00:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1BFAA52BF
From: Jonathan Corbet <corbet@lwn.net>
To: Milan Lakhani <milan.lakhani@codethink.co.uk>, lukas.bulwahn@gmail.com,
 sudip.mukherjee@codethink.co.uk, linux-safety@lists.elisa.tech,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 harryxiyou@gmail.com, alex.shi@linux.alibaba.com
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>, Rob Herring
 <robh@kernel.org>
Subject: Re: [linux-safety] [PATCH] docs: Change reference that was to removed file
In-Reply-To: <1611051980-3834-1-git-send-email-milan.lakhani@codethink.co.uk>
References: <1611051980-3834-1-git-send-email-milan.lakhani@codethink.co.uk>
Date: Tue, 19 Jan 2021 17:01:02 -0700
Message-ID: <87y2gopjcx.fsf@meer.lwn.net>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: j2gHdp7ipHxr0l5x2EYrkjAKx5278000AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1611102076;
 bh=ko4c6e/GGcIUhAW+8nlB3b8lm8H02eGbHUlesapfFpE=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=ns8CPMBqElNJWMxYYtb7wEoAgkq4RwiSTDmo7pvkaUbSn/BvpDvXtHxkV6itxuEe4bH
 5eZuMMyFvIHEQN8tzpnktk+8RrBRMgwPnaEtW9DVa8ma+aS468bwuL7pXPBc+wPMAkOPC
 1mGbCFTwQiAKMmq+SwHPn1LhJrCqC7stcZE=

Milan Lakhani <milan.lakhani@codethink.co.uk> writes:

[CC += Rob]

> There were two references to
> Documentation/devicetree/booting-without-of.rst for dtb format
> information. This file has been removed, so I have changed the links to
> Documentation/devicetree/usage-model.rst for this information, which
> itself points to https://elinux.org/Device_Tree_Usage for an overview of
> the device tree data format.
>
> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  Documentation/arm/booting.rst                | 2 +-
>  Documentation/translations/zh_CN/arm/Booting | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/arm/booting.rst b/Documentation/arm/booting.rst
> index a226345..5392d01 100644
> --- a/Documentation/arm/booting.rst
> +++ b/Documentation/arm/booting.rst
> @@ -128,7 +128,7 @@ it.  The recommended placement is in the first 16KiB of RAM.
>  
>  The boot loader must load a device tree image (dtb) into system ram
>  at a 64bit aligned address and initialize it with the boot data.  The
> -dtb format is documented in Documentation/devicetree/booting-without-of.rst.
> +dtb format is documented in Documentation/devicetree/usage-model.rst.

Except that ... usage-model.rst doesn't actually document the DTB
format.  Perhaps we should instead substitute a link that does what's
promised here?

Thanks,

jon


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#234): https://lists.elisa.tech/g/linux-safety/message/234
Mute This Topic: https://lists.elisa.tech/mt/79948363/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


