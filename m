Return-Path: <SRS0=WDQP=E2=lists.elisa.tech=bounce+72012+184+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFF5C2D0E4
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:58:20 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD742245B
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="BguFfyWD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AD742245B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+184+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id 980yYY5279335xxY3w0O23hG; Fri, 20 Nov 2020 09:58:18 -0800
X-Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mx.groups.io with SMTP id smtpd.web08.681.1605893545551401302
 for <linux-safety@lists.elisa.tech>;
 Fri, 20 Nov 2020 09:32:25 -0800
X-Received: from zn.tnic (p200300ec2f11ba0074b4ba83d21d5a9c.dip0.t-ipconnect.de [IPv6:2003:ec:2f11:ba00:74b4:ba83:d21d:5a9c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 745471EC047E;
	Fri, 20 Nov 2020 18:32:23 +0100 (CET)
Date: Fri, 20 Nov 2020 18:32:17 +0100
From: Borislav Petkov <bp@alien8.de>
To: Gabriele Paoloni <gabriele.paoloni@intel.com>
Cc: tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com,
	x86@kernel.org, hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH 1/4] x86/mce: do not overwrite no_way_out if mce_end() fails
Message-ID: <20201120173217.GE712@zn.tnic>
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
X-Gm-Message-State: fZhfToJhvTWvh0XJc9Sr47vZx5278000AA=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605895098;
 bh=pSWx5SqQ0QjuZNNQzbvngFdqCqrueT2dQVnuiR/BGdk=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=BguFfyWD6Nloe9VbBAzvTuMuOSYFONcqIJLBHWCqZ/ntM0G574cfL/b9z5F0kwsUhTo
 xZxC9AZEme214ZsDGxC/jDv5F8jmDJbf+pYGcMwMTT9BzUlfdFWJc4RlDLfqk38Bxlnlm
 MZhuId6gwKEny8G0i9qJmWNXtWkzH+zxWG0=

On Wed, Nov 18, 2020 at 03:15:49PM +0000, Gabriele Paoloni wrote:
> Currently if mce_end() fails no_way_out is set equal to worst.
> worst is the worst severirty that was found in the MCA banks
> associated to the current CPU; however at this point no_way_out
> could be already set by mca_start() by looking at all severities
> of all CPUs that entered the MCE handler.
> if mce_end() fails we first check if no_way_out is already set and
> if so we stick to it, otherwise we use the local worst value
> 
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Also, this very likely wants Cc: stable, I'd say, considering the
severity.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#184): https://lists.elisa.tech/g/linux-safety/message/184
Mute This Topic: https://lists.elisa.tech/mt/78342501/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


