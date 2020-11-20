Return-Path: <SRS0=pEhc=E2=lists.elisa.tech=bounce+72012+185+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999A4C63798
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:58:20 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181432240B
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:58:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="MzAwJA1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 181432240B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+185+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id cF6pYY5279335xlCEP1FuRlo; Fri, 20 Nov 2020 09:58:19 -0800
X-Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mx.groups.io with SMTP id smtpd.web11.708.1605893625143612723
 for <linux-safety@lists.elisa.tech>;
 Fri, 20 Nov 2020 09:33:45 -0800
X-Received: from zn.tnic (p200300ec2f11ba0074b4ba83d21d5a9c.dip0.t-ipconnect.de [IPv6:2003:ec:2f11:ba00:74b4:ba83:d21d:5a9c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AAC031EC047E;
	Fri, 20 Nov 2020 18:33:43 +0100 (CET)
Date: Fri, 20 Nov 2020 18:33:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [PATCH 1/4] x86/mce: do not overwrite no_way_out if mce_end() fails
Message-ID: <20201120173342.GF712@zn.tnic>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-2-gabriele.paoloni@intel.com>
 <20201120170737.GD712@zn.tnic>
 <MN2PR11MB4158BE8B738CF6F6BF9B850D88FF0@MN2PR11MB4158.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN2PR11MB4158BE8B738CF6F6BF9B850D88FF0@MN2PR11MB4158.namprd11.prod.outlook.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 76ijZ8U10JcDMkU5iM2kCnRsx5278000AA=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605895099;
 bh=AJK94+TsODzZ2dBWblxsJrqQHECKKcis8LAah9PJF3Q=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=MzAwJA1AZhwTPFn96vncf+vQucbLoB2O65eN6SVLFtSE78wvjNDLnxTGAfJogbvHU+Y
 fcoJartjIKSQ4iDhlluiecKM6NpY+qB01OwquTVZxQCBgVRgKg/NU+iKzU28Js6cdJ4Pw
 FBd/w+fF4vX7N4r9ILEXKwTGQpdmdOxhNMQ=

On Fri, Nov 20, 2020 at 05:31:32PM +0000, Paoloni, Gabriele wrote:
> I mean that on this CPU thread at this point mce_start() already cached
> global_nwo and hence could accumulate fatal severities of other CPUs.
> 
> Now here if mce_end() fails we only consider the local 'worst' severity
> and we overwrite those already cached.

Yap, we're on the same page. :)

> If ok I will fix the grammar and rewrite this code in v2.

Sure, lemme go through the rest first.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#185): https://lists.elisa.tech/g/linux-safety/message/185
Mute This Topic: https://lists.elisa.tech/mt/78342501/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


