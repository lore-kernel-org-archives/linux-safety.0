Return-Path: <SRS0=Go1O=FT=lists.elisa.tech=bounce+72012+223+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DBDC4361B
	for <linux-safety@archiver.kernel.org>; Tue, 15 Dec 2020 20:33:03 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E15122573
	for <linux-safety@archiver.kernel.org>; Tue, 15 Dec 2020 20:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+223+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id 0LaYYY5279335xLbgNaLtNg1; Tue, 15 Dec 2020 12:33:03 -0800
X-Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web09.2287.1608064382435017918
 for <linux-safety@lists.elisa.tech>;
 Tue, 15 Dec 2020 12:33:02 -0800
X-Received: from 05446273.skybroadband.com ([5.68.98.115] helo=[192.168.0.21])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kpH0F-0005oH-Dv
	for <linux-safety@lists.elisa.tech> ; Tue, 15 Dec 2020 20:32:59 +0000
Subject: Re: [linux-safety] [PATCH] Documentation: process: Correct numbering
To: linux-safety@lists.elisa.tech
References: <1608061835-5118-1-git-send-email-milan.lakhani@codethink.co.uk>
 <20201215201639.cuq7xtyanbk6bxan@debian>
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
Message-ID: <3ab65bf4-6bb8-82a0-572b-cd44fefbaae7@codethink.co.uk>
Date: Tue, 15 Dec 2020 20:32:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215201639.cuq7xtyanbk6bxan@debian>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: XPsZCl2zH8NdO0J8OaJrEU30x5278000AA=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608064383;
 bh=UdOelT41C5Ui1Df6jaWbhM/Qs4X3k9jIPPqTE8o4mS8=;
 h=Content-Type:Date:From:Subject:To;
 b=OMyQcIIL3IH+SgvE+/m3MkfCaQvPGjGqwS1yZdycyR98368V3r5eiNk5714tB28Zdaq
 8IOHk8tkNZJ4NJ43LgiGtID2BTJ9sAczjS069drlB4xv6YVgFsZr/ENMvMILvfjGHEWY7
 Z6opP3BjgNuhVmGj6aPscuQVZ63DfR4nSp8=

Hi Sudip,

On 15/12/2020 20:16, Sudip Mukherjee wrote:
> Hi Milan,
>
> On Tue, Dec 15, 2020 at 07:50:35PM +0000, Milan Lakhani wrote:
>> Renumber the steps in submit-checklist.rst as some numbers were skipped.
>>
>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> Maybe you can also add:
> Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")
Will add this :)
>
> But I am confused about why you have added Greg and staging list instead
> of 'linux-doc@vger.kernel.org'.

I was a bit unsure since the whole repository is called staging so I was 
thinking these different folders may use the same lists and didn't pay 
attention that the staging list had the word 'drivers', I'm clear on the 
different lists now though. I'll change the drivers list for the one you 
mention there.

Thanks,
Milan

>
> --
> Regards
> Sudip
>
>
> 
>
>
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#223): https://lists.elisa.tech/g/linux-safety/message/223
Mute This Topic: https://lists.elisa.tech/mt/78984776/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


