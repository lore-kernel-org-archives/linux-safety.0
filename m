Return-Path: <SRS0=BEwB=FB=lists.elisa.tech=bounce+72012+209+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C23C63798
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:29 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 410FD21534
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="siFXL7VG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 410FD21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+209+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id znAEYY5279335xF2NBJZoehb; Fri, 27 Nov 2020 08:18:29 -0800
X-Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.20964.1606493906000708956
 for <linux-safety@lists.elisa.tech>;
 Fri, 27 Nov 2020 08:18:28 -0800
IronPort-SDR: oZYS0IYhDArGy3HcoT3wxKfGKebS1/6Mob6KqTnRbZoGf0iLLY+MmbobFlpn94BJRCdKz1oPys
 jRP/GO3xx1RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="236543452"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="236543452"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:28 -0800
IronPort-SDR: U5sPqM2Z6LrYhlajZNXbSVjbGR6s385DfcOE4fru4a1Jz1+7ifAz+XNrMKnSl8vkFqRF7V+cWH
 9jk3F3fbNxiw==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="548095130"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:26 -0800
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
Subject: [linux-safety] [PATCH v2 2/5] x86/mce: move the mce_panic() call and 'kill_it' assignments to the right places
Date: Fri, 27 Nov 2020 16:18:16 +0000
Message-Id: <20201127161819.3106432-3-gabriele.paoloni@intel.com>
In-Reply-To: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
References: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: f7zpZgDBWqGf9oObQMZQyUYrx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606493909;
 bh=UMKXH7I2v4pUZC280FYbGNNQsftdYAnQsbFzi5XCXqM=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=siFXL7VGE93bIthwhWWMl1w09CzDF3ganHUJDc3C05NIp/BzzaKRHJR7YXmSc+us0KS
 d2pVnvlUdI0QLRW+67QdLswzfj+/qQzqDnqne6yf8OjK6cSUVB9yik+Uq7FLBr55OrZXS
 Ekj1xxIil443b+dp+yWsOvAsV+DIBRlpIIk=

Right now for local MCEs we panic(),if needed, right after lmce is
set. For global MCEs mce_reign() takes care of calling mce_panic().
Hence:
- improve readibility by moving the conditional evaluation of
tolerant up to when kill_it is set first;
- move the mce_panic() call up into the statement where mce_end()
fails.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 32b7099e3511..50e9b0893a92 100644
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
@@ -1387,6 +1386,12 @@ noinstr void do_machine_check(struct pt_regs *regs)
 		if (mce_end(order) < 0) {
 			if (!no_way_out)
 				no_way_out = worst >= MCE_PANIC_SEVERITY;
+			/*
+			 * mce_reign() has probably failed hence evaluate if we need
+			 * to panic
+			 */
+			if (no_way_out && mca_cfg.tolerant < 3)
+				mce_panic("Fatal machine check on current CPU", &m, msg);
 		}
 	} else {
 		/*
@@ -1403,15 +1408,6 @@ noinstr void do_machine_check(struct pt_regs *regs)
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
View/Reply Online (#209): https://lists.elisa.tech/g/linux-safety/message/209
Mute This Topic: https://lists.elisa.tech/mt/78549945/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


