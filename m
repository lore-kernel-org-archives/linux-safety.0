Return-Path: <SRS0=IK74=FB=lists.elisa.tech=bounce+72012+208+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EAEC3E8C5
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:28 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A5C2223D
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="kHlkIPIM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87A5C2223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+208+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id LBiMYY5279335xhtQIMTY1Ce; Fri, 27 Nov 2020 08:18:27 -0800
X-Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.20964.1606493906000708956
 for <linux-safety@lists.elisa.tech>;
 Fri, 27 Nov 2020 08:18:27 -0800
IronPort-SDR: NGEBxS9ItOoRY2WHlNR1eTtjtYSSpEJ9qc7Zk5eAYjX7ctm/+lRRAIQR75AFPHLHsnhdqJqOXH
 ZdPPeiYjItrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="236543449"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="236543449"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:26 -0800
IronPort-SDR: FSYa2JxjTM/bJugn698bg9ey7Rjg+V1wbeMYGMF/zoqOfJi4Ph1GHuSbd+6GG+Fj/V0u55NX0J
 2MLx55m1QarA==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="548095109"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:23 -0800
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
Subject: [linux-safety] [PATCH v2 1/5] x86/mce: do not overwrite no_way_out if mce_end() fails
Date: Fri, 27 Nov 2020 16:18:15 +0000
Message-Id: <20201127161819.3106432-2-gabriele.paoloni@intel.com>
In-Reply-To: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
References: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: c2RLz8UVRXkWObxaj6VxRRtZx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606493907;
 bh=kyw7dagKDcwHJE6A1vIRReUqzDk1j+dylFKFAtm/CzA=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=kHlkIPIMOPRvgz3E68YPcnGPXX578Swwo6jjOfYlfpY86fh9MjMXZUi6mnTR6PUB+pR
 8vKxnftz0tSZ0KPebFoLrukWCR5Jgz1Skl3syEPlz20ywSV/WbHxxwiMKLK8FPvJc5yZO
 0+2wvqxSmd8Pil+6YSkjqk5D7Zwh/Ta4e8o=

Currently if mce_end() fails 'no_way_out' is set equal to 'worst'.
'worst' is the worst severity that was found across the MCA banks
associated with the current CPU; however at this point 'no_way_out'
could have been already set by mca_start() by looking at all
severities of all CPUs that entered the MCE handler.
If mce_end() fails, check first if no_way_out is already set and,
if so, stick to it, otherwise use the local worst value.

Cc: <stable@vger.kernel.org>
Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 4102b866e7c0..32b7099e3511 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1384,8 +1384,10 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	 * When there's any problem use only local no_way_out state.
 	 */
 	if (!lmce) {
-		if (mce_end(order) < 0)
-			no_way_out = worst >= MCE_PANIC_SEVERITY;
+		if (mce_end(order) < 0) {
+			if (!no_way_out)
+				no_way_out = worst >= MCE_PANIC_SEVERITY;
+		}
 	} else {
 		/*
 		 * If there was a fatal machine check we should have
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
View/Reply Online (#208): https://lists.elisa.tech/g/linux-safety/message/208
Mute This Topic: https://lists.elisa.tech/mt/78549944/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


