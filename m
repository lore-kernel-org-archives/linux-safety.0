Return-Path: <SRS0=QMAt=E6=lists.elisa.tech=bounce+72012+200+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73721C56201
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 14:52:45 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A444020782
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 14:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="SE3rUKSO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A444020782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+200+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id zoKuYY5279335xkBTqpAU0Xu; Tue, 24 Nov 2020 06:52:43 -0800
X-Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web09.53128.1606229563343344179
 for <linux-safety@lists.elisa.tech>;
 Tue, 24 Nov 2020 06:52:43 -0800
X-Received: by mail-io1-f67.google.com with SMTP id r1so22152588iob.13
        for <linux-safety@lists.elisa.tech>; Tue, 24 Nov 2020 06:52:43 -0800 (PST)
X-Gm-Message-State: hAHmmRUTaFiULc9wPytuOneQx5278000AA=
X-Google-Smtp-Source: ABdhPJwiGiDLpDWF2nBPdJuLvQZa7QER69J4mSk03iO1nr2+q/dNipafVE1L5fhc2XZeMoO3Qq8vBSazHFMGWxxLgls=
X-Received: by 2002:a02:830f:: with SMTP id v15mr4574545jag.12.1606229562528;
 Tue, 24 Nov 2020 06:52:42 -0800 (PST)
MIME-Version: 1.0
References: <1606214936-35192-1-git-send-email-milan.lakhani@codethink.co.uk> <1606214936-35192-2-git-send-email-milan.lakhani@codethink.co.uk>
In-Reply-To: <1606214936-35192-2-git-send-email-milan.lakhani@codethink.co.uk>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Tue, 24 Nov 2020 15:52:31 +0100
Message-ID: <CAKXUXMyBsWydrqspsWn6HUAGEDVU12y_vY=Tx_4DXGrG0=stQg@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v2 2/2] staging: vt6655: Use macro in rxtx.c
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech, 
	forest@alittletooquiet.net
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606229563;
 bh=rN5L9M51GPI1sDnFDDQlFa30zlWzpM1qp11dTEYQckk=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=SE3rUKSOlTcGULvkqvJFtDEav6F4QJYY9av1QqLErR75lnPRBGZEQ8CyWU4iNzrYgpY
 u1F670jkNcLgpP7ftXs/X52kVsAdX9ofPOqFJFu0QAr58v9CHs4NAUqZbD9kNYEHrUzKE
 hWcAPPOJSHxFpXO2heo6RsvSke5k1QA3PxI=

On Tue, Nov 24, 2020 at 11:49 AM Milan Lakhani
<milan.lakhani@codethink.co.uk> wrote:
>
> Use macro for repeated function to get the data duration and timestamp,
> correcting line length and alignment warnings in rxtx.c. Reported by
> checkpatch.
>
> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>

Patch looks good.

You need to CC:

devel@driverdev.osuosl.org


> ---
>  drivers/staging/vt6655/rxtx.c | 51 ++++++++++++++++---------------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 508e1bd..c5dfe3c 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -423,6 +423,10 @@ s_uGetRTSCTSDuration(
>         return cpu_to_le16((u16)uDurTime);
>  }
>
> +#define getDurationTimeStamp(byDurType, byPktType, wRate) \
> +       (cpu_to_le16((u16)s_uGetDataDuration(pDevice, (byDurType), cbFrameLength, (byPktType), \
> +               (wRate), bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption)))
> +
>  static
>  __le16
>  s_uFillDataHead(
> @@ -467,15 +471,10 @@ s_uFillDataHead(
>                         } else {
>                                 /* Get Duration and TimeStamp */
>                                 buf->duration_a =
> -                                       cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength,
> -                                                                           byPktType, wCurrentRate, bNeedAck, uFragIdx,
> -                                                                           cbLastFragmentSize, uMACfragNum,
> -                                                                           byFBOption));
> +                                       getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
>                                 buf->duration_b =
> -                                       cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength,
> -                                                                           PK_TYPE_11B, pDevice->byTopCCKBasicRate,
> -                                                                           bNeedAck, uFragIdx, cbLastFragmentSize,
> -                                                                           uMACfragNum, byFBOption));
> +                                       getDurationTimeStamp(DATADUR_B, PK_TYPE_11B,
> +                                                            pDevice->byTopCCKBasicRate);
>                         }
>
>                         buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
> @@ -492,14 +491,11 @@ s_uFillDataHead(
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
> +               buf->duration_a = getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
> +               buf->duration_b = getDurationTimeStamp(DATADUR_B, PK_TYPE_11B,
> +                                                      pDevice->byTopCCKBasicRate);
> +               buf->duration_a_f0 = getDurationTimeStamp(DATADUR_A_F0, byPktType, wCurrentRate);
> +               buf->duration_a_f1 = getDurationTimeStamp(DATADUR_A_F1, byPktType, wCurrentRate);
>
>                 buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
>                 buf->time_stamp_off_b = vnt_time_stamp_off(pDevice, pDevice->byTopCCKBasicRate);
> @@ -517,12 +513,11 @@ s_uFillDataHead(
>                                           byPktType, &buf->a);
>
>                         /* Get Duration and TimeStampOff */
> -                       buf->duration = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
> -                                                                           wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> -                       buf->duration_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
> -                                                                              wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> -                       buf->duration_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
> -                                                                               wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
> +                       buf->duration = getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
> +                       buf->duration_f0 = getDurationTimeStamp(DATADUR_A_F0, byPktType,
> +                                                               wCurrentRate);
> +                       buf->duration_f1 = getDurationTimeStamp(DATADUR_A_F1, byPktType,
> +                                                               wCurrentRate);
>                         buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
>                         return buf->duration;
>                 }
> @@ -537,11 +532,7 @@ s_uFillDataHead(
>                         buf->duration = dur;
>                 } else {
>                         /* Get Duration and TimeStampOff */
> -                       buf->duration =
> -                               cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
> -                                                                   wCurrentRate, bNeedAck, uFragIdx,
> -                                                                   cbLastFragmentSize, uMACfragNum,
> -                                                                   byFBOption));
> +                       buf->duration = getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
>                 }
>
>                 buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
> @@ -558,11 +549,7 @@ s_uFillDataHead(
>                 buf->duration = dur;
>         } else {
>                 /* Get Duration and TimeStampOff */
> -               buf->duration =
> -                       cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength, byPktType,
> -                                                           wCurrentRate, bNeedAck, uFragIdx,
> -                                                           cbLastFragmentSize, uMACfragNum,
> -                                                           byFBOption));
> +               buf->duration = getDurationTimeStamp(DATADUR_B, byPktType, wCurrentRate);
>         }
>
>         buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
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
View/Reply Online (#200): https://lists.elisa.tech/g/linux-safety/message/200
Mute This Topic: https://lists.elisa.tech/mt/78474577/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


