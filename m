Return-Path: <SRS0=6AKr=GX=lists.elisa.tech=bounce+72012+233+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7EAC433E0
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 00:21:17 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A60622573
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 00:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A60622573
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+233+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id A7LFYY5279335xT9fcaTF9tN; Tue, 19 Jan 2021 16:21:16 -0800
X-Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by mx.groups.io with SMTP id smtpd.web08.1497.1611001572689116403
 for <linux-safety@lists.elisa.tech>;
 Mon, 18 Jan 2021 12:26:12 -0800
X-Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 65E372AE;
	Mon, 18 Jan 2021 20:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 65E372AE
Date: Mon, 18 Jan 2021 13:26:07 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: lukas.bulwahn@gmail.com, sudip.mukherjee@codethink.co.uk,
 linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
 linux-doc@vger.kernel.org, hch@lst.de
Subject: Re: [linux-safety] [PATCH] docs: Remove make headers_check from checklist
Message-ID: <20210118132607.78d3c2d3@lwn.net>
In-Reply-To: <1610458861-2832-1-git-send-email-milan.lakhani@codethink.co.uk>
References: <1610458861-2832-1-git-send-email-milan.lakhani@codethink.co.uk>
Organization: LWN.net
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: N2nkigIphzGGaXup7gQQKHpFx5278000AA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1611102076;
 bh=AtfCqKtWJ+N/xI2EvqLH5sXLNN/igzYr62GXd8DAcJM=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=SNNk8wdpaJp7/q73fuaCKfpByiP1Ubwu51FWwuzas1EhBSVubrSJ7NnjqQlPlmAH6iI
 GmSk7jyi0kHw0lfkPjgK/xayqomVbgU3HgXXnwWke3sg6SLHlv2xJzG4Qua/NUQ7etLYP
 agg/j5ufb/vHUdUOsOoZkC2mJBgx9NbSiOo=

On Tue, 12 Jan 2021 13:41:01 +0000
Milan Lakhani <milan.lakhani@codethink.co.uk> wrote:

> Remove the make headers_check step from submit-checklist.rst as this is
> no longer functional.
>=20
> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  Documentation/process/submit-checklist.rst | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Applied, thanks.

jon


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#233): https://lists.elisa.tech/g/linux-safety/message/=
233
Mute This Topic: https://lists.elisa.tech/mt/79623000/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@a=
rchiver.kernel.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


