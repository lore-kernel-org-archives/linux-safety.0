Return-Path: <SRS0=GvZH=EY=lists.elisa.tech=bounce+72012+179+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228F9C63777
	for <linux-safety@archiver.kernel.org>; Wed, 18 Nov 2020 15:16:34 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F232474A
	for <linux-safety@archiver.kernel.org>; Wed, 18 Nov 2020 15:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="fhGk/0PH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F232474A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+179+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id zKZ5YY5279335xLu0rFG19OI; Wed, 18 Nov 2020 07:16:32 -0800
X-Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.25487.1605712592432184645
 for <linux-safety@lists.elisa.tech>;
 Wed, 18 Nov 2020 07:16:32 -0800
IronPort-SDR: TrzMG9VZL73VNRKirVcJG7GWgeZx9rUJSHQOjV6QB9h/PhGsl4vm+kc3bQuYhT3aazhvfuKhe8
 qH0KtSBkikvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170348326"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="170348326"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 07:16:07 -0800
IronPort-SDR: Qdj1G/BZDfUwKBd9PGrja0yEPB2y5oIR8EVsEoULTfcS+ZmJWqFhPNXha2H4xpjI3mfdLEKQTK
 ha0EJCyBdLKQ==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="359492130"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 07:16:05 -0800
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
Subject: [linux-safety] [PATCH 4/4] x86/mce: remove redundant call to irq_work_queue()
Date: Wed, 18 Nov 2020 15:15:52 +0000
Message-Id: <20201118151552.1412-5-gabriele.paoloni@intel.com>
In-Reply-To: <20201118151552.1412-1-gabriele.paoloni@intel.com>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: niYMD9jaD8n7x4WdAaMu5vcrx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605712592;
 bh=urMRSDDFuUq/ESLV4dtwlN4pczdbLZ4KzlBEmtVo32A=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=fhGk/0PHYTSoImX8Tx2ohjGcOc2YWTmZMd/NdnXQAPgqzd396zl4BXkTkUgc5Tn76cf
 I2gVusv/g8U9SgDLaBj1opU7gelodopVzoy7vRCD8tSuTr72te4Pb7mF6dvhKejP5baXQ
 EljgawccVmBaHqCDKn+mXXO6pTkd0bcsxR0=

Right now in do_machine_check() we have:
__mc_scan_banks()->mce_log()->irq_work_queue(&mce_irq_work)

hence the call of irq_work_queue() below after __mc_scan_banks()
seems redundant. Just remove it.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index d16cbb05b09c..f2f7bfc60c67 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1407,9 +1407,6 @@ noinstr void do_machine_check(struct pt_regs *regs)
 		}
 	}
 
-	if (worst > 0)
-		irq_work_queue(&mce_irq_work);
-
 	if (worst != MCE_AR_SEVERITY && !kill_it)
 		goto out;
 
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
View/Reply Online (#179): https://lists.elisa.tech/g/linux-safety/message/179
Mute This Topic: https://lists.elisa.tech/mt/78342513/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


