Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.14335.1599660356922384403
 for <linux-safety@lists.elisa.tech>;
 Wed, 09 Sep 2020 07:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=afutkE6f;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id z23so3696639ejr.13
        for <linux-safety@lists.elisa.tech>; Wed, 09 Sep 2020 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=y7V3om1WxSmj3grRgTN75Sd0q2AtDrRbDKyzFd38g20=;
        b=afutkE6fShY/ROdsBYkpRlw4Al2OUuKFGlBt3jApiYXiVkAcH65TIuK+zRO0A0QVIR
         sxZdzD3CkroAg6CwgAX7Q8XNG38O6D9zP+/1O3G7KcRCqw8sBcDP+i8vBTqIB2g5pHLN
         Hf8yZqaP/Bxc2lPfud7sFqPDbbfeF/B73t/zNrwUnZic3g5uI33f6mlosASF4v/ZPASM
         aEi/AgIPNuv+DKpqr5whUW8Pxic7yIyDsSsoGkt5q5dQSVmGDSf2PPCERwPkoAGZFlD4
         +hM6GdxCp8yPoV3S/luB3ybfn/54N5iH/f7g3lNnorVprh5ZLWXkiMLi/J35YZbwHvL4
         2rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=y7V3om1WxSmj3grRgTN75Sd0q2AtDrRbDKyzFd38g20=;
        b=CxWUut19HWpH/57zCtK1oUKbHLFUp6a3Yo/9PbofnMlAUxmXn8Y8b+b8ZHrkVapvny
         We0/q2WwvHQqPqnsw6eLDsceBOiwYtJnjEdAvQcvHdDeKmXGJtMYU70zGneWk9rD19rV
         bm3DHgfaQSqd2tRMA8YLtKobePp7W4DC/gmP+mBRuPmLDASRM3Y827ar+azNneIr9Z8w
         f4s29od0x5N2xiMyhJf8BAkZ/8HY8Tl4TW1j/AulhyNZoMd9FuQxNo0bKJLgBlQj6qOy
         Y8JRYR2ug1bXiXLH3Af8EVWwvj3WP5wMks8H3y8kbtnmavLdUKVri2anrSGWW/AD5I3n
         A5Rg==
X-Gm-Message-State: AOAM532SY94xaslC4e0oozf6K/zdywGL9fTuds5KvhEIvMvopo0oee+X
	m1GTdxBk0zLQCmmF6yvlnFQ=
X-Google-Smtp-Source: ABdhPJwFY/6JQ7zsUw3kcmTQah5DuyPWBhnUXSpSuTdkCLUJARCfBUbH0Hd98rlcwsRDpSyg8P5VTg==
X-Received: by 2002:a17:906:386:: with SMTP id b6mr3761325eja.538.1599660355147;
        Wed, 09 Sep 2020 07:05:55 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
        by smtp.gmail.com with ESMTPSA id v23sm2421662ejh.84.2020.09.09.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 07:05:53 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 9 Sep 2020 16:05:52 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mohammed Billoo <mab@mab-labs.com>
cc: linux-safety@lists.elisa.tech, skhan@linuxfoundation.org
Subject: Re: [linux-safety] [PATCH] scripts: Report 'suspicious' comments
In-Reply-To: <20200827151333.11591-1-mab@mab-labs.com>
Message-ID: <alpine.DEB.2.21.2009091533570.23843@felia>
References: <20200827151333.11591-1-mab@mab-labs.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 27 Aug 2020, Mohammed Billoo wrote:

> This perl script attempts to mitigate CWE-546
> (https://cwe.mitre.org/data/definitions/546.html), which identifies code
> with comments that suggest that code is incomplete. This script was
> tested against the kernel, and the following is a snippet of the
> output that was generated. The output was verified by confirming that
> the specified file does indeed have that string at the specified line.
> 
> ./arch/arm/include/asm/pgtable.h contains FIXME on line 316
> ./arch/arm/include/debug/imx.S contains FIXME on line 14
> ./arch/arm/kernel/entry-header.S contains BUG on line 71
> ./arch/arm/kernel/fiq.c contains FIXME on line 72
>

Okay, easy things first:

The patch applies on v5.9-rc4 and the script runs. :)

