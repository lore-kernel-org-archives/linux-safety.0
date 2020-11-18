Return-Path: <SRS0=de7N=EY=lists.elisa.tech=bounce+72012+178+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A98C63798
	for <linux-safety@archiver.kernel.org>; Wed, 18 Nov 2020 15:16:09 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7DC924757
	for <linux-safety@archiver.kernel.org>; Wed, 18 Nov 2020 15:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="nUUHWzWr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7DC924757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+178+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id ZOr1YY5279335x7bSojrU1NW; Wed, 18 Nov 2020 07:16:08 -0800
X-Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.25539.1605712566306509535
 for <linux-safety@lists.elisa.tech>;
 Wed, 18 Nov 2020 07:16:07 -0800
IronPort-SDR: u8yZ8bvW9zk9qLjDRzes41gW8z8meOyg+RD8YFeoEBjNln5JbM8Hsqynz8k1GKqVx2PRnsNfmA
 4zN6j4AxvREQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170348298"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="170348298"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 07:16:03 -0800
IronPort-SDR: YsAkNBARL3HuPONP6kRUnF11yeoR3+ZaUcpZskIYpOJG2DWYRZUtTZ+eTWadQ2Lq3sjmZnV/4z
 mSsF6lGpIX9Q==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="359492091"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 07:16:01 -0800
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
Subject: [linux-safety] [PATCH 2/4] x86/mce: move the mce_panic() call and kill_it assignments at the right places
Date: Wed, 18 Nov 2020 15:15:50 +0000
Message-Id: <20201118151552.1412-3-gabriele.paoloni@intel.com>
In-Reply-To: <20201118151552.1412-1-gabriele.paoloni@intel.com>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: khGeHOmHFrJeC5QA7prJVu0Zx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605712568;
 bh=MGL9kqcV1ZtnwFSiTS0cF2Zfu5ahmWUQR7pNnXGC7OQ=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=nUUHWzWri3LWKxJbaYVex5PUOx/V1xUuEErilc9UWrNptvQMvunFS6BH3CALf2nVrJS
 poF8mr1O4eKYJ6t2faBDXmqJRiZAv18vBmmhgHFIz0oXXC88CCRs2KA/MfP7xschRGn6T
 DSmFgNTfOhaZywnGUHQyoVSci24o5lBkj4Q=

Right now for local MCEs we panic(),if needed, right after lmce is
set. For global MCEs mce_reign() takes care of calling mce_panic().
Hence this patch:
- improves readibility by moving the conditional evaluation of
tolerant up to when kill_it is set first
- moves the mce_panic() call up into the statement where mce_end()
fails

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index b990892c6766..e025ff04438f 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1350,8 +1350,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	 * severity is MCE_AR_SEVERITY we have other options.
 	 */
 	if (!(m.mcgstatus & MCG_STATUS_RIPV))
-		kill_it = 1;
-
+		kill_it = (cfg->tolerant == 3) ? 0 : 1;
 	/*
 	 * Check if this MCE is signaled to only this logical processor,
 	 * on Intel, Zhaoxin only.
@@ -1384,8 +1383,15 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	 * When there's any problem use only local no_way_out state.
 	 */
 	if (!lmce) {
-		if (mce_end(order) < 0)
+		if (mce_end(order) < 0) {
 			no_way_out = no_way_out ? no_way_out : worst >= MCE_PANIC_SEVERITY;
+			/*
+			 * mce_reign() has probably failed hence evaluate if we need
+			 * to panic
+			 */
+			if (no_way_out && mca_cfg.tolerant < 3)
+				mce_panic("Fatal machine check on current CPU", &m, msg);
+		}
 	} else {
 		/*
 		 * If there was a fatal machine check we should have
@@ -1401,15 +1407,6 @@ noinstr void do_machine_check(struct pt_regs *regs)
 		}
 	}
 
-	/*
-	 * If tolerant is at an insane level we drop requests to kill
-	 * processes and continue even when there is no way out.
-	 */
-	if (cfg->tolerant == 3)
-		kill_it = 0;
-	else if (no_way_out)
-		mce_panic("Fatal machine check on current CPU", &m, msg);
-
 	if (worst > 0)
 		irq_work_queue(&mce_irq_work);
 
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
View/Reply Online (#178): https://lists.elisa.tech/g/linux-safety/message/178
Mute This Topic: https://lists.elisa.tech/mt/78342502/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


