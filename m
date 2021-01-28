Return-Path: <SRS0=Vc+3=G7=lists.elisa.tech=bounce+72012+238+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3408C433DB
	for <linux-safety@archiver.kernel.org>; Thu, 28 Jan 2021 22:58:09 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B0C64D9E
	for <linux-safety@archiver.kernel.org>; Thu, 28 Jan 2021 22:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B0C64D9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+238+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id 4HUEYY5279335xqRrluJzRG0; Thu, 28 Jan 2021 14:58:08 -0800
X-Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by mx.groups.io with SMTP id smtpd.web12.1416.1611873822868903266
 for <linux-safety@lists.elisa.tech>;
 Thu, 28 Jan 2021 14:43:43 -0800
X-Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 087F16178;
	Thu, 28 Jan 2021 22:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 087F16178
Date: Thu, 28 Jan 2021 15:43:40 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: lukas.bulwahn@gmail.com, sudip.mukherjee@codethink.co.uk,
 linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, harryxiyou@gmail.com,
 alex.shi@linux.alibaba.com, robh@kernel.org
Subject: Re: [linux-safety] [PATCH] docs: Update DTB format references
Message-ID: <20210128154340.2b10a06f@lwn.net>
In-Reply-To: <1611149511-4990-1-git-send-email-milan.lakhani@codethink.co.uk>
References: <1611149511-4990-1-git-send-email-milan.lakhani@codethink.co.uk>
Organization: LWN.net
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 0pxKxLXbCFd8NOfCRYR8ETz7x5278000AA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1611874688;
 bh=gI/X1diMXUBylZ5KWPL58FUi11ZvNGVhJkjBmV2YxgA=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=ZrqW35YL5ZYiS5jnmzvEy0X4EtMku94XeKr0KEe4cxNS2qxnYHozcILNROZ/ZAP1/H0
 nWT1PPOqMSFENgNglreqwTmMwslam7vg9YW81mZt0dHrJKmfsi1QyflU/QLjJmpu1SY+i
 wUG6o05hfcsCZy34Lr72Fq6SnDAdKphJZ3c=

On Wed, 20 Jan 2021 13:31:51 +0000
Milan Lakhani <milan.lakhani@codethink.co.uk> wrote:

> There were two references to devicetree/booting-without-of.rst (which ha=
s
> been removed) for DTB format information, and
> devicetree/usage-model.rst pointed to
> https://elinux.org/Device_Tree_Usage. Change all three of these referenc=
es to
> https://www.devicetree.org/specifications/.
>=20
> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  Documentation/arm/booting.rst                | 2 +-
>  Documentation/devicetree/usage-model.rst     | 2 +-
>  Documentation/translations/zh_CN/arm/Booting | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#238): https://lists.elisa.tech/g/linux-safety/message/=
238
Mute This Topic: https://lists.elisa.tech/mt/79978198/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@a=
rchiver.kernel.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


