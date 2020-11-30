Return-Path: <SRS0=Dvmz=FE=lists.elisa.tech=bounce+72012+214+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B3CC64E8A
	for <linux-safety@archiver.kernel.org>; Mon, 30 Nov 2020 20:25:35 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903C3207F7
	for <linux-safety@archiver.kernel.org>; Mon, 30 Nov 2020 20:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="U8PSKqGu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 903C3207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.elisa.tech
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+214+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id UmTvYY5279335xpd5HeDJZus; Mon, 30 Nov 2020 12:25:34 -0800
X-Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mx.groups.io with SMTP id smtpd.web11.61485.1606750657336225298
 for <linux-safety@lists.elisa.tech>;
 Mon, 30 Nov 2020 07:37:37 -0800
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
X-Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4CC7EADC5;
	Mon, 30 Nov 2020 15:37:34 +0000 (UTC)
Date: Mon, 30 Nov 2020 16:37:33 +0100
From: "Petr Mladek via lists.elisa.tech" <pmladek=suse.com@lists.elisa.tech>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] printk: remove obsolete dead assignment
Message-ID: <X8URvRhAB2AE4DZT@alley>
References: <20201130124915.7573-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201130124915.7573-1-lukas.bulwahn@gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
Reply-To: pmladek@suse.com
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: DVqSiSGOHpV6v2NH5BUOBzEfx5278000AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606767934;
 bh=2Cm1nY2BLpev1I8nkuCJ6MRo4XbbzEKAqU3kBuRpZWo=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=U8PSKqGuy7qwvmxwkK+kViOtv5vif33IHTAj3IvNG5+v8ciq2gXn7gye59a9RLYq/Ce
 UvzSAFxhyQZsfQWiBVdaRJj9LbVRCtvdLswYYofz68b6pSI77MHNongFYHhmkgD0PfCen
 o0ZVylvhxFbKXrldDbhwpmWUqAsXs89Myfs=

On Mon 2020-11-30 13:49:15, Lukas Bulwahn wrote:
> Commit 849f3127bb46 ("switch /dev/kmsg to ->write_iter()") refactored
> devkmsg_write() and left over a dead assignment on the variable 'len'.
> 
> Hence, make clang-analyzer warns:
> 
>   kernel/printk/printk.c:744:4: warning: Value stored to 'len' is never read
>     [clang-analyzer-deadcode.DeadStores]
>                           len -= endp - line;
>                           ^
> 
> Simply remove this obsolete dead assignment here.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20201130
> 
> Petr, please pick this minor non-urgent clean-up patch.
> 
>  kernel/printk/printk.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index f279d4fbd9dd..6e4e38b7cd91 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -741,7 +741,6 @@ static ssize_t devkmsg_write(struct kiocb *iocb, struct iov_iter *from)
>  			if (LOG_FACILITY(u) != 0)
>  				facility = LOG_FACILITY(u);
>  			endp++;
> -			len -= endp - line;
>  			line = endp;
>  		}
>  	}

Yup, it was used to write the trailing '\0'. But it is done earlier
now. So, it is not longer needed.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I'll give it few days just in case anyone else would want to
review it. I'll push it then unless anyone complains.


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#214): https://lists.elisa.tech/g/linux-safety/message/214
Mute This Topic: https://lists.elisa.tech/mt/78607109/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


