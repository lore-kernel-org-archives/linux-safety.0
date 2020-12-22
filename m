Return-Path: <SRS0=Cjd3=F2=lists.elisa.tech=bounce+72012+230+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B33EC433DB
	for <linux-safety@archiver.kernel.org>; Tue, 22 Dec 2020 17:11:27 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D642823103
	for <linux-safety@archiver.kernel.org>; Tue, 22 Dec 2020 17:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D642823103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+230+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id vydCYY5279335xzuxtcmVXbP; Tue, 22 Dec 2020 09:11:26 -0800
X-Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web09.14388.1608657085980437885
 for <linux-safety@lists.elisa.tech>;
 Tue, 22 Dec 2020 09:11:26 -0800
X-Received: by mail-il1-f179.google.com with SMTP id w12so12595851ilm.12
        for <linux-safety@lists.elisa.tech>; Tue, 22 Dec 2020 09:11:25 -0800 (PST)
X-Gm-Message-State: 1xH1UtJ9z11jbEO1d97RIScox5278000AA=
X-Google-Smtp-Source: ABdhPJyjewsF6LN9BzDE3u42TsMLG/EfcpvoC9t225/gplNBE3msFizR70EcnejPc1vXA1P5F1kTLaVC8Y3sxdjTJRk=
X-Received: by 2002:a92:512:: with SMTP id q18mr21940753ile.147.1608657085336;
 Tue, 22 Dec 2020 09:11:25 -0800 (PST)
MIME-Version: 1.0
References: <1608064956-5512-1-git-send-email-milan.lakhani@codethink.co.uk>
 <20201221095209.4dd4233e@lwn.net> <CAKXUXMwR9i5bJx+_rXkv4SK0yU1cHpGexH9RjsN7UFqJ-Ozsew@mail.gmail.com>
 <7a6ab1d3-a5f5-d4ae-61e2-0a52419732f6@infradead.org>
In-Reply-To: <7a6ab1d3-a5f5-d4ae-61e2-0a52419732f6@infradead.org>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Tue, 22 Dec 2020 18:11:14 +0100
Message-ID: <CAKXUXMxU1EQ+n+AsiQWNPxx=iO-U_e1V6dwqABbn=uJ8CCxepw@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH v2] Documentation: process: Correct numbering
To: Randy Dunlap <rdunlap@infradead.org>, Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>, 
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608657086;
 bh=fl/ncmammFOfK6yoIMrxGV+hCAyrGjvIQC2OihVphC0=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=k+HmFo/dJ2cwtciktw56a2bXP+foieOThhIdMG29M4Bxbc+DYP1nmGuod9SNvdsE4Ex
 pN87LkawZJLRVdnmHItPgYc9mBhECR4sjIg+jYzimG8TLpLz2uOKIVbUUYYvLP4D9UQMP
 G0oiiVsP0BSWGSGZ3RjBqZV5UvkZV5XkBCY=

On Tue, Dec 22, 2020 at 5:36 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 12/22/20 8:23 AM, Lukas Bulwahn wrote:
> > On Mon, Dec 21, 2020 at 5:52 PM Jonathan Corbet <corbet@lwn.net> wrote:
> >>
> >> On Tue, 15 Dec 2020 20:42:36 +0000
> >> Milan Lakhani <milan.lakhani@codethink.co.uk> wrote:
> >>
> >>> Renumber the steps in submit-checklist.rst as some numbers were skipped.
> >>>
> >>> Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")
> >>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> >>> ---
> >>>  Documentation/process/submit-checklist.rst | 24 ++++++++++++------------
> >>>  1 file changed, 12 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
> >>> index 1879f88..230ee42 100644
> >>> --- a/Documentation/process/submit-checklist.rst
> >>> +++ b/Documentation/process/submit-checklist.rst
> >>> @@ -75,44 +75,44 @@ and elsewhere regarding submitting Linux kernel patches.
> >>>  13) Has been build- and runtime tested with and without ``CONFIG_SMP`` and
> >>>      ``CONFIG_PREEMPT.``
> >>>
> >>> -16) All codepaths have been exercised with all lockdep features enabled.
> >>> +14) All codepaths have been exercised with all lockdep features enabled.
> >>>
> >>> -17) All new ``/proc`` entries are documented under ``Documentation/``
> >>> +15) All new ``/proc`` entries are documented under ``Documentation/``
> >> [...]
> >>
> >> I've applied this, but, if you're going to stick a "Fixes" tag onto a
> >> patch, it's probably only polite to copy the original author.  I'm not
> >> fully convinced that the tag is warranted in this case.
> >>
> >> This document seems out of date in a number of ways; it could really use a
> >> rather more thorough updating than this.
> >>
> >
> > Jon, I completely agree on your out-of-date comment. That is why we
> > pointed Milan to that checklist to start with some small basic changes
> > and continue with increasingly more challenging and complex updates.
> >
> > Milan, next update for you to consider: what does "make headers_check"
> > do nowadays? (spoiler alert: it does nothing) Adjust the documentation
> > for that.
> >
> > Then, a more general improvement: think about structuring the
> > checklist to follow the structure of the other submission guidelines.
> > So, reorder the current checklist and check if the step is mentioned
> > in submitting-patches and where and make the checklist much more
> > aligned to submitting-patches.
>
> Please do not move item #1. It is #1 for a reason.
>

Randy, thanks for your hint.

We will consider that. I never considered this list ordered by
priority but maybe somebody did really consider it with those
priorities. To me, it seemed rather randomly sorted (with some
duplicates) or somehow sorted by the various topics a patch might
touch (e.g., some rules on Kconfig, then some rules for device
drivers, then some on documenting APIs, then some on testing options).

Interestingly, I could not find any mention of checklist item #1 in
development-process.rst and further linked pages, despite it being
very explicit on various other points.

Just for the record on my investigation, it is also not mentioned in
submitting-patches, which I did not expect, though, because that guide
touches more on the specific stage of preparing a submission than on
the creation of a code change.

So, if item #1 is so important to the development process, it might
deserve to be mentioned elsewhere with some explanation as well.

Side remark: I am also wondering if a clang-tidy check could actually
check that property of proper includes with a quick rule; that would
be a nice showcase for clang-tidy if that can be implemented quickly.

Milan, you see there is quite some potential work here.

Milan, maybe you can find some good way of structuring the checklist
and make sure that #1 is still clear to be most important.

I am happy to assist you, Milan, on improving this checklist.

Lukas


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#230): https://lists.elisa.tech/g/linux-safety/message/230
Mute This Topic: https://lists.elisa.tech/mt/78985953/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


