Return-Path: <SRS0=/QVX=E5=lists.elisa.tech=bounce+72012+196+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58692C63697
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 18:41:46 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 826552073C
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 18:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="vUmjRErD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 826552073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+196+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id PA42YY5279335xPq8JbhSeAR; Mon, 23 Nov 2020 10:41:44 -0800
X-Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mx.groups.io with SMTP id smtpd.web11.39715.1606154835827438567
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 10:07:16 -0800
X-Received: from zn.tnic (p200300ec2f0bbc00fb0727400affb1c1.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:bc00:fb07:2740:aff:b1c1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9AB741EC0528;
	Mon, 23 Nov 2020 19:07:13 +0100 (CET)
Date: Mon, 23 Nov 2020 19:07:14 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [PATCH 2/4] x86/mce: move the mce_panic() call and kill_it assignments at the right places
Message-ID: <20201123180714.GH15044@zn.tnic>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-3-gabriele.paoloni@intel.com>
 <20201123142746.GC15044@zn.tnic>
 <MN2PR11MB4158162EBECE1AEA80D5EC0288FC0@MN2PR11MB4158.namprd11.prod.outlook.com>
 <20201123171910.GF15044@zn.tnic>
 <MN2PR11MB4158D04F8ABD74C313667CF088FC0@MN2PR11MB4158.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN2PR11MB4158D04F8ABD74C313667CF088FC0@MN2PR11MB4158.namprd11.prod.outlook.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: KcG4qpcokTGXgngZvb3jJHTHx5278000AA=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606156904;
 bh=u+l9tDTjkRsX1CPivXKFMRQJq3iIMAJetO2UCqgF4fw=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=vUmjRErDGsjuz2nTWb+e6mXsjlz7ODKtqS396ZDbqIxx1VjOm9NFqKuCa0WYpwLwE4I
 FCiO3H6crlXJvFKGyw7ciBP3qGFDDT7yGPTV3hFQnEuP4IPTY/GFGS6XVV/XH/ClQQRo2
 V6UGqtY5XOLICZAxBeakxN0g5QxoiDlMECk=

On Mon, Nov 23, 2020 at 05:40:21PM +0000, Paoloni, Gabriele wrote:
> Well it is not the easiest code to decode =F0=9F=98=8A

Tell me about it - that's decades worth of crap being piled ontop. :-)

> Sure I can add another patch to the set to rename it.

Yeah, only if you really want to - that was more a note-to-self to take
care of it eventually.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#196): https://lists.elisa.tech/g/linux-safety/message/=
196
Mute This Topic: https://lists.elisa.tech/mt/78342502/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@a=
rchiver.kernel.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


