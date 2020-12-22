Return-Path: <SRS0=vcPv=F2=lists.elisa.tech=bounce+72012+229+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C1FC433E0
	for <linux-safety@archiver.kernel.org>; Tue, 22 Dec 2020 16:23:25 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E2D23105
	for <linux-safety@archiver.kernel.org>; Tue, 22 Dec 2020 16:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E2D23105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+229+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id LLskYY5279335x90FFZ9j4W7; Tue, 22 Dec 2020 08:23:24 -0800
X-Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web09.13653.1608654204100315240
 for <linux-safety@lists.elisa.tech>;
 Tue, 22 Dec 2020 08:23:24 -0800
X-Received: by mail-io1-f45.google.com with SMTP id z5so12434884iob.11
        for <linux-safety@lists.elisa.tech>; Tue, 22 Dec 2020 08:23:24 -0800 (PST)
X-Gm-Message-State: ZYBl1fnicoU28S18PTWCyauex5278000AA=
X-Google-Smtp-Source: ABdhPJzhlQMVpEILVIPZ4JARLz6t9lY6qdQHVYRORmaQ6AhXWklFhgpJy6oI+dXqc9s8dBMn078l7xs0TMk8vnh+yHk=
X-Received: by 2002:a6b:6d1a:: with SMTP id a26mr18703014iod.158.1608654203503;
 Tue, 22 Dec 2020 08:23:23 -0800 (PST)
MIME-Version: 1.0
References: <1608064956-5512-1-git-send-email-milan.lakhani@codethink.co.uk> <20201221095209.4dd4233e@lwn.net>
In-Reply-To: <20201221095209.4dd4233e@lwn.net>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Tue, 22 Dec 2020 17:23:18 +0100
Message-ID: <CAKXUXMwR9i5bJx+_rXkv4SK0yU1cHpGexH9RjsN7UFqJ-Ozsew@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v2] Documentation: process: Correct numbering
To: Jonathan Corbet <corbet@lwn.net>
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-safety@lists.elisa.tech, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Christoph Hellwig <hch@lst.de>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608654204;
 bh=Jz2qDCGIx8b+nKJzBCZd0ckbxdkO6KWCjrqYio1yD00=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=G2kBU6lRbHVMmt6vD9l9+5wu3IpXcgRYA3MmwsYln5CQaG+1bz4jjnEAZdZMszxaffs
 f1yn1jIAkChLqKwsIAlZxrOX3d0xlIaVk4nkh+x6T+mCeEXjh++3UOzO8a1gxPpVR4at9
 RMgLVGoG+CkavKPE4AfC4oj/+uMo2DV7huI=

On Mon, Dec 21, 2020 at 5:52 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 15 Dec 2020 20:42:36 +0000
> Milan Lakhani <milan.lakhani@codethink.co.uk> wrote:
>
> > Renumber the steps in submit-checklist.rst as some numbers were skipped.
> >
> > Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")
> > Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> > ---
> >  Documentation/process/submit-checklist.rst | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
> > index 1879f88..230ee42 100644
> > --- a/Documentation/process/submit-checklist.rst
> > +++ b/Documentation/process/submit-checklist.rst
> > @@ -75,44 +75,44 @@ and elsewhere regarding submitting Linux kernel patches.
> >  13) Has been build- and runtime tested with and without ``CONFIG_SMP`` and
> >      ``CONFIG_PREEMPT.``
> >
> > -16) All codepaths have been exercised with all lockdep features enabled.
> > +14) All codepaths have been exercised with all lockdep features enabled.
> >
> > -17) All new ``/proc`` entries are documented under ``Documentation/``
> > +15) All new ``/proc`` entries are documented under ``Documentation/``
> [...]
>
> I've applied this, but, if you're going to stick a "Fixes" tag onto a
> patch, it's probably only polite to copy the original author.  I'm not
> fully convinced that the tag is warranted in this case.
>
> This document seems out of date in a number of ways; it could really use a
> rather more thorough updating than this.
>

Jon, I completely agree on your out-of-date comment. That is why we
pointed Milan to that checklist to start with some small basic changes
and continue with increasingly more challenging and complex updates.

Milan, next update for you to consider: what does "make headers_check"
do nowadays? (spoiler alert: it does nothing) Adjust the documentation
for that.

Then, a more general improvement: think about structuring the
checklist to follow the structure of the other submission guidelines.
So, reorder the current checklist and check if the step is mentioned
in submitting-patches and where and make the checklist much more
aligned to submitting-patches.

Lukas


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#229): https://lists.elisa.tech/g/linux-safety/message/229
Mute This Topic: https://lists.elisa.tech/mt/78985953/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


