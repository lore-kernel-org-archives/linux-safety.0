Return-Path: <SRS0=biT0=NJ=lists.elisa.tech=bounce+72012+241+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2EEC4338F
	for <linux-safety@archiver.kernel.org>; Wed, 18 Aug 2021 17:12:00 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 101A660FE6
	for <linux-safety@archiver.kernel.org>; Wed, 18 Aug 2021 17:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 101A660FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id uNQ3YY5279335xoJce5gchD9; Wed, 18 Aug 2021 10:11:59 -0700
X-Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web09.57623.1629306719227539278
 for <linux-safety@lists.elisa.tech>;
 Wed, 18 Aug 2021 10:11:59 -0700
X-Received: by mail-yb1-f172.google.com with SMTP id g26so6741122ybe.0
        for <linux-safety@lists.elisa.tech>; Wed, 18 Aug 2021 10:11:59 -0700 (PDT)
X-Gm-Message-State: 5WsTrWrDQsx6mOWNdngzj9hsx5278000AA=
X-Google-Smtp-Source: ABdhPJwx9ZvHqzb0qqtDH2jSubenZSjxo3irDMmolLZIW1ARF7WYSfCGW2rSwUxt/oE/lyJM3QBUI43IUHcqtG3hNXo=
X-Received: by 2002:a25:3046:: with SMTP id w67mr12837073ybw.134.1629306718375;
 Wed, 18 Aug 2021 10:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210818170109.62277-1-nghialm78@gmail.com>
In-Reply-To: <20210818170109.62277-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Wed, 18 Aug 2021 19:11:53 +0200
Message-ID: <CAKXUXMwcLmMxbszRRzYV+nBtJTG5pYhe9fLiQ3_RFSo2DjaZ_w@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] parse-sublevel-option.h : Add new line and license identifier
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1629306719;
 bh=10pkC+94BAo/C7D89IhHXqtA+2jOxQmHXq7I/DiYyjs=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=RNRY0aYbaru9nqJLHCYMJk5ww1bIQE2qMIexf5ROPkr1CKYaL9Twg8F+Zt9t0ejUcOk
 +/TP1LYUA7Mo+b+QbIcllhCSkglWATHCxtKeYg47psEo7PCe4/WP0S3E2ZJ4XL3eqrakL
 dxQPdv2UbK5I+Y+V+w3hzI5JrqUNYnGbpu4=

On Wed, Aug 18, 2021 at 7:01 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> Add the new line at the end of file and add SPDX license identifier GPL-2.0, thus removing warning while running checkpatch.pl script
>
> Signed-off-by: Nghia Le <nghialm78@gmail.com>

Did you run checkpatch.pl on your own patch? What did it report?

> ---
>  tools/perf/util/parse-sublevel-options.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/parse-sublevel-options.h b/tools/perf/util/parse-sublevel-options.h
> index 9b9efcc2aaad..bb44b5af2963 100644
> --- a/tools/perf/util/parse-sublevel-options.h
> +++ b/tools/perf/util/parse-sublevel-options.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +

Do you understand the legal implications of adding this annotation?
Are you among the authors to make this statement with sufficient
confidence?

It seems awkward to just annotate one file here, probably it is much
better to have one commit that adds this annotation to all files in
tools/perf/ if you are sure that this is all licensed GPL-2.0.

>  #ifndef _PERF_PARSE_SUBLEVEL_OPTIONS_H
>  #define _PERF_PARSE_SUBLEVEL_OPTIONS_H
>
> @@ -8,4 +10,5 @@ struct sublevel_option {
>
>  int perf_parse_sublevel_options(const char *str, struct sublevel_option *opts);
>
> -#endif
> \ No newline at end of file
> +#endif
> +

Now, you are adding an empty new line to this file. Can you create a
patch that ends with #endif and a newline instead? That seems much
more common throughout the whole kernel tree.

Good luck, we are anxiously waiting for your patch v2.

Lukas


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#241): https://lists.elisa.tech/g/linux-safety/message/241
Mute This Topic: https://lists.elisa.tech/mt/84977020/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


