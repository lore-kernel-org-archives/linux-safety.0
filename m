Return-Path: <SRS0=oL8a=FU=lists.elisa.tech=bounce+72012+225+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FEEC4361B
	for <linux-safety@archiver.kernel.org>; Wed, 16 Dec 2020 16:16:09 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36CE2335A
	for <linux-safety@archiver.kernel.org>; Wed, 16 Dec 2020 16:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+225+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id dRWiYY5279335xuD6mQNY5H6; Wed, 16 Dec 2020 08:16:08 -0800
X-Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web08.10627.1608135367537463854
 for <linux-safety@lists.elisa.tech>;
 Wed, 16 Dec 2020 08:16:07 -0800
X-Received: from 05446273.skybroadband.com ([5.68.98.115] helo=[192.168.0.21])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kpZTA-0001vA-Vz
	for <linux-safety@lists.elisa.tech> ; Wed, 16 Dec 2020 16:16:05 +0000
Subject: [linux-safety] E-mail addresses for kernel contributors to send patches to
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: linux-safety@lists.elisa.tech
References: <1608061835-5118-1-git-send-email-milan.lakhani@codethink.co.uk>
 <20201215201639.cuq7xtyanbk6bxan@debian>
 <3ab65bf4-6bb8-82a0-572b-cd44fefbaae7@codethink.co.uk>
Message-ID: <05356dac-c547-e71c-7ec4-f474d5ad655e@codethink.co.uk>
Date: Wed, 16 Dec 2020 16:16:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ab65bf4-6bb8-82a0-572b-cd44fefbaae7@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: alBfUiv1WNcmAJo8yninNcK5x5278000AA=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608135368;
 bh=loTfymkDj4hjtgYB8vpNOkEZfSFfycOxlCY+MHR7VZI=;
 h=Content-Type:Date:From:Subject:To;
 b=tsIDLu8XsAJR0gVNGZbEV8HlyXZ7dJ3I3QHVT38lcTf+CN9qbKJjgalCoyR4lSZOLTw
 fGXq7NfbyFA8hrbp4sYCi6zrB3j4QIbtiCOCVqtl+K5FNI1a/h3abD2TtU46PxnZuYaIq
 Ve298LotNMZD/dXKEXWaJ91Bep2Ms5iByHQ=

Hi,

I made the below changes and sent the documentation patch version 2,

In case there are any other new contributors wondering the best place to 
send their kernel patches, I now send mine to:

kernel@vger.kernel.org (Kernel mailing list)
linux-safety@lists.elisa.tech (ELISA safety list)
The maintainers (obtained by running 'git show HEAD | perl 
scripts/get_maintainer.pl --separator , --nokeywords --nogit 
--nogit-fallback --norolestats --nol' if the HEAD commit is the patch)

For driver patches I'll also include devel@driverdev.osuosl.org and Greg 
gregkh@linuxfoundation.org, while for a documentation patch I'll include 
the linux-doc@vger.kernel.org list.

Milan

On 15/12/2020 20:32, Milan Lakhani wrote:
> Hi Sudip,
>
> On 15/12/2020 20:16, Sudip Mukherjee wrote:
>> Hi Milan,
>>
>> On Tue, Dec 15, 2020 at 07:50:35PM +0000, Milan Lakhani wrote:
>>> Renumber the steps in submit-checklist.rst as some numbers were 
>>> skipped.
>>>
>>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
>> Maybe you can also add:
>> Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")
> Will add this :)
>>
>> But I am confused about why you have added Greg and staging list instead
>> of 'linux-doc@vger.kernel.org'.
>
> I was a bit unsure since the whole repository is called staging so I 
> was thinking these different folders may use the same lists and didn't 
> pay attention that the staging list had the word 'drivers', I'm clear 
> on the different lists now though. I'll change the drivers list for 
> the one you mention there.
>
> Thanks,
> Milan
>
>>
>> -- 
>> Regards
>> Sudip
>>
>>
>> 
>>
>>
>>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#225): https://lists.elisa.tech/g/linux-safety/message/225
Mute This Topic: https://lists.elisa.tech/mt/79004338/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


