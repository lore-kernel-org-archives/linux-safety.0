Return-Path: <SRS0=loxM=FZ=lists.elisa.tech=bounce+72012+228+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51D7C433DB
	for <linux-safety@archiver.kernel.org>; Mon, 21 Dec 2020 17:54:18 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257D822B51
	for <linux-safety@archiver.kernel.org>; Mon, 21 Dec 2020 17:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257D822B51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+228+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id NQUqYY5279335xqupjEWcRPh; Mon, 21 Dec 2020 09:54:17 -0800
X-Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by mx.groups.io with SMTP id smtpd.web12.2632.1608569532511383625
 for <linux-safety@lists.elisa.tech>;
 Mon, 21 Dec 2020 08:52:12 -0800
X-Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E57DD559;
	Mon, 21 Dec 2020 16:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E57DD559
Date: Mon, 21 Dec 2020 09:52:09 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
 linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com,
 sudip.mukherjee@codethink.co.uk, Christoph Hellwig <hch@lst.de>
Subject: Re: [linux-safety] [PATCH v2] Documentation: process: Correct numbering
Message-ID: <20201221095209.4dd4233e@lwn.net>
In-Reply-To: <1608064956-5512-1-git-send-email-milan.lakhani@codethink.co.uk>
References: <1608064956-5512-1-git-send-email-milan.lakhani@codethink.co.uk>
Organization: LWN.net
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: vO4G8fcTQugEMRubM1fR9qxpx5278000AA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608573257;
 bh=gusw7rUXf4ojQBGYTixr9ONcOOdkQknMGKGlgmId5E8=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=stNDF3/UtXGLnRyPghAnkChiS7fSUXxvq7eGUF2dAWVHUjpKa06fM8gkJECVmq4nLgY
 W6ARcstNpwdkK/jAXLK5nYDA8p5qfZYci5vJ7QDRDHgtZyKHCYbw+yN75Euyx3RxVVYNZ
 SMmC096xsTr5Wj1w/nB/xvJBNEKI3iHvvNw=

On Tue, 15 Dec 2020 20:42:36 +0000
Milan Lakhani <milan.lakhani@codethink.co.uk> wrote:

> Renumber the steps in submit-checklist.rst as some numbers were skipped.
>=20
> Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")
> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  Documentation/process/submit-checklist.rst | 24 ++++++++++++-----------=
-
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/process/submit-checklist.rst b/Documentation/=
process/submit-checklist.rst
> index 1879f88..230ee42 100644
> --- a/Documentation/process/submit-checklist.rst
> +++ b/Documentation/process/submit-checklist.rst
> @@ -75,44 +75,44 @@ and elsewhere regarding submitting Linux kernel patc=
hes.
>  13) Has been build- and runtime tested with and without ``CONFIG_SMP`` =
and
>      ``CONFIG_PREEMPT.``
>  
> -16) All codepaths have been exercised with all lockdep features enabled=
.
> +14) All codepaths have been exercised with all lockdep features enabled=
.
>  
> -17) All new ``/proc`` entries are documented under ``Documentation/``
> +15) All new ``/proc`` entries are documented under ``Documentation/``
[...]

I've applied this, but, if you're going to stick a "Fixes" tag onto a
patch, it's probably only polite to copy the original author.  I'm not
fully convinced that the tag is warranted in this case.

This document seems out of date in a number of ways; it could really use a
rather more thorough updating than this.

Thanks,

jon


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#228): https://lists.elisa.tech/g/linux-safety/message/=
228
Mute This Topic: https://lists.elisa.tech/mt/78985953/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@a=
rchiver.kernel.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