Now, the challenging parts:

- I think your output should follow in its format the format of other 
"standard" tools that other tools use, e.g., look how gcc and clang 
compiler emit warnings, or how checkpatch.pl emits warnings.

We should try to imitate their output format for this tool.

Also, I would like to see the line which was warned about.

- Second, we then need to look into true and false positives here.
BUG appears in intended error messages, in DEBUG, in functions, such as 
BUG, BUG_ON. So we need to collect the context around BUG and see to 
improve the pattern to at least reduce the false positives.

- Third, we then need have suitable ways to aggregate the findings to know 
which places are known to have many such findings and hence deserve some 
kind of special care.

And then, we need a lot of help to make proper evaluations what to do.

Lukas 
 
> Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
> ---
>  Makefile                |  8 +++++++-
>  scripts/checkcomment.pl | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/checkcomment.pl
> 
> diff --git a/Makefile b/Makefile
> index f21168154160..c84b8bc5c18e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -264,7 +264,7 @@ no-dot-config-targets := $(clean-targets) \
>  			 cscope gtags TAGS tags help% %docs check% coccicheck \
>  			 $(version_h) headers headers_% archheaders archscripts \
>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
> -			 outputmakefile
> +			 outputmakefile commentcheck
>  no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
>  
> @@ -1575,6 +1575,7 @@ help:
>  	@echo  '  export_report   - List the usages of all exported symbols'
>  	@echo  '  headerdep       - Detect inclusion cycles in headers'
>  	@echo  '  coccicheck      - Check with Coccinelle'
> +	@echo  '  commentcheck    - Check and report suspicious comments'
>  	@echo  ''
>  	@echo  'Tools:'
>  	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
> @@ -1842,6 +1843,11 @@ versioncheck:
>  		-name '*.[hcS]' -type f -print | sort \
>  		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
>  
> +commentcheck:
> +	find $(srctree)/* $(RCS_FIND_IGNORE) \
> +		-name '*.[hcS]' -type f -print | sort \
> +		| xargs $(PERL) -w $(srctree)/scripts/checkcomment.pl
> +
>  coccicheck:
>  	$(Q)$(BASH) $(srctree)/scripts/$@
>  
> diff --git a/scripts/checkcomment.pl b/scripts/checkcomment.pl
> new file mode 100644
> index 000000000000..22fd77bc75d1
> --- /dev/null
> +++ b/scripts/checkcomment.pl
> @@ -0,0 +1,35 @@
> +#!/usr/bin/env perl
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# (c) 2020, Mohammed Billoo (mab@mab-labs.com)
> +#
> +# This script checks for any keywords outlined in CWE-546
> +# (https://cwe.mitre.org/data/definitions/546.html)
> +# and simply reports them to the user. It's up to the user
> +# to take any further actions.
> +
> +use strict;
> +
> +my @keywords = ('TODO', 'BUG', 'FIXME', 'HACK');
> +my @mismatch_keywords = ('BUG\(\)');
> +
> +foreach my $file (@ARGV) {
> +	my $i = 1;
> +	open(my $f, '<', $file)
> +		or die "Cannot open $file: $!\n";
> +
> +	while (my $line = <$f>) {
> +		foreach my $keyword (@keywords) {
> +			if ($line =~ /\b$keyword\b/) {
> +				foreach my $mismatch_keyword (@mismatch_keywords) {
> +					if ($line =~ /$mismatch_keyword/) {}
> +					else {
> +						print "$file contains $keyword on line $i\n";
> +					}
> +				}
> +			}
> +		}
> +
> +		$i++;
> +	}
> +}
> -- 
> 2.17.1
> 
> 
> 
> 
> 
