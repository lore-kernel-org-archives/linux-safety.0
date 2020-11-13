Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web08.8773.1605292437818766995
 for <linux-safety@lists.elisa.tech>;
 Fri, 13 Nov 2020 10:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rxYBxl6x;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: natechancellor@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id q5so9667370qkc.12
        for <linux-safety@lists.elisa.tech>; Fri, 13 Nov 2020 10:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tTop0L3WKYeLlzcN6n9MVUWYqI+MjrZ5s3ciISRrjWI=;
        b=rxYBxl6xsCyjd4FwJDuAloDkQzKFN3PNapO7YsvOTsYTOfRewJT0N578wrdbvEGnIl
         dPtIFJBNT0eWCgO0yd32zHNrR6t/KU44IZbBbMpQ6qdgDSCXLp5gZbqfJdl2AvhdPcxL
         2zDHHnkdJHPfXKyWUFXBwqYU408nCDD6Pdq9YnyO7D/RYU26LVW//jodotjavOa9S8ee
         QENFbR/wFm9WZlPz2+ad9bOJNK+tmMsZndWaT1n3JjA8PuekH1ix5kyMM3LNsqDXLGP0
         e0401NJ5p0FAeU40bxu2r2OvSwb6IfWUP/CEKTr+WywQX5KxnBy7pVctATK189g7s1yP
         BZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tTop0L3WKYeLlzcN6n9MVUWYqI+MjrZ5s3ciISRrjWI=;
        b=M4FbaGQuMkVNFgfTiWg0R9EvjVtqlIJ5HWikRMOXuExpUNbRAF6nA0FDxB/cbtetUk
         Qz/4QW5Rymnl/AvAjxxSlypSoHWOXfdNB+5V3VR5FD/jlrTuJzXNXW7snCkejigDOAO9
         TbOxd3UI8QW67Xdwqt/IUstJnuGKdLDLZwVdNvOhKAUYX7ih77EHCfM70XwvwBzz5Rbd
         C/Fv37lh/buK/EfIHp19aSrQz4qfK0LmyPD7URvsQBCWKdmgo8wVUmLRMXbP8ywr+v7q
         HR682c0Sm1JPl+yHnvQwijh+1EVrwYLfY6GlwV2IBCIn+TyKlqvQIP6CS2YDLfhF5snq
         agkw==
X-Gm-Message-State: AOAM533PGEzqujwJAihm5BbqIQax0VekR2KMrNYxv4BNAwqmzX41GlGO
	mt3IH0wls3B7UzY5KUWVEqo=
X-Google-Smtp-Source: ABdhPJyINnvGblcrdNoVnqkFbBeH/EHFF6e90JDj+uK0oZQEjVkWvfmVDHDCapd/swUXQ17YOyYAgg==
X-Received: by 2002:a37:991:: with SMTP id 139mr3306876qkj.185.1605292436793;
        Fri, 13 Nov 2020 10:33:56 -0800 (PST)
Return-Path: <natechancellor@gmail.com>
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id q1sm7028411qti.95.2020.11.13.10.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 10:33:56 -0800 (PST)
Date: Fri, 13 Nov 2020 11:33:54 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
	Tom Rix <trix@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ioatdma: remove unused function missed during dma_v2 removal
Message-ID: <20201113183354.GA1435913@ubuntu-m3-large-x86>
References: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2020 at 09:12:48AM +0100, Lukas Bulwahn wrote:
> Commit 7f832645d0e5 ("dmaengine: ioatdma: remove ioatdma v2 registration")
> missed to remove dca2_tag_map_valid() during its removal. Hence, since
> then, dca2_tag_map_valid() is unused and make CC=clang W=1 warns:
> 
>   drivers/dma/ioat/dca.c:44:19:
>     warning: unused function 'dca2_tag_map_valid' [-Wunused-function]
> 
> So, remove this unused function and get rid of a -Wused-function warning.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on current master and next-20201112
> 
> Maciej, please ack.
> 
> Vinod, Dan, please pick this minor non-urgent clean-up patch.
> 
>  drivers/dma/ioat/dca.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
> index 0be385587c4c..289c59ed74b9 100644
> --- a/drivers/dma/ioat/dca.c
> +++ b/drivers/dma/ioat/dca.c
> @@ -40,16 +40,6 @@
>  #define DCA2_TAG_MAP_BYTE3 0x82
>  #define DCA2_TAG_MAP_BYTE4 0x82
>  
> -/* verify if tag map matches expected values */
> -static inline int dca2_tag_map_valid(u8 *tag_map)
> -{
> -	return ((tag_map[0] == DCA2_TAG_MAP_BYTE0) &&
> -		(tag_map[1] == DCA2_TAG_MAP_BYTE1) &&
> -		(tag_map[2] == DCA2_TAG_MAP_BYTE2) &&
> -		(tag_map[3] == DCA2_TAG_MAP_BYTE3) &&
> -		(tag_map[4] == DCA2_TAG_MAP_BYTE4));
> -}
> -
>  /*
>   * "Legacy" DCA systems do not implement the DCA register set in the
>   * I/OAT device.  Software needs direct support for their tag mappings.
> -- 
> 2.17.1
> 
