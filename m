Return-Path: <SRS0=/D+a=NK=lists.elisa.tech=bounce+72012+244+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7720CC4338F
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 10:16:33 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 222FA61101
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 222FA61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id JpzpYY5279335xrSEsh6WYhg; Thu, 19 Aug 2021 03:16:32 -0700
X-Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.67818.1629368192447379321
 for <linux-safety@lists.elisa.tech>;
 Thu, 19 Aug 2021 03:16:32 -0700
X-Received: by mail-yb1-f174.google.com with SMTP id r4so11377357ybp.4
        for <linux-safety@lists.elisa.tech>; Thu, 19 Aug 2021 03:16:32 -0700 (PDT)
X-Gm-Message-State: GPMJoHTHVsfzPxyHB7kJC38Ox5278000AA=
X-Google-Smtp-Source: ABdhPJx1RfEErmIFOejAV9DycNbTjRJOihsqsACmrtEm2a6f+qttEBC62rqOdicTCSGmldeexVwFjmifEJVtZ3YE6Dc=
X-Received: by 2002:a25:f511:: with SMTP id a17mr17301151ybe.470.1629368191551;
 Thu, 19 Aug 2021 03:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210819100451.87747-1-nghialm78@gmail.com>
In-Reply-To: <20210819100451.87747-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Thu, 19 Aug 2021 12:16:27 +0200
Message-ID: <CAKXUXMxy2mm2OZjHE6u262B_pHPV+k3pmJK2iTqvzq=YY1MKpA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v2] parse-sublevel-options.h : Add missing newline
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1629368192;
 bh=Zpz71zIQPwVXZblCsZrTfLjsfW1fQOiXJ5n6vFTPOFg=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=sYde3BpJtM84pGzhqreYVr02/7NEuO46kNmufjO0xw2kZe0I+PYFT8KhraPpd4aMNNC
 LiWX8yRVARBhWZHbeT5XlY4NVHfCfACYv9zli9UhpVuKY1MUJ7Qhoyg0dF+09h12xicFJ
 qbF8NLbjpA7M5jyX0e/FZPTRQ3y1NwGPsYE=

For the subject line: the prefix should probably be "tools: perf:
...", but not "parse-sublevel-options.h:". Use git log --oneline
tools/perf to find the most common convention for commits to
tools/perf.

On Thu, Aug 19, 2021 at 12:05 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> Add missing newline at the end of file, thus removing relevant warning
> reported by checkpatch.pl
>

You can just write "checkpatch" instead of checkpatch.pl. And end your
sentences with ".".

Always run checkpatch.pl on your patch. But there is no need to add
the checkpatch report in the commit message.


> Checkpatch.pl reported for patch as below:
>
> total: 0 errors, 0 warnings, 6 lines checked
>
> v2-0001-parse-sublevel-options.h-Add-missing-newline.patch has no obvious
> style problems and is ready for submission.
>
> Signed-off-by: Nghia Le <nghialm78@gmail.com>
> ---
>  tools/perf/util/parse-sublevel-options.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/parse-sublevel-options.h b/tools/perf/util/parse-sublevel-options.h
> index 9b9efcc2aaad..578b18ef03bb 100644
> --- a/tools/perf/util/parse-sublevel-options.h
> +++ b/tools/perf/util/parse-sublevel-options.h
> @@ -8,4 +8,4 @@ struct sublevel_option {
>
>  int perf_parse_sublevel_options(const char *str, struct sublevel_option *opts);
>
> -#endif
> \ No newline at end of file
> +#endif

Change looks good now. I suggest you send a patch v3 here and if that
is all good, it is probably ready for the general mailing list.

Lukas


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#244): https://lists.elisa.tech/g/linux-safety/message/244
Mute This Topic: https://lists.elisa.tech/mt/84993288/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


