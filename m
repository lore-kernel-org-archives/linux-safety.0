Return-Path: <SRS0=2iPR=EY=lists.elisa.tech=bounce+72012+175+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CE6C5519F
	for <linux-safety@archiver.kernel.org>; Wed, 18 Nov 2020 15:16:08 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E9624756
	for <linux-safety@archiver.kernel.org>; Wed, 18 Nov 2020 15:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="pdpIoNDO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E9624756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+175+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id K9HmYY5279335xMpMXxZE5Hz; Wed, 18 Nov 2020 07:16:07 -0800
X-Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.25539.1605712566306509535
 for <linux-safety@lists.elisa.tech>;
 Wed, 18 Nov 2020 07:16:06 -0800
IronPort-SDR: ax7yLwjO3q/M7P2Ua6ulWSuVor6FFYdJ6O4mw0oS/uLz425Zx2kwe0sFGbPZCq5Eo26jVoZdFA
 SCzWWg0et0ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170348275"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="170348275"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 07:15:58 -0800
IronPort-SDR: aTiYNJ44AM906CS+zhEMRp2fvFfXKQF7b6rvBGJ5Nwf/0Q3nXU6P0X3HedyxnM0djnyMjcm5o6
 OaFbHH0nu8Iw==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="359492060"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 07:15:56 -0800
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	mingo@redhat.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gabriele.paoloni@intel.com,
	linux-safety@lists.elisa.tech
Subject: [linux-safety] [PATCH 0/4] x86/MCE: some minor fixes
Date: Wed, 18 Nov 2020 15:15:48 +0000
Message-Id: <20201118151552.1412-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 8CsPBPYN8RmwOjQqwbHvwgaqx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605712567;
 bh=J9fdLIxtLApJ8AIhMkIWCI7VAdvPhnaCgzRgG87KQYE=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=pdpIoNDOaJcGFqNWC0/M+QyGKplde/bM56zYFqfEHpcat/J9e/N/PbgYp7n+uIbOWC+
 PjmS7FlIR113/0pfS9qHvn5bZLTnXAVLNDp7MmMZvzJSBFkkM/lCbatocWUrN13G6gap/
 aWPNDL0jxFIPK1EdNPCgQCoz+OdifBYRKxU=

During the safety analysis that was done in the context of the
ELISA project by the safety architecture working group some
incorrectnesses were spotted.
This patchset proposes some fixes.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>

Gabriele Paoloni (4):
  x86/mce: do not overwrite no_way_out if mce_end() fails
  x86/mce: move the mce_panic() call and kill_it assignments at the
    right places
  x86/mce: for LMCE panic only if mca_cfg.tolerant < 3
  x86/mce: remove redundant call to irq_work_queue()

 arch/x86/kernel/cpu/mce/core.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

-- 
2.20.1

---------------------------------------------------------------------
INTEL CORPORATION ITALIA S.p.A. con unico socio
Sede: Milanofiori Palazzo E 4 
CAP 20094 Assago (MI)
Capitale Sociale Euro 104.000,00 interamente versato
Partita I.V.A. e Codice Fiscale  04236760155
Repertorio Economico Amministrativo n. 997124 
Registro delle Imprese di Milano nr. 183983/5281/33
Soggetta ad attivita' di direzione e coordinamento di 
INTEL CORPORATION, USA

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#175): https://lists.elisa.tech/g/linux-safety/message/175
Mute This Topic: https://lists.elisa.tech/mt/78342499/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


