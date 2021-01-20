Return-Path: <SRS0=K3oi=GX=lists.elisa.tech=bounce+72012+237+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25D9C433E0
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 14:46:17 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1E52336E
	for <linux-safety@archiver.kernel.org>; Wed, 20 Jan 2021 14:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+237+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id xzAhYY5279335xUYgLvLM4Z2; Wed, 20 Jan 2021 06:46:16 -0800
X-Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web11.28552.1611153975603260843
 for <linux-safety@lists.elisa.tech>;
 Wed, 20 Jan 2021 06:46:16 -0800
X-Received: from [90.222.153.26] (helo=[192.168.0.21])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1l2EkJ-0007l1-NJ; Wed, 20 Jan 2021 14:46:07 +0000
Subject: Re: [linux-safety] [PATCH] docs: Change reference that was to removed file
To: Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, sudip.mukherjee@codethink.co.uk,
 linux-safety@lists.elisa.tech,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>
References: <1611051980-3834-1-git-send-email-milan.lakhani@codethink.co.uk>
 <87y2gopjcx.fsf@meer.lwn.net>
 <CAL_Jsq+YW2K8YoLes8EAUy1WrFRzpYvtzvErOYbhw3zvZBoddQ@mail.gmail.com>
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
Message-ID: <e8534aeb-3fbb-ef40-4c50-aa306fada4d3@codethink.co.uk>
Date: Wed, 20 Jan 2021 14:46:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+YW2K8YoLes8EAUy1WrFRzpYvtzvErOYbhw3zvZBoddQ@mail.gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: Ym3QMBhT3KTLSr0WYVy1s4IFx5278000AA=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1611153976;
 bh=fD1nL+on1PnJorTLJfrs+NuA1e2WEgb2AIkjDYRXGJ8=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=Z4pu8DsC07BDrAxqgQ9dMT3YRBvhNdnytok7AG1m/928e7UrzQLLw00ik4XJ+HAqkcb
 no/beZFW6Lh1SI0D5oam3ddKcipFKFOmBZTaAkW7L0dTjfAr0EBe0p70DnCNfDZES6NV/
 lQXMOjJAdXhB0b2YIBk5hFBy/PaBahTR81A=

Thanks Rob, Jon, I've submitted a new patch pointing the two broken 
links and also usage-model.rst all to 
https://www.devicetree.org.specifications/.

Milan

On 20/01/2021 01:07, Rob Herring wrote:
> On Tue, Jan 19, 2021 at 6:01 PM Jonathan Corbet <corbet@lwn.net> wrote:
>> Milan Lakhani <milan.lakhani@codethink.co.uk> writes:
>>
>> [CC += Rob]
>>
>>> There were two references to
>>> Documentation/devicetree/booting-without-of.rst for dtb format
>>> information. This file has been removed, so I have changed the links to
>>> Documentation/devicetree/usage-model.rst for this information, which
>>> itself points to https://elinux.org/Device_Tree_Usage for an overview of
>>> the device tree data format.
>>>
>>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
>>> ---
>>>   Documentation/arm/booting.rst                | 2 +-
>>>   Documentation/translations/zh_CN/arm/Booting | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/arm/booting.rst b/Documentation/arm/booting.rst
>>> index a226345..5392d01 100644
>>> --- a/Documentation/arm/booting.rst
>>> +++ b/Documentation/arm/booting.rst
>>> @@ -128,7 +128,7 @@ it.  The recommended placement is in the first 16KiB of RAM.
>>>
>>>   The boot loader must load a device tree image (dtb) into system ram
>>>   at a 64bit aligned address and initialize it with the boot data.  The
>>> -dtb format is documented in Documentation/devicetree/booting-without-of.rst.
>>> +dtb format is documented in Documentation/devicetree/usage-model.rst.
>> Except that ... usage-model.rst doesn't actually document the DTB
>> format.  Perhaps we should instead substitute a link that does what's
>> promised here?
> Yes, it's in the DT spec. I'd point to
> 'https://www.devicetree.org/specifications/' so it's always going to
> show the latest. And that's the link we have elsewhere in the kernel.
>
> usage-model.rst is also something needing updating...
>
> Rob
>
>
> 
>
>
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#237): https://lists.elisa.tech/g/linux-safety/message/237
Mute This Topic: https://lists.elisa.tech/mt/79948363/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


