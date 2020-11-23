Return-Path: <SRS0=m7nA=E5=lists.elisa.tech=bounce+72012+188+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8491C8300B
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 13:18:06 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDDE920782
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 13:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="u/Wsz2Cd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDDE920782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+188+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id GkdoYY5279335xtDPqwcdNCW; Mon, 23 Nov 2020 05:18:05 -0800
X-Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web08.34988.1606137484631999977
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 05:18:04 -0800
X-Received: by mail-il1-f194.google.com with SMTP id w8so15791452ilg.12
        for <linux-safety@lists.elisa.tech>; Mon, 23 Nov 2020 05:18:04 -0800 (PST)
X-Gm-Message-State: XZg1Uge85t2KsjGSgeG0x7XRx5278000AA=
X-Google-Smtp-Source: ABdhPJxXoezB+bkDkzia7wlIU0nZt5UFiPhVO71wV9dUFAMWOoazYxY2NqTLV22fb9SH5g7wxER3XHHBGFolzMtfa0s=
X-Received: by 2002:a92:600e:: with SMTP id u14mr33590848ilb.221.1606137483984;
 Mon, 23 Nov 2020 05:18:03 -0800 (PST)
MIME-Version: 1.0
References: <1606132778-34209-1-git-send-email-milan.lakhani@codethink.co.uk> <1606132778-34209-2-git-send-email-milan.lakhani@codethink.co.uk>
In-Reply-To: <1606132778-34209-2-git-send-email-milan.lakhani@codethink.co.uk>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 14:17:53 +0100
Message-ID: <CAKXUXMym-YfjQdDx7DcW8VHZH2bV5DbO6t0EgzmqD5hDe1AOZA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH 2/2] staging: vt6655: Correct wrappping in rxtx.c
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: forest@alittletooquiet.net, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606137485;
 bh=SroJBxMeBKjRvVLcYrbWrg1zL+EPhVbPZjMly60+NNY=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=u/Wsz2Cd6gU/yLC+jpvSDpownbmeJ9Qg2X/lCChQu0Kw1eIr1uJWZVUKogZn9FpYCTf
 lGy84WUTmzvSAFVDGTGoL2dB5VNiHBpRkS+mtu5PjX1cfZf3LANnWUxmsQi0bJCSkO9OZ
 nqVC8m4eJOOxqrLlK/1qaUcRFOUtRFkLVDA=

On Mon, Nov 23, 2020 at 12:59 PM Milan Lakhani
<milan.lakhani@codethink.co.uk> wrote:
>
> Correct line length and alignment in rxtx.c. Reported by checkpatch.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Forest Bond <forest@alittletooquiet.net>
> CC: linux-kernel@vger.kernel.org
> CC: linux-safety@lists.elisa.tech

Milan, I am wondering where you picked up this convention to add these
Cc: and CC: tags in your patch?

Is there some documentation that points out to do that? (That might
need to be fixed...)

Did you observe that on some other commits? I think these tags are
added by some maintainers (probably tool-supported) when they pick the
patches, not by the authors, though.

> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  drivers/staging/vt6655/rxtx.c | 63 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 508e1bd..4073c33 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -492,14 +492,29 @@ s_uFillDataHead(
>                                   pDevice->byTopCCKBasicRate,
>                                   PK_TYPE_11B, &buf->b);
>                 /* Get Duration and TimeStamp */
> -               buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
> -                                                                     wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> -               buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength, PK_TYPE_11B,
> -                                                                      pDevice->byTopCCKBasicRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> -               buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
> -                                                                         wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> -               buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
> -                                                                        wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> +               buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
> +                                                                     cbFrameLength, byPktType,
> +                                                                     wCurrentRate, bNeedAck,
> +                                                                     uFragIdx, cbLastFragmentSize,
> +                                                                     uMACfragNum, byFBOption));
> +               buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B,
> +                                                                     cbFrameLength, PK_TYPE_11B,
> +                                                                     pDevice->byTopCCKBasicRate,
> +                                                                     bNeedAck, uFragIdx,
> +                                                                     cbLastFragmentSize,
> +                                                                     uMACfragNum, byFBOption));
> +               buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0,
> +                                                                        cbFrameLength, byPktType,
> +                                                                        wCurrentRate, bNeedAck,
> +                                                                        uFragIdx,
> +                                                                        cbLastFragmentSize,
> +                                                                        uMACfragNum, byFBOption));
> +               buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1,
> +                                                                        cbFrameLength, byPktType,
> +                                                                        wCurrentRate, bNeedAck,
> +                                                                        uFragIdx,
> +                                                                        cbLastFragmentSize,
> +                                                                        uMACfragNum, byFBOption));
>

Now to this change... it seems reasonable to refactor this into a
dedicated function or macro because this is largely "copy-and-paste"
calls with slight variable on a single argument.

How about proposing such a change instead?

>                 buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
>                 buf->time_stamp_off_b = vnt_time_stamp_off(pDevice, pDevice->byTopCCKBasicRate);
> @@ -517,12 +532,32 @@ s_uFillDataHead(
>                                           byPktType, &buf->a);
>
>                         /* Get Duration and TimeStampOff */
> -                       buf->duration = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
> -                                                                           wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> -                       buf->duration_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
> -                                                                              wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> -                       buf->duration_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
> -                                                                               wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> +                       buf->duration = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
> +                                                                           cbFrameLength,
> +                                                                           byPktType,
> +                                                                           wCurrentRate, bNeedAck,
> +                                                                           uFragIdx,
> +                                                                           cbLastFragmentSize,
> +                                                                           uMACfragNum,
> +                                                                           byFBOption));
> +                       buf->duration_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice,
> +                                                                              DATADUR_A_F0,
> +                                                                              cbFrameLength,
> +                                                                              byPktType,
> +                                                                              wCurrentRate,
> +                                                                              bNeedAck, uFragIdx,
> +                                                                              cbLastFragmentSize,
> +                                                                              uMACfragNum,
> +                                                                              byFBOption));
> +                       buf->duration_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice,
> +                                                                              DATADUR_A_F1,
> +                                                                              cbFrameLength,
> +                                                                              byPktType,
> +                                                                              wCurrentRate,
> +                                                                              bNeedAck, uFragIdx,
> +                                                                              cbLastFragmentSize,
> +                                                                              uMACfragNum,
> +                                                                              byFBOption));
>                         buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
>                         return buf->duration;
>                 }
> --
> 2.7.4
>
>
>
> 
>
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#188): https://lists.elisa.tech/g/linux-safety/message/188
Mute This Topic: https://lists.elisa.tech/mt/78451464/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


