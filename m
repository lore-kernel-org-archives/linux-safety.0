Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by mx.groups.io with SMTP id smtpd.web08.9309.1603893764737027149
 for <linux-safety@lists.elisa.tech>;
 Wed, 28 Oct 2020 07:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T8+TCB1o;
 spf=pass (domain: redhat.com, ip: 216.205.24.124, mailfrom: trix@redhat.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603893763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA/ijsR6wL+A44Ymsd37c8yCOb9K4D0s+LLkBgVrjUk=;
	b=T8+TCB1oVhrAi5Ja+ulW2hugDjWOu3gJSpGsKcnvNHXX8w4T5Vaj8fmKHSiUlCkTyW+R1I
	h1o/SisSy2W8VjIU7kz45jejMTtT1OW7Vc57PGjDu7AGkMMlGKQ/0Ca/x7k4wS/2SuZLl0
	h3LY/ealRwY8LouwCI19zV8DrZw8yO8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-emOnHhCFNsKCmlR9TSkrBQ-1; Wed, 28 Oct 2020 10:02:40 -0400
X-MC-Unique: emOnHhCFNsKCmlR9TSkrBQ-1
Received: by mail-oo1-f72.google.com with SMTP id t9so2386300oon.9
        for <linux-safety@lists.elisa.tech>; Wed, 28 Oct 2020 07:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pA/ijsR6wL+A44Ymsd37c8yCOb9K4D0s+LLkBgVrjUk=;
        b=DaBZyhb9rlTF+b0rNNNBFYHZfdhwqLVaUjMlkPDuiausADAYINMgsVr28nF5CXZmcJ
         SC9zfODfXtYOpigSzVAKK2esJPXEVDQJRpL+nx/pWKd563/eIo2dPxYqwEJs2e+OX4ok
         IfmRETZjUlUrELFdWQ6s1hgg5zI7qnG54x4BNnqv9K/pPC9D/qSCVRu0KsSMFXbQK9hS
         Rb1zhwJuWmHX+juUYmtDd2O6FyGV3lo3Yk3TGGVPwEOUrW7TaefAUkqCh7uK5Gofkbt9
         O4bF0JKjS6Ynx3wdaY8e/Xy6mEaqrsgIZrAIiOIdq+qMkSDj8PfKcP31zgnd6ElUXhEy
         S5pA==
X-Gm-Message-State: AOAM533gAXcjcj09FM5D06QQsxwSvnIeXwSKySMTicsvE5L4uFDk3UVz
	1KPS5mt3sTXJ7ICE3m+QV5kIuVGONEn2jua5/vV0dlvLDYGOaY54r4rrBO5L0XsRAPDRsvMrQhP
	jmydUBg867gdhQdGxP4E2LCWjZA==
X-Received: by 2002:aca:bc89:: with SMTP id m131mr5038506oif.48.1603893758576;
        Wed, 28 Oct 2020 07:02:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK8HVad9mubt69p9XV0Zovu/5ZN2GiKzorEFq6aLJFRbquF2hpuRfMn0Pgaxfxph4ok5FPqw==
X-Received: by 2002:aca:bc89:: with SMTP id m131mr5038471oif.48.1603893758162;
        Wed, 28 Oct 2020 07:02:38 -0700 (PDT)
Return-Path: <trix@redhat.com>
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b125sm2656559oii.19.2020.10.28.07.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 07:02:37 -0700 (PDT)
Subject: Re: [PATCH] agp: amd64: remove unneeded initialization
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, David Airlie <airlied@linux.ie>
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
References: <20201028133106.5420-1-lukas.bulwahn@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <37c4192a-2757-574c-85e1-1df05c6a7a31@redhat.com>
Date: Wed, 28 Oct 2020 07:02:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201028133106.5420-1-lukas.bulwahn@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/28/20 6:31 AM, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
>
>   drivers/char/agp/amd64-agp.c:336:2: warning: \
>   Value stored to 'i' is never read [clang-analyzer-deadcode.DeadStores]
>           i = 0;
>           ^
>
> Remove this unneeded initialization to make clang-analyzer happy.
>
> Commit a32073bffc65 ("x86_64: Clean and enhance up K8 northbridge access
> code") refactored cache_nbs() and introduced this unneeded dead-store
> initialization.
>
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting binary is identical before and after this change.
>
> No functional change. No change in binary code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20201028
>
> David, please pick this minor non-urgent clean-up patch.
>
>  drivers/char/agp/amd64-agp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
> index b40edae32817..0413b3136541 100644
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
>  	if (!amd_nb_has_feature(AMD_NB_GART))
>  		return -ENODEV;
>  
> -	i = 0;
>  	for (i = 0; i < amd_nb_num(); i++) {
>  		struct pci_dev *dev = node_to_amd_nb(i)->misc;
>  		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {

Looks ok to me.

Reviewed-by: Tom Rix <trix@redhat.com>
