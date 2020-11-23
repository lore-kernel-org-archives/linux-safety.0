Return-Path: <SRS0=s83S=E5=lists.elisa.tech=bounce+72012+192+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BE4C63777
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 17:33:25 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 213A120702
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 17:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="PDENxaTC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 213A120702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+192+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id fYXRYY5279335xgLyAMwOOjo; Mon, 23 Nov 2020 09:33:24 -0800
X-Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mx.groups.io with SMTP id smtpd.web11.36111.1606141674575406891
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 06:27:55 -0800
X-Received: from zn.tnic (p200300ec2f0bbc0057986d054fc332b4.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:bc00:5798:6d05:4fc3:32b4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C848F1EC0489;
	Mon, 23 Nov 2020 15:27:51 +0100 (CET)
Date: Mon, 23 Nov 2020 15:27:46 +0100
From: Borislav Petkov <bp@alien8.de>
To: Gabriele Paoloni <gabriele.paoloni@intel.com>
Cc: tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com,
	x86@kernel.org, hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH 2/4] x86/mce: move the mce_panic() call and kill_it assignments at the right places
Message-ID: <20201123142746.GC15044@zn.tnic>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-3-gabriele.paoloni@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201118151552.1412-3-gabriele.paoloni@intel.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: HLndLRVYsRLj8EfZgR8rkZ1Ux5278000AA=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606152804;
 bh=RsuNbcUyWxL/Fq83W1fnOAM24UEseMNWErS6v6wg5z0=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=PDENxaTC4rQiV3IkE5v04WjW90Y9oNEsR747UVI4Zj812WXuP9hbYtnT4VAMFsuEQt1
 xd0NL4Z6TiKf0Inmr+uVNat9kCsQ2/QAMHj7bkkr5BNyj36lcAUYg0yC7bdkMEFYSnUAg
 0wjGxeuhcvkLJkLP3Y1A51yqslUb/vytzZI=

On Wed, Nov 18, 2020 at 03:15:50PM +0000, Gabriele Paoloni wrote:
> Right now for local MCEs we panic(),if needed, right after lmce is
> set. For global MCEs mce_reign() takes care of calling mce_panic().
> Hence this patch:
> - improves readibility by moving the conditional evaluation of
> tolerant up to when kill_it is set first
> - moves the mce_panic() call up into the statement where mce_end()
> fails

Pls avoid using "this patch does this and that" in the commit message
but say directly what it does:

- Improve readability ...

- Move mce_panic()...

and so on.

> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index b990892c6766..e025ff04438f 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -1350,8 +1350,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
>  	 * severity is MCE_AR_SEVERITY we have other options.
>  	 */
>  	if (!(m.mcgstatus & MCG_STATUS_RIPV))
> -		kill_it = 1;
> -
> +		kill_it = (cfg->tolerant == 3) ? 0 : 1;

So you just set kill_it using cfg->tolerant...

>  	/*
>  	 * Check if this MCE is signaled to only this logical processor,
>  	 * on Intel, Zhaoxin only.
> @@ -1384,8 +1383,15 @@ noinstr void do_machine_check(struct pt_regs *regs)
>  	 * When there's any problem use only local no_way_out state.
>  	 */
>  	if (!lmce) {
> -		if (mce_end(order) < 0)
> +		if (mce_end(order) < 0) {
>  			no_way_out = no_way_out ? no_way_out : worst >= MCE_PANIC_SEVERITY;
> +			/*
> +			 * mce_reign() has probably failed hence evaluate if we need
> +			 * to panic
> +			 */
> +			if (no_way_out && mca_cfg.tolerant < 3)

... but here you're testing cfg->tolerant again.

why not

			if (no_way_out && kill_it)

?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#192): https://lists.elisa.tech/g/linux-safety/message/192
Mute This Topic: https://lists.elisa.tech/mt/78342502/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


