Return-Path: <SRS0=TGQ2=EW=lists.elisa.tech=bounce+72012+173+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEC5C4742C
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 17:16:37 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6BB20797
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 17:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="JDZH3IL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6BB20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+173+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id jiM8YY5279335x05f8kKP8Sq; Mon, 16 Nov 2020 09:16:36 -0800
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.37972.1605546764862559341
 for <linux-safety@lists.elisa.tech>;
 Mon, 16 Nov 2020 09:12:44 -0800
X-Received: from localhost (unknown [122.171.203.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 687A120797;
	Mon, 16 Nov 2020 17:12:43 +0000 (UTC)
Date: Mon, 16 Nov 2020 22:42:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
	Tom Rix <trix@redhat.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] dmaengine: ioatdma: remove unused function missed during dma_v2 removal
Message-ID: <20201116171239.GX7499@vkoul-mobl>
References: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: EkhVjzZskz9FWUeVXioRR9P2x5278000AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605546996;
 bh=muTpTI1rmoFlV0ZqMwP5dPdgCgnpBBmEZkVqgmuzg8c=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=JDZH3IL6bTMTHC87ky0VV7M7KKv37WgnzoK1zY1rjcnLxQ8vf7p0YbS9QAOlKZdvh96
 MP/Hposd6B4ol8zLPMQTTcQyzlFQ4CnBYLzv6Q+aR7/u3Aa9ZJfQZjTR18oAQxTru2/Nd
 oszF2yIinWWO9VfNQvgiWOORWhC5OC4z2QI=

On 13-11-20, 09:12, Lukas Bulwahn wrote:
> Commit 7f832645d0e5 ("dmaengine: ioatdma: remove ioatdma v2 registration")
> missed to remove dca2_tag_map_valid() during its removal. Hence, since
> then, dca2_tag_map_valid() is unused and make CC=clang W=1 warns:
> 
>   drivers/dma/ioat/dca.c:44:19:
>     warning: unused function 'dca2_tag_map_valid' [-Wunused-function]
> 
> So, remove this unused function and get rid of a -Wused-function warning.

Applied, thanks

-- 
~Vinod


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#173): https://lists.elisa.tech/g/linux-safety/message/173
Mute This Topic: https://lists.elisa.tech/mt/78225553/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


