Return-Path: <SRS0=9g8U=OW=lists.elisa.tech=bounce+72012+248+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C4BC433EF
	for <linux-safety@archiver.kernel.org>; Sat,  2 Oct 2021 05:14:07 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6373261ACE
	for <linux-safety@archiver.kernel.org>; Sat,  2 Oct 2021 05:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6373261ACE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id 3CvtYY5279335xXLR9aME3R4; Fri, 01 Oct 2021 22:14:05 -0700
X-Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web08.7511.1633151645433211843
 for <linux-safety@lists.elisa.tech>;
 Fri, 01 Oct 2021 22:14:05 -0700
X-Received: by mail-yb1-f178.google.com with SMTP id u32so24834319ybd.9
        for <linux-safety@lists.elisa.tech>; Fri, 01 Oct 2021 22:14:05 -0700 (PDT)
X-Gm-Message-State: TAilnqKoCJYjbsvS3kJPLZW1x5278000AA=
X-Google-Smtp-Source: ABdhPJx7MH6NbIOMB0h50FqrVMFJU1vlj6wEMWECxnA14s0RVkxu7c8CkNddMyBVvDRX9z8pYy9H+zFARY8qWX/66hA=
X-Received: by 2002:a25:accb:: with SMTP id x11mr1801161ybd.154.1633151644552;
 Fri, 01 Oct 2021 22:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211001175732.75170-1-nghialm78@gmail.com>
In-Reply-To: <20211001175732.75170-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Sat, 2 Oct 2021 07:13:54 +0200
Message-ID: <CAKXUXMwT+dH_OZc_eJBMtSfbcL5hvhBoFXXbd1b_AcM2sBvW0A@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] mm/hugetlb.c: remove deadstore in demote_size_show()
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1633151645;
 bh=UNTB+Yk05hdHBG9MuOi851aAJKnDWdZgmDw0rezYD3Y=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=uWI66dCvmoK2e5OazCb0Bozwwa2Nler3pxZ+hVQCW3rH4qVVPEs8+OicxEdxpYl60dQ
 ggpS1jdUeGCo0HUeGT0Rp6ocU35045aN2Ik1U2t+3voZrwJTBBgNkqA6968uNHqjQhLvZ
 OFgMbYSN1tGtv32lzme9fxxQ3NpjC54Rl5A=
Message-ID: <20211002051354.qdjess0X7tnBh3ITiRD3ypzjM7tEDUl97uXO8b7ilNU@z>

Just some minor improvements for the language:

On Fri, Oct 1, 2021 at 7:57 PM Nghia Le <nghialm78@gmail.com> wrote:
>
> Deadstore was detected by CodeCheck tool (ELISA group)

Hints:
  - Use active instead of passive tense
  - It is detected by "make clang-analyzer". The CodeChecker tool is
just the webUI frontend.
  - Dead store is written as two words (with a space between dead and store).

So, make it:
The command "make clang-analyzer" detected a dead store.

>
> Removed demote_size and relevant assignment in function demote_size_show()
> to fix deadstore issue of which stored value to demote_size is never read
>

Hints:
  - Use imperative form.
  - ... and just some better English grammar.

So make it:
Remove demote_size and corresponding assignment in function demote_size_show()
to fix dead store, as demote_size is never read.

Also change deadstore to dead store in subject.

Other than that, it looks good to me.

Send a PATCH v2 here. Then, we check again and you can send the patch
out to the maintainers.

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
View/Reply Online (#248): https://lists.elisa.tech/g/linux-safety/message/248
Mute This Topic: https://lists.elisa.tech/mt/86006510/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


