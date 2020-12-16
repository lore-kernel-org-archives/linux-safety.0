Return-Path: <SRS0=7Ozj=FU=lists.elisa.tech=bounce+72012+227+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5885C4361B
	for <linux-safety@archiver.kernel.org>; Wed, 16 Dec 2020 16:30:51 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B34233E2
	for <linux-safety@archiver.kernel.org>; Wed, 16 Dec 2020 16:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+227+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id 81RxYY5279335x24w0I1koci; Wed, 16 Dec 2020 08:30:50 -0800
X-Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web11.10747.1608136249984822109
 for <linux-safety@lists.elisa.tech>;
 Wed, 16 Dec 2020 08:30:50 -0800
X-Received: from host-92-5-250-55.as43234.net ([92.5.250.55] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kpZhO-00018n-P0; Wed, 16 Dec 2020 16:30:46 +0000
Subject: Re: [linux-safety] E-mail addresses for kernel contributors to send patches to
To: Milan Lakhani <milan.lakhani@codethink.co.uk>,
 linux-safety@lists.elisa.tech
References: <1608061835-5118-1-git-send-email-milan.lakhani@codethink.co.uk>
 <20201215201639.cuq7xtyanbk6bxan@debian>
 <3ab65bf4-6bb8-82a0-572b-cd44fefbaae7@codethink.co.uk>
 <05356dac-c547-e71c-7ec4-f474d5ad655e@codethink.co.uk>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <43a21360-7869-fa66-9895-91f8d3118ca9@codethink.co.uk>
Date: Wed, 16 Dec 2020 16:30:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <05356dac-c547-e71c-7ec4-f474d5ad655e@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: asdxQQIAFT0DCzocEOlib5CXx5278000AA=
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608136250;
 bh=Vxw8rbwnD3IpQrAJDS3/4wrF1yaUEdVuV5fLHGE2z90=;
 h=Content-Type:Date:From:Subject:To;
 b=jZxu9eaATdgm9AkzEMDu1ch9xXeiq+hR/BcVEt6MOgdLrApxxxF9u24rt+Eo1qZCjvq
 MzoG2FmnbGRf/s3zJ1vU36uFvADioB7ZzpEpX1iCnUhtIGCBy8wzQUe0BoKsTjLGpgjPy
 ADGx1vYGyF0abmLt3pNoHSHKFZ9wusIkEz4=

Hi Milan,

On 16/12/2020 16:16, Milan Lakhani wrote:
> Hi,
> 
> I made the below changes and sent the documentation patch version 2,
> 

<snip>

> 
> For driver patches I'll also include devel@driverdev.osuosl.org and Greg
> gregkh@linuxfoundation.org, while for a documentation patch I'll include
> the linux-doc@vger.kernel.org list.

Not for all the drivers. Like any patch to drivers in
'drivers/watchdog/' does not need GregKH or devel@driverdev.osuosl.org.



-- 
Regards
Sudip


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#227): https://lists.elisa.tech/g/linux-safety/message/227
Mute This Topic: https://lists.elisa.tech/mt/79004338/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


