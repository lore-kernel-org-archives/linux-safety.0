Return-Path: <SRS0=EOSg=FE=lists.elisa.tech=bounce+72012+215+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69449C63777
	for <linux-safety@archiver.kernel.org>; Mon, 30 Nov 2020 20:25:35 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6BB2074A
	for <linux-safety@archiver.kernel.org>; Mon, 30 Nov 2020 20:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="I/CLMwKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6BB2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+215+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id tMPiYY5279335xzVHUNgfJTa; Mon, 30 Nov 2020 12:25:33 -0800
X-Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web09.61877.1606751597936915065
 for <linux-safety@lists.elisa.tech>;
 Mon, 30 Nov 2020 07:53:18 -0800
X-Received: by mail-pl1-f193.google.com with SMTP id v21so6680579plo.12
        for <linux-safety@lists.elisa.tech>; Mon, 30 Nov 2020 07:53:17 -0800 (PST)
X-Gm-Message-State: LZ0gqmnJkdM2tklgVJe1aeHGx5278000AA=
X-Google-Smtp-Source: ABdhPJxiVoJPKZalI/tDDI2rv1drqlE/C7sDL3EpVHr85z2lOu1xRvzNmy67S8eDuDPPZFaAfWPoSQ==
X-Received: by 2002:a17:90a:4405:: with SMTP id s5mr26762160pjg.219.1606751597508;
        Mon, 30 Nov 2020 07:53:17 -0800 (PST)
X-Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id m11sm17625628pfa.24.2020.11.30.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 07:53:16 -0800 (PST)
Date: Tue, 1 Dec 2020 00:53:14 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] printk: remove obsolete dead assignment
Message-ID: <X8UVamNsa+8fwnAL@jagdpanzerIV.localdomain>
References: <20201130124915.7573-1-lukas.bulwahn@gmail.com>
 <X8URvRhAB2AE4DZT@alley>
MIME-Version: 1.0
In-Reply-To: <X8URvRhAB2AE4DZT@alley>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606767933;
 bh=QO69kSu6nz8o73q+Syinr9KBA1cSIgIgOkh6v4sW23s=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=I/CLMwKsroPSzrYrGrBfndNy1+KeyMhdYIBGH7hZPO4od06z/x9UuvQhBrulIvu3MFX
 qeGvURbR1JxW48d3KtRxmffIKtBl2Fj6y/K3ZN+BVk9IkS94gWdQ2MBLMuhC85ZfVKcDn
 FM1zc0J8dWe2qiku2lI49O8GIFKITY3YEZQ=

On (20/11/30 16:37), Petr Mladek wrote:
> On Mon 2020-11-30 13:49:15, Lukas Bulwahn wrote:
[..]
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index f279d4fbd9dd..6e4e38b7cd91 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -741,7 +741,6 @@ static ssize_t devkmsg_write(struct kiocb *iocb, struct iov_iter *from)
> >  			if (LOG_FACILITY(u) != 0)
> >  				facility = LOG_FACILITY(u);
> >  			endp++;
> > -			len -= endp - line;
> >  			line = endp;
> >  		}
> >  	}
> 
> Yup, it was used to write the trailing '\0'. But it is done earlier
> now. So, it is not longer needed.
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> Best Regards,
> Petr
> 
> PS: I'll give it few days just in case anyone else would want to
> review it. I'll push it then unless anyone complains.

FWIW, looks good to me
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#215): https://lists.elisa.tech/g/linux-safety/message/215
Mute This Topic: https://lists.elisa.tech/mt/78607109/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


