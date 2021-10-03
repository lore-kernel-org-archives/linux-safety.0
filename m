Return-Path: <SRS0=d8/N=OX=lists.elisa.tech=bounce+72012+251+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A067C433F5
	for <linux-safety@archiver.kernel.org>; Sun,  3 Oct 2021 05:01:02 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C1961A4F
	for <linux-safety@archiver.kernel.org>; Sun,  3 Oct 2021 05:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2C1961A4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id g71XYY5279335x9MLyRRZ5r7; Sat, 02 Oct 2021 22:01:01 -0700
X-Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.19314.1633237261040516677
 for <linux-safety@lists.elisa.tech>;
 Sat, 02 Oct 2021 22:01:01 -0700
X-Received: by mail-yb1-f176.google.com with SMTP id z5so29835387ybj.2
        for <linux-safety@lists.elisa.tech>; Sat, 02 Oct 2021 22:01:00 -0700 (PDT)
X-Gm-Message-State: pQPPyek2gGnudpAoXSC41CRrx5278000AA=
X-Google-Smtp-Source: ABdhPJyi6IMctJP8uAhDTaLiIj0g40xVYdgAhoLQ8UECqf4JFjKVYOK8XD5cPjzqoRlcRuMzd9iTD8xAnB6iWmmZIOk=
X-Received: by 2002:a25:accb:: with SMTP id x11mr6704089ybd.154.1633237260197;
 Sat, 02 Oct 2021 22:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211002115347.77994-1-nghialm78@gmail.com>
In-Reply-To: <20211002115347.77994-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Sun, 3 Oct 2021 07:00:49 +0200
Message-ID: <CAKXUXMxs7kxDhAfertYZ_=XVCFuX99dGAbo5MSGvQZY7zA58sg@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v2] mm/hugetlb.c: remove dead store in demote_size_show()
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1633237261;
 bh=sgd6VnSX9shY6Po2nXFLIPYyjE3MKTEUryOZZPODXBk=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=lpy0T01IhPGrTzJNNrRbIbsJneEk9pA8grwg6g07BoqyRcuJHzweG9ZgOauGqSE2sdw
 xl3JPqO8R+jP0m48oAqJiP6uAbhHjUDkmvHGYdPJu6xQiWjtu+ACBe/yYGdik7/zzfiRA
 3mkZekA5d965HEM2M9rcMCaA7zgPYN+4cP4=

On Sat, Oct 2, 2021 at 1:53 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> The command "make clang-analyzer" detected a dead store.
>
> Remove demote_size and corresponding assignment in function
> demote_size_show() to fix dead store, as demote_size is never read
>

I suggest adding punctuation (a ".") at the end of this sentence.

Otherwise, this patch looks good.

Send the next revised patch out to the recommendations from
get_maintainers.pl and also CC: kernel-janitors
<kernel-janitors@vger.kernel.org> and me. Thanks.

Great work!

Lukas

> Signed-off-by: Nghia Le <nghialm78@gmail.com>
> ---
>  mm/hugetlb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 993efa70bce4..ef00e6ad0f6a 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3706,11 +3706,9 @@ static ssize_t demote_size_show(struct kobject *kobj,
>                                         struct kobj_attribute *attr, char *buf)
>  {
>         struct hstate *h;
> -       unsigned long demote_size;
>         int nid;
>
>         h = kobj_to_hstate(kobj, &nid);
> -       demote_size = h->demote_order;
>
>         return sysfs_emit(buf, "%lukB\n",
>                         (unsigned long)(PAGE_SIZE << h->demote_order) / SZ_1K);
> --
> 2.25.1
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#251): https://lists.elisa.tech/g/linux-safety/message/251
Mute This Topic: https://lists.elisa.tech/mt/86021091/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


