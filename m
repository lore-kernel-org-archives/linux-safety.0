Return-Path: <SRS0=priq=E2=lists.elisa.tech=bounce+72012+183+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E879BC56201
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:58:19 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E06A2242B
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="NulGBGtr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E06A2242B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+183+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id SmovYY5279335xAJhWXS7VDX; Fri, 20 Nov 2020 09:58:18 -0800
X-Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mx.groups.io with SMTP id smtpd.web10.337.1605892067593755710
 for <linux-safety@lists.elisa.tech>;
 Fri, 20 Nov 2020 09:07:48 -0800
X-Received: from zn.tnic (p200300ec2f11ba0074b4ba83d21d5a9c.dip0.t-ipconnect.de [IPv6:2003:ec:2f11:ba00:74b4:ba83:d21d:5a9c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 09FA01EC047E;
	Fri, 20 Nov 2020 18:07:45 +0100 (CET)
Date: Fri, 20 Nov 2020 18:07:37 +0100
From: Borislav Petkov <bp@alien8.de>
To: Gabriele Paoloni <gabriele.paoloni@intel.com>
Cc: tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com,
	x86@kernel.org, hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH 1/4] x86/mce: do not overwrite no_way_out if mce_end() fails
Message-ID: <20201120170737.GD712@zn.tnic>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-2-gabriele.paoloni@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201118151552.1412-2-gabriele.paoloni@intel.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: ZpOYfhMBF0Msf39POMy7bpT0x5278000AA=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605895098;
 bh=ESYG0DX3mqyVh1Gold1uAcAoEdPsuoqPgHmImmceQMY=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=NulGBGtrwG1cDFDL9UONnPO5Oa7id6n4LzH4HZAN/2mLWqwp/5Lp7YQkeJdS9jXGHKx
 CXs8eXYHM4UX1GPRv3HXFi/3Ik1NMGVgLhu/HSdq1dOHGuUTb+Oi9HyBF4W2XNDiBUhuj
 ARNus5WFMb2iCSWgzDMAINwyiCMZjyQI904=

On Wed, Nov 18, 2020 at 03:15:49PM +0000, Gabriele Paoloni wrote:
> Currently if mce_end() fails no_way_out is set equal to worst.
> worst is the worst severirty that was found in the MCA banks
		     ^^^^^^^^^

Please introduce a spellchecker into your patch creation workflow.

> associated to the current CPU; however at this point no_way_out
	     ^
	     with


> could be already set by mca_start() by looking at all severities

I think you mean "could have been already set" here

> of all CPUs that entered the MCE handler.
> if mce_end() fails we first check if no_way_out is already set and

Please use passive voice in your commit message: no "we" or "I", etc.

Also, pls start new sentences with a capital letter and end them with a
fullstop.

> if so we stick to it, otherwise we use the local worst value

So basically you're trying to say here that no_way_out might have been
already set and other CPUs could overwrite it and that should not
happen.

Is that what you mean?

> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 4102b866e7c0..b990892c6766 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -1385,7 +1385,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
>  	 */
>  	if (!lmce) {
>  		if (mce_end(order) < 0)
> -			no_way_out = worst >= MCE_PANIC_SEVERITY;
> +			no_way_out = no_way_out ? no_way_out : worst >= MCE_PANIC_SEVERITY;

I had to stare at this a bit to figure out what you're doing. So how
about simplifying this:

			if (!no_way_out)
				no_way_out = worst >= MCE_PANIC_SEVERITY;

?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#183): https://lists.elisa.tech/g/linux-safety/message/183
Mute This Topic: https://lists.elisa.tech/mt/78342501/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


