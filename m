Return-Path: <SRS0=IT1S=E5=lists.elisa.tech=bounce+72012+189+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE63C63798
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 14:51:17 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5F220773
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 14:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="N9r3+Q6l"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+189+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id so0yYY5279335xT1joJh2JVQ; Mon, 23 Nov 2020 06:51:15 -0800
X-Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web08.36212.1606143074728574046
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 06:51:15 -0800
X-Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1khDBN-0001yu-Fh; Mon, 23 Nov 2020 14:51:09 +0000
Subject: Re: [linux-safety] [PATCH] PCI: tegra: Use PTR_ERR_OR_ZERO
To: Thierry Reding <thierry.reding@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-safety@lists.elisa.tech, linux-tegra@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20201116165407.8050-1-sudipm.mukherjee@gmail.com>
 <20201116170137.GA2587640@ulmo>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <0ef6fc37-4e91-68a1-0744-90b4093ce5ba@codethink.co.uk>
Date: Mon, 23 Nov 2020 14:51:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201116170137.GA2587640@ulmo>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: IrvCqanG5GNTlhJE43hsOLi3x5278000AA=
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606143075;
 bh=VPDAx2dSiEEdEReLqNSn+kjmZDkABSuNE+quNGIB5eg=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=N9r3+Q6lFnC0fn41txsmLUz4jC8xAvxJMGXu9VQN3r50MFPDX3L3J2OFKTgmQ3ZTsu2
 4O6KXUGM0BnHQs5RocmTdQTbXRKaDoq6e6hynJIZgVukTgNEXRgpmHnMA0L/7lZUNb+47
 7l9G+0kJXwES2gXONBmFIqo4XxV28EuwD4M=


On 16/11/2020 17:01, Thierry Reding wrote:
> On Mon, Nov 16, 2020 at 04:54:07PM +0000, Sudip Mukherjee wrote:
>> Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
>> we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
>> doing 'return 0'.
>>
>> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> This has been proposed multiple times in the past and Bjorn and I have
> agreed every time that this is not an improvement, so sorry, but NAK.

Thanks Thierry and Neil. I have now added a blacklist script in our CI
so "PTR_ERR_OR_ZERO" will not be flagged for anything in drivers/pci/*
anymore in our testing.



-- 
Regards
Sudip


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#189): https://lists.elisa.tech/g/linux-safety/message/189
Mute This Topic: https://lists.elisa.tech/mt/78296400/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


