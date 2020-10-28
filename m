Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by mx.groups.io with SMTP id smtpd.web12.9345.1603893549694442377
 for <linux-safety@lists.elisa.tech>;
 Wed, 28 Oct 2020 06:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bp8BLXdv;
 spf=pass (domain: redhat.com, ip: 216.205.24.124, mailfrom: trix@redhat.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603893548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9/CLvMtl/VDe8FAQKlYw2/08Jd6hZteFLUw3bqy7TU=;
	b=bp8BLXdvt+tdo4ScsiK1HT+b4ioqjN3Kt24bH4wkmiLx/r9dpAaUrgivwzwUZxgCLZQKGr
	felKLLn9qsiytDuAL81VOQiCEKwbdYkKxEOIQeffgiNbme+9zXoRg/w+zWxB3ruYTwQW8m
	9KwL2Xjp3AYnUUQenTGFD22QmL321eI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-7rgf91VyOUGQeFmNdLqtNQ-1; Wed, 28 Oct 2020 09:59:07 -0400
X-MC-Unique: 7rgf91VyOUGQeFmNdLqtNQ-1
Received: by mail-oo1-f69.google.com with SMTP id c19so2373217oov.22
        for <linux-safety@lists.elisa.tech>; Wed, 28 Oct 2020 06:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=o9/CLvMtl/VDe8FAQKlYw2/08Jd6hZteFLUw3bqy7TU=;
        b=AlCqRaz5qP7KfkqJV0wIy8C5DZpSMyDsYlYkmAIgYqqDB3W9p2vUttrRu+uab2q2So
         x+pNUr0WiHXPcGM78wvWp8cc78qA/LNSQsOcWGUBdj6rTNuGABJts7/GfeDnXzhRikRV
         lotDqT8N7gytL6lGI3isPqc1LvrxTgCEH/gH0sPkeIB0M1QYbSEelw16SJJnc0MU0GyC
         SSeRIdNvEoqnmhZRidCVpWKAvZ6EbzAon9zbFjq6EgnAMwWHl4xl/0nLdVsL0BevKBxQ
         YeBF+g3biywnFZjh6G+Hpf2WKf1/MarM+Sw43L8D/5w8BDT6ZB3MRvKZX8un60oEMGWX
         PY3Q==
X-Gm-Message-State: AOAM530JVN2yEkRGn/fr1ivw3aiJuhlQAEQFoJIMnrit1tQm7WFIYqZl
	ZHFxdHKgM3s2g7qfx4xq9/Epya4kohAMrcB1QGtKb7VMjp2Qmsgb0R6/6kGaxR29KGjGhYYTtOu
	LlT17ASvtEZxAPb153we25d0z4A==
X-Received: by 2002:a05:6830:1009:: with SMTP id a9mr3705442otp.312.1603893546095;
        Wed, 28 Oct 2020 06:59:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeg7tSjhUnhor6fkPxapZ8CezKup/neyZauptgkF/vARmTGWA1Kn0lF3+D4cF2Xma1oQSK6Q==
X-Received: by 2002:a05:6830:1009:: with SMTP id a9mr3705422otp.312.1603893545799;
        Wed, 28 Oct 2020 06:59:05 -0700 (PDT)
Return-Path: <trix@redhat.com>
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c20sm2031463otm.49.2020.10.28.06.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 06:59:05 -0700 (PDT)
Subject: Re: [PATCH] net: cls_api: remove unneeded local variable in tc_dump_chain()
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
References: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <d956a5a5-c064-3fd4-5e78-809638ba14ef@redhat.com>
Date: Wed, 28 Oct 2020 06:59:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/28/20 4:35 AM, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
>
> net/sched/cls_api.c:2964:3: warning: Value stored to 'parent' is never read
>   [clang-analyzer-deadcode.DeadStores]
>                 parent = 0;
>                 ^
>
> net/sched/cls_api.c:2977:4: warning: Value stored to 'parent' is never read
>   [clang-analyzer-deadcode.DeadStores]
>                         parent = q->handle;
>                         ^
>
> Commit 32a4f5ecd738 ("net: sched: introduce chain object to uapi")
> introduced tc_dump_chain() and this initial implementation already
> contained these unneeded dead stores.
>
> Simplify the code to make clang-analyzer happy.
>
> As compilers will detect these unneeded assignments and optimize this
> anyway, the resulting binary is identical before and after this change.
>
> No functional change. No change in object code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20201028
>
> Jamal, Cong, Jiri, please ack.
> David, Jakub, please pick this minor non-urgent clean-up patch.
>
>  net/sched/cls_api.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
> index faeabff283a2..8ce830ca5f92 100644
> --- a/net/sched/cls_api.c
> +++ b/net/sched/cls_api.c
> @@ -2940,7 +2940,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  	struct tcf_chain *chain;
>  	long index_start;
>  	long index;
> -	u32 parent;
>  	int err;
>  
>  	if (nlmsg_len(cb->nlh) < sizeof(*tcm))
> @@ -2955,13 +2954,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  		block = tcf_block_refcnt_get(net, tcm->tcm_block_index);
>  		if (!block)
>  			goto out;
> -		/* If we work with block index, q is NULL and parent value
> -		 * will never be used in the following code. The check
> -		 * in tcf_fill_node prevents it. However, compiler does not
> -		 * see that far, so set parent to zero to silence the warning
> -		 * about parent being uninitialized.
> -		 */
> -		parent = 0;
>  	} else {
>  		const struct Qdisc_class_ops *cops;
>  		struct net_device *dev;
> @@ -2971,13 +2963,11 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  		if (!dev)
>  			return skb->len;
>  
> -		parent = tcm->tcm_parent;
> -		if (!parent) {
> +		if (!tcm->tcm_parent)
>  			q = dev->qdisc;
> -			parent = q->handle;

This looks like a an unused error handler.

and the later call to

if (TC_H_MIN(tcm->tcm_parent)

maybe should be

if (TC_H_MIN(parent))

so I am skeptical that this change is ok because the code around it looks buggy.

Tom

> -		} else {
> +		else
>  			q = qdisc_lookup(dev, TC_H_MAJ(tcm->tcm_parent));
> -		}
> +
>  		if (!q)
>  			goto out;
>  		cops = q->ops->cl_ops;
