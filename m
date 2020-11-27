Return-Path: <SRS0=vye9=FB=lists.elisa.tech=bounce+72012+210+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B871C3E8C5
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:32 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0597B21534
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="swy9modn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0597B21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+210+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id r215YY5279335xfDIxviay8s; Fri, 27 Nov 2020 08:18:31 -0800
X-Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.20964.1606493906000708956
 for <linux-safety@lists.elisa.tech>;
 Fri, 27 Nov 2020 08:18:31 -0800
IronPort-SDR: cz+RVS5936PBWRwAppQ8NjTbiyjGG2+lIfbHs9sz1KP5E5CruVbrTeqVuB5e49yCGdKghm+eYN
 FXJKjW+/l0fA==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="236543456"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="236543456"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:31 -0800
IronPort-SDR: R3L7FpdmHwaVEKeBO7+K7LfahIOeVMyvER/9hR1i17fDLFYSBJ3MZQja+1XSI8fItQ9uqBoh3U
 pRRkS8SQAgkQ==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="548095144"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:28 -0800
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
Subject: [linux-safety] [PATCH v2 3/5] x86/mce: for LMCE panic only if mca_cfg.tolerant < 3
Date: Fri, 27 Nov 2020 16:18:17 +0000
Message-Id: <20201127161819.3106432-4-gabriele.paoloni@intel.com>
In-Reply-To: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
References: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 6ufAk3aXMQVJuLKSyLllWERqx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606493911;
 bh=Dn0imm+oGjgAHX7Ard8Hpl+eCwv2bNecyAf2R2XG2QU=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=swy9modn+M2wqSREPp+EUZo+S5ZE/0RpNJfmQ49OfhITxrVOcD8Url6zYrpKI6dmbqh
 fOQC8SBZDMt9WRYkv0iNMFEEaADfG0DkhbFeAwlbJZjQsjKaO42p65MJJSSaMI0Y7cMoT
 Py3CxTzpnmB5xKTB++kSZtjJzgvF7an5qz0=

Right now for LMCE if no_way_out is set mce_panic() is called
regardless of mca_cfg.tolerant. This is not correct as, if
mca_cfg.tolerant = 3, the code should never panic.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 50e9b0893a92..d766a3f6a343 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1367,7 +1367,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	 * to see it will clear it.
 	 */
 	if (lmce) {
-		if (no_way_out)
+		if (no_way_out && mca_cfg.tolerant < 3)
 			mce_panic("Fatal local machine check", &m, msg);
 	} else {
 		order = mce_start(&no_way_out);
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
View/Reply Online (#210): https://lists.elisa.tech/g/linux-safety/message/210
Mute This Topic: https://lists.elisa.tech/mt/78549947/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


