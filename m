Return-Path: <SRS0=nc4b=FO=lists.elisa.tech=bounce+72012+218+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C32C4361B
	for <linux-safety@archiver.kernel.org>; Thu, 10 Dec 2020 05:47:19 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F17423D37
	for <linux-safety@archiver.kernel.org>; Thu, 10 Dec 2020 05:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F17423D37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+218+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id Pl4AYY5279335xFCM35VqNKj; Wed, 09 Dec 2020 21:47:18 -0800
X-Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.9066.1607579238025344406
 for <linux-safety@lists.elisa.tech>;
 Wed, 09 Dec 2020 21:47:18 -0800
X-Received: by mail-il1-f196.google.com with SMTP id p5so3990025ilm.12
        for <linux-safety@lists.elisa.tech>; Wed, 09 Dec 2020 21:47:17 -0800 (PST)
X-Gm-Message-State: JOAGLtrkEcbOU0tOvbvGL7LCx5278000AA=
X-Google-Smtp-Source: ABdhPJw4ax8k9YkGwPbZWMCYQlZz7TN9R8/hwwmp1kYatapBwQm8lMegOfMfuR6YQF5h8G0AlmZy6EXyC6vKfTpRbwU=
X-Received: by 2002:a92:512:: with SMTP id q18mr7720551ile.147.1607579237393;
 Wed, 09 Dec 2020 21:47:17 -0800 (PST)
MIME-Version: 1.0
References: <1607519814-86271-1-git-send-email-milan.lakhani@codethink.co.uk>
In-Reply-To: <1607519814-86271-1-git-send-email-milan.lakhani@codethink.co.uk>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Thu, 10 Dec 2020 06:47:13 +0100
Message-ID: <CAKXUXMzTpOT3MJLkmjR_Hpak8K5a7GQ-vTtNp0GbNarD6NG1FA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] kernel: trace: Remove deadstore in trace_uprobe.c
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1607579238;
 bh=GuPsVf0FUNH29HEN1xEPiiSZ/5byLZrUqnMtwjpMq30=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=VEn5dPP7LiSmq4gTcYBUGfQvDVPvTBymcLX9YRMUhqGsk6BU90qiJpfgNYDW4WlSrbp
 N/oS/97ZG2RLFyd9AB3+Xd29koeYMRuV38iGGkr4uKlpF0mydtAYBqRG6aVxRR2Xz0Iw8
 p4zdDO3TYnznREyHLILlMsGmhBEQBB7sGLg=

On Wed, Dec 9, 2020 at 2:17 PM Milan Lakhani
<milan.lakhani@codethink.co.uk> wrote:
>
> In trace_uprobe.c, trace_uprobe_create assigns ret to 0 but then never
> uses this value.
>

Milan, the patch makes sense, but I fear you did not run
./scripts/get_maintainers.pl because you did not include any specific
maintainer as recipient.

The patch subject could be: remove unneeded initialization (instead of
the very generic "dead store" term).

It is also interesting to see who added this initialization; was it
unneeded since the existence of this function, did it become obsolete
at some point in time due to refactoring?

Run ./scripts/get_maintainers.pl  and please CC: me; then you will get
your Reviewed-by: tag.

Lukas

> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  kernel/trace/trace_uprobe.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
> index 3cf7128..c7c7070 100644
> --- a/kernel/trace/trace_uprobe.c
> +++ b/kernel/trace/trace_uprobe.c
> @@ -541,7 +541,6 @@ static int trace_uprobe_create(int argc, const char **argv)
>         bool is_return = false;
>         int i, ret;
>
> -       ret = 0;
>         ref_ctr_offset = 0;
>
>         switch (argv[0][0]) {
> --
> 2.7.4
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#218): https://lists.elisa.tech/g/linux-safety/message/218
Mute This Topic: https://lists.elisa.tech/mt/78828451/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


