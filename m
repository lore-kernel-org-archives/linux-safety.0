Return-Path: <SRS0=9FyY=FT=lists.elisa.tech=bounce+72012+222+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17371C4361B
	for <linux-safety@archiver.kernel.org>; Tue, 15 Dec 2020 20:16:45 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB3922B47
	for <linux-safety@archiver.kernel.org>; Tue, 15 Dec 2020 20:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB3922B47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+222+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id E4MLYY5279335xnTHGWlC1IQ; Tue, 15 Dec 2020 12:16:43 -0800
X-Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web08.1879.1608063403348746291
 for <linux-safety@lists.elisa.tech>;
 Tue, 15 Dec 2020 12:16:43 -0800
X-Received: by mail-wm1-f65.google.com with SMTP id 190so428931wmz.0
        for <linux-safety@lists.elisa.tech>; Tue, 15 Dec 2020 12:16:43 -0800 (PST)
X-Gm-Message-State: HQZKjxD90sIapapAuAsGiTRox5278000AA=
X-Google-Smtp-Source: ABdhPJyp07CyyeGRkvwcBp1uzTblfK5nAB1mSINYdhmLZ6m2Dmx+BMzg3T7jGG6q2Idc1CtECWiUiQ==
X-Received: by 2002:a1c:b082:: with SMTP id z124mr492939wme.129.1608063401802;
        Tue, 15 Dec 2020 12:16:41 -0800 (PST)
X-Received: from debian (host-92-5-250-55.as43234.net. [92.5.250.55])
        by smtp.gmail.com with ESMTPSA id t10sm38630929wrp.39.2020.12.15.12.16.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 12:16:41 -0800 (PST)
Date: Tue, 15 Dec 2020 20:16:39 +0000
From: "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
To: Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc: corbet@lwn.net, lukas.bulwahn@gmail.com, linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech, devel@driverdev.osuosl.org,
	gregkh@linuxfoundation.org
Subject: Re: [linux-safety] [PATCH] Documentation: process: Correct numbering
Message-ID: <20201215201639.cuq7xtyanbk6bxan@debian>
References: <1608061835-5118-1-git-send-email-milan.lakhani@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <1608061835-5118-1-git-send-email-milan.lakhani@codethink.co.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608063403;
 bh=w0veWaNtZhP/z0eVlQHLnsu4VH/u8x6Ta4BeOB43/t4=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=AxN027V3JC+Uv1Z3z/eHo4UL+3U9mR3Lyq1R/euGz6tU0wwfRk0ZHiy/fxozbxXeWYL
 g2OCn9zXMpixTYOU/D90DNpKHRM9Dj+mFBD2GHcjpKjIXXhOVba4Hfw5FB4ESE1Rkc+N6
 SD/KKtlqAhzTR6zoQWLkSs30qigSbjg2OtE=

Hi Milan,

On Tue, Dec 15, 2020 at 07:50:35PM +0000, Milan Lakhani wrote:
> Renumber the steps in submit-checklist.rst as some numbers were skipped.
> 
> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>

Maybe you can also add:
Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")

But I am confused about why you have added Greg and staging list instead
of 'linux-doc@vger.kernel.org'.

--
Regards
Sudip


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#222): https://lists.elisa.tech/g/linux-safety/message/222
Mute This Topic: https://lists.elisa.tech/mt/78984776/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


