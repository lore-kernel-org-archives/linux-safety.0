Return-Path: <SRS0=PK9A=E6=lists.elisa.tech=bounce+72012+197+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431E5C56201
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 10:32:29 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E7B206D4
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 10:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="Db1dpwLA"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+197+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id ucguYY5279335xzMYCH9iBCb; Tue, 24 Nov 2020 02:32:27 -0800
X-Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web11.50487.1606213946673202380
 for <linux-safety@lists.elisa.tech>;
 Tue, 24 Nov 2020 02:32:27 -0800
X-Received: from [2.127.6.98] (helo=[192.168.0.17])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1khVcU-0003bB-2Y; Tue, 24 Nov 2020 10:32:22 +0000
Subject: Re: [linux-safety] [PATCH 2/2] staging: vt6655: Correct wrappping in rxtx.c
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-safety@lists.elisa.tech
References: <1606132778-34209-1-git-send-email-milan.lakhani@codethink.co.uk>
 <1606132778-34209-2-git-send-email-milan.lakhani@codethink.co.uk>
 <CAKXUXMym-YfjQdDx7DcW8VHZH2bV5DbO6t0EgzmqD5hDe1AOZA@mail.gmail.com>
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
Message-ID: <e215f254-dd97-105c-fe2d-0ec786ea50ef@codethink.co.uk>
Date: Tue, 24 Nov 2020 10:32:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMym-YfjQdDx7DcW8VHZH2bV5DbO6t0EgzmqD5hDe1AOZA@mail.gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 1q41yOziCTUmUKgFdeEBjBc9x5278000AA=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606213947;
 bh=vP7Vq0y2V5eoVtxaI/Suwkps0xzmAQ/JnScdkYtPt5E=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=Db1dpwLA5TLDnKPw2eWChb+V9r1J73dzWT7LhU4M2+QZFH6SWsJOaOAkG3nm1VyMWf7
 T45bB4Dhy3XAUcFunkYjsoNHV2HhRQgbDKfdUIlU5zTgIZ5H/5IiXLkZ4oUuVP1sb2+A8
 RMbG3rNXZxZvWFKQeHMQf766X/BqVAJq1vs=

Hi Lukas,

On 23/11/2020 13:17, Lukas Bulwahn wrote:

> On Mon, Nov 23, 2020 at 12:59 PM Milan Lakhani
> <milan.lakhani@codethink.co.uk> wrote:
>> Correct line length and alignment in rxtx.c. Reported by checkpatch.
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Forest Bond <forest@alittletooquiet.net>
>> CC: linux-kernel@vger.kernel.org
>> CC: linux-safety@lists.elisa.tech
> Milan, I am wondering where you picked up this convention to add these
> Cc: and CC: tags in your patch?
>
> Is there some documentation that points out to do that? (That might
> need to be fixed...)
>
> Did you observe that on some other commits? I think these tags are
> added by some maintainers (probably tool-supported) when they pick the
> patches, not by the authors, though.

I'm using git send-email to send patches and, as described in the 
'Sending patches with git send-email' section on 
https://kernelnewbies.org/FirstKernelPatch, git-send-email automatically 
Ccs people with the the Cc and CC tags. I did see this in other commits 
too, maybe they're used by the authors to pick out the maintainers to 
send the patches to?

>
>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
>> ---
>>   drivers/staging/vt6655/rxtx.c | 63 +++++++++++++++++++++++++++++++++----------
>>   1 file changed, 49 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
>> index 508e1bd..4073c33 100644
>> --- a/drivers/staging/vt6655/rxtx.c
>> +++ b/drivers/staging/vt6655/rxtx.c
>> @@ -492,14 +492,29 @@ s_uFillDataHead(
>>                                    pDevice->byTopCCKBasicRate,
>>                                    PK_TYPE_11B, &buf->b);
>>                  /* Get Duration and TimeStamp */
>> -               buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
>> -                                                                     wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
>> -               buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength, PK_TYPE_11B,
>> -                                                                      pDevice->byTopCCKBasicRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
>> -               buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
>> -                                                                         wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
>> -               buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
>> -                                                                        wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
>> +               buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
>> +                                                                     cbFrameLength, byPktType,
>> +                                                                     wCurrentRate, bNeedAck,
>> +                                                                     uFragIdx, cbLastFragmentSize,
>> +                                                                     uMACfragNum, byFBOption));
>> +               buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B,
>> +                                                                     cbFrameLength, PK_TYPE_11B,
>> +                                                                     pDevice->byTopCCKBasicRate,
>> +                                                                     bNeedAck, uFragIdx,
>> +                                                                     cbLastFragmentSize,
>> +                                                                     uMACfragNum, byFBOption));
>> +               buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0,
>> +                                                                        cbFrameLength, byPktType,
>> +                                                                        wCurrentRate, bNeedAck,
>> +                                                                        uFragIdx,
>> +                                                                        cbLastFragmentSize,
>> +                                                                        uMACfragNum, byFBOption));
>> +               buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1,
>> +                                                                        cbFrameLength, byPktType,
>> +                                                                        wCurrentRate, bNeedAck,
>> +                                                                        uFragIdx,
>> +                                                                        cbLastFragmentSize,
>> +                                                                        uMACfragNum, byFBOption));
>>
> Now to this change... it seems reasonable to refactor this into a
> dedicated function or macro because this is largely "copy-and-paste"
> calls with slight variable on a single argument.
>
> How about proposing such a change instead?
Thanks, good idea, I have made a macro for it and am about to send the 
patch, it would be good to hear if it is what you were envisaging.
>>                  buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
>>                  buf->time_stamp_off_b = vnt_time_stamp_off(pDevice, pDevice->byTopCCKBasicRate);
>> @@ -517,12 +532,32 @@ s_uFillDataHead(
>>                                            byPktType, &buf->a);
>>
>>                          /* Get Duration and TimeStampOff */
>> -                       buf->duration = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
>> -                                                                           wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
>> -                       buf->duration_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
>> -                                                                              wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
>> -                       buf->duration_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
>> -                                                                               wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
>> +                       buf->duration = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
>> +                                                                           cbFrameLength,
>> +                                                                           byPktType,
>> +                                                                           wCurrentRate, bNeedAck,
>> +                                                                           uFragIdx,
>> +                                                                           cbLastFragmentSize,
>> +                                                                           uMACfragNum,
>> +                                                                           byFBOption));
>> +                       buf->duration_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice,
>> +                                                                              DATADUR_A_F0,
>> +                                                                              cbFrameLength,
>> +                                                                              byPktType,
>> +                                                                              wCurrentRate,
>> +                                                                              bNeedAck, uFragIdx,
>> +                                                                              cbLastFragmentSize,
>> +                                                                              uMACfragNum,
>> +                                                                              byFBOption));
>> +                       buf->duration_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice,
>> +                                                                              DATADUR_A_F1,
>> +                                                                              cbFrameLength,
>> +                                                                              byPktType,
>> +                                                                              wCurrentRate,
>> +                                                                              bNeedAck, uFragIdx,
>> +                                                                              cbLastFragmentSize,
>> +                                                                              uMACfragNum,
>> +                                                                              byFBOption));
>>                          buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
>>                          return buf->duration;
>>                  }
>> --
>> 2.7.4
>>
>>
>>
>> 
>>
>>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#197): https://lists.elisa.tech/g/linux-safety/message/197
Mute This Topic: https://lists.elisa.tech/mt/78451464/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


