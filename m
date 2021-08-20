Return-Path: <SRS0=kcQs=NL=lists.elisa.tech=bounce+72012+246+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5011CC4338F
	for <linux-safety@archiver.kernel.org>; Fri, 20 Aug 2021 08:35:02 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D986108B
	for <linux-safety@archiver.kernel.org>; Fri, 20 Aug 2021 08:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2D986108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id mjUmYY5279335xsNcFt1OFhS; Fri, 20 Aug 2021 01:35:01 -0700
X-Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.82016.1629448500874731171
 for <linux-safety@lists.elisa.tech>;
 Fri, 20 Aug 2021 01:35:01 -0700
X-Received: by mail-yb1-f182.google.com with SMTP id i8so17459671ybt.7
        for <linux-safety@lists.elisa.tech>; Fri, 20 Aug 2021 01:35:00 -0700 (PDT)
X-Gm-Message-State: kcHRZAdLi7C84ylrKIFuvktPx5278000AA=
X-Google-Smtp-Source: ABdhPJxQj13NWjb/KyWSRacmGbpXr84WoQL5wj+yC5PUxfgTufI7TTmHIHU3TCarBzUkhQmswfTaxfDiJxpSfDJvJZY=
X-Received: by 2002:a25:7409:: with SMTP id p9mr22295532ybc.22.1629448500053;
 Fri, 20 Aug 2021 01:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210819223350.97895-1-nghialm78@gmail.com>
In-Reply-To: <20210819223350.97895-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Fri, 20 Aug 2021 10:34:56 +0200
Message-ID: <CAKXUXMyPqWFK=1tJ03wvaR1bEnL+icfr2rXA4OU5a3Bh2tWhdg@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v3] perf tools: Add missing newline at the end of file
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1629448501;
 bh=LZYJoPP0OG2n9u8R9SbIK6Esq8H057/0LC4id3wVSvQ=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=gBTYsnYNSDu8FLY1E19akPQljilLICURS7AkxiMZT8cK+AHlajE8z1I/S6qjSh3TN4v
 AwoRDzfB+wEE9obuZqNqDaWoEfF5PI6MbRMY0mg8Zz3jvo0k/cAqbQJ+alAUUjUbDOUaK
 8CSBJmMsTpNffgbVdEGDL1M3vWU95VtcIJ8=

On Fri, Aug 20, 2021 at 12:34 AM Nghia Le <nghialm78@gmail.com> wrote:
>
> Add missing newline at the end of file parse-sublevel-options.h.
> Thus removing relevant warning reported by checkpatch.
>
> Signed-off-by: Nghia Le <nghialm78@gmail.com>

Looks good to me. You might want to check which commit introduced this
issue and add a "Fixes:" tag?

If you do not want to do that, you can just send this version of the
patch out to the intended recipients (to identify with
./scripts/get_maintainer.pl) and see what happens next. Feel free to
CC me.

Lukas

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
> --
> 2.25.1
>
>
>
> 
>
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#246): https://lists.elisa.tech/g/linux-safety/message/246
Mute This Topic: https://lists.elisa.tech/mt/85008796/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


