Return-Path: <SRS0=tmfB=FO=lists.elisa.tech=bounce+72012+220+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3980C433FE
	for <linux-safety@archiver.kernel.org>; Thu, 10 Dec 2020 11:29:19 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BEC23C8D
	for <linux-safety@archiver.kernel.org>; Thu, 10 Dec 2020 11:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+220+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id wgzIYY5279335xwPV9ClqFZY; Thu, 10 Dec 2020 03:29:18 -0800
X-Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web08.11610.1607599757888924469
 for <linux-safety@lists.elisa.tech>;
 Thu, 10 Dec 2020 03:29:18 -0800
X-Received: from 05446273.skybroadband.com ([5.68.98.115] helo=[192.168.0.21])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1knK8I-0000bj-8C; Thu, 10 Dec 2020 11:29:14 +0000
Subject: Re: [linux-safety] [PATCH] kernel: trace: Remove deadstore in trace_uprobe.c
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-safety@lists.elisa.tech
References: <1607519814-86271-1-git-send-email-milan.lakhani@codethink.co.uk>
 <CAKXUXMzTpOT3MJLkmjR_Hpak8K5a7GQ-vTtNp0GbNarD6NG1FA@mail.gmail.com>
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
Message-ID: <ee9d9a8c-53de-01d2-7489-6f650857013b@codethink.co.uk>
Date: Thu, 10 Dec 2020 11:29:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzTpOT3MJLkmjR_Hpak8K5a7GQ-vTtNp0GbNarD6NG1FA@mail.gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: SmjXAsY95pSeI7Az8Iey8f3vx5278000AA=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1607599758;
 bh=dYBTgz8OHWT9YG84YT0xSRR77sgKkZRa8B/TDXBJ7ZA=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=nhiVE2V1I6pWPwvKxiBZTlh8b/tXEesvKpJw1oL5kgGNLRCTmlwtOCCdL3syGMbHodT
 jF+ZRltAOcPqMKYMOH/yqQHpbhmCrsyQpx0a1gyAsg1/+/2V6hyvTKL+LU//drmjwEP8J
 PqrIquulM9CZ/PW6Kzt2MFVmotVKHoLi1r0=


On 10/12/2020 05:47, Lukas Bulwahn wrote:
> On Wed, Dec 9, 2020 at 2:17 PM Milan Lakhani
> <milan.lakhani@codethink.co.uk> wrote:
>> In trace_uprobe.c, trace_uprobe_create assigns ret to 0 but then never
>> uses this value.
>>
> Milan, the patch makes sense, but I fear you did not run
> ./scripts/get_maintainers.pl because you did not include any specific
> maintainer as recipient.

So I did actually run get_maintainers.pl but somehow in my text editor 
where I had pasted the e-mail addresses they had got onto two separate 
lines, and git send-email must have only taken the first line. I'll have 
to get the e-mails right first time next time, to move onto checking 
documentation!

> The patch subject could be: remove unneeded initialization (instead of
> the very generic "dead store" term).
Updated this, thanks
>
> It is also interesting to see who added this initialization; was it
> unneeded since the existence of this function, did it become obsolete
> at some point in time due to refactoring?

The line was unneeded since the function was created in 2012 by Srikar 
Dronamraju in f3f096cfe, there have actually somehow been six commits to 
the lines between the initial assignment and reassignment of ret but 
they have all left the unnecessary initialization there!

>
> Run ./scripts/get_maintainers.pl  and please CC: me; then you will get
> your Reviewed-by: tag.
>
> Lukas
>
>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
>> ---
>>   kernel/trace/trace_uprobe.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
>> index 3cf7128..c7c7070 100644
>> --- a/kernel/trace/trace_uprobe.c
>> +++ b/kernel/trace/trace_uprobe.c
>> @@ -541,7 +541,6 @@ static int trace_uprobe_create(int argc, const char **argv)
>>          bool is_return = false;
>>          int i, ret;
>>
>> -       ret = 0;
>>          ref_ctr_offset = 0;
>>
>>          switch (argv[0][0]) {
>> --
>> 2.7.4
>>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#220): https://lists.elisa.tech/g/linux-safety/message/220
Mute This Topic: https://lists.elisa.tech/mt/78828451/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


