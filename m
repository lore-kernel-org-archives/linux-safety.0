Return-Path: <SRS0=F3Is=E5=lists.elisa.tech=bounce+72012+194+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA199C2D0E4
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 17:33:25 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DAE02075A
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 17:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="EVAJQnEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DAE02075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+194+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id rrIlYY5279335xRHZ0I4TCiO; Mon, 23 Nov 2020 09:33:24 -0800
X-Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mx.groups.io with SMTP id smtpd.web11.38917.1606151957663970061
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 09:19:18 -0800
X-Received: from zn.tnic (p200300ec2f0bbc0000a4f4bc59f4c3b0.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:bc00:a4:f4bc:59f4:c3b0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 586081EC0494;
	Mon, 23 Nov 2020 18:19:15 +0100 (CET)
Date: Mon, 23 Nov 2020 18:19:10 +0100
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
Message-ID: <20201123171910.GF15044@zn.tnic>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-3-gabriele.paoloni@intel.com>
 <20201123142746.GC15044@zn.tnic>
 <MN2PR11MB4158162EBECE1AEA80D5EC0288FC0@MN2PR11MB4158.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN2PR11MB4158162EBECE1AEA80D5EC0288FC0@MN2PR11MB4158.namprd11.prod.outlook.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: Frh6ewTyiUs6xMvBJPQ0lUQox5278000AA=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606152804;
 bh=0AbL10A89UGok3zynnQabMzZXUEYCHmnAZyaAo2h+2Y=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=EVAJQnEiWXeRsoRZWMvStwoelbSD4628CdbqYAdFczTs8pds2FUVL3QWxxH+aux7ud4
 Qqn3X9MbTOsoOcmUJd8K0U5xHzDIOUEb1agLPeKQlFFC3EeO//cicuFLsIrR4FTH8+5KD
 StLu/zTYwGls9218RclgXlPLjPl0VUE3gFw=

On Mon, Nov 23, 2020 at 05:06:31PM +0000, Paoloni, Gabriele wrote:
> From my understanding no_way_out and kill_it are different in principles:
> no_way_out is telling that an error occurred 'somewhere' in some CPU bank
> that requires the system to panic (e.g. PCC=1); kill_it is saying that the execution
> cannot be restarted where it left for the local CPU and hence we need to find
> an alternative solution as part of the recovery action. In practice it seems to
> me that kill_it is used to replace kill_me_maybe with kill_me_now in case
> the exception happened in user mode.

Bah, I got confused, sorry about that - you're right.

Btw, that kill_it should probably be called "kill_current_task" or so to
make it more clear.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#194): https://lists.elisa.tech/g/linux-safety/message/194
Mute This Topic: https://lists.elisa.tech/mt/78342502/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


