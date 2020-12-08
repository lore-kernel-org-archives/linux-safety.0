Return-Path: <SRS0=4xnZ=FM=lists.elisa.tech=bounce+72012+216+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22C6C433FE
	for <linux-safety@archiver.kernel.org>; Tue,  8 Dec 2020 16:14:18 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDABA20780
	for <linux-safety@archiver.kernel.org>; Tue,  8 Dec 2020 16:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDABA20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.elisa.tech
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+216+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id s2mzYY5279335xPjmlxJev8J; Tue, 08 Dec 2020 08:14:17 -0800
X-Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mx.groups.io with SMTP id smtpd.web08.10641.1607443234520582833
 for <linux-safety@lists.elisa.tech>;
 Tue, 08 Dec 2020 08:00:34 -0800
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
X-Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 75023AD6B;
	Tue,  8 Dec 2020 16:00:32 +0000 (UTC)
Date: Tue, 8 Dec 2020 17:00:31 +0100
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
Message-ID: <X8+jHx7sRlroUM8u@alley>
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
X-Gm-Message-State: i0dw8S2aNIvCCyseA7xfnhKvx5278000AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1607444057;
 bh=M6oI9NgPfNsM1DdDwYpFvmASVMSVTggPJQMs04HJpU8=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=LP8mPxt3SrcmK7ePBEjT6D9Kj8PNYWh8/XvSum6d9TSRXOkUst5ldke/HCGPxBOxy8t
 dewLyjI3bXWLg8/jrVH2wCjB5pH/ZXalgCdmD1yRrGpwprzwXpxGAiCOiDqGUPtdTid/o
 L8gq8MP/Tw0En+51ChO6QrZEOfMx8QoFTzI=

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

The patch is committed in printk/linux.git, branch for-5.11.

Best Regards,
Petr


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#216): https://lists.elisa.tech/g/linux-safety/message/216
Mute This Topic: https://lists.elisa.tech/mt/78607109/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


