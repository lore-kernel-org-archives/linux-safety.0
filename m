Return-Path: <SRS0=J21W=FB=lists.elisa.tech=bounce+72012+211+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648DFC63798
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:34 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFCB21534
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="mr4yNVBw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DFCB21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+211+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id T6ooYY5279335xC4DSR2l9Q2; Fri, 27 Nov 2020 08:18:33 -0800
X-Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.20964.1606493906000708956
 for <linux-safety@lists.elisa.tech>;
 Fri, 27 Nov 2020 08:18:33 -0800
IronPort-SDR: nOKXzg8iDU6BFd2rfqGPI0bw7kv4r1QopC+bpZHbO01Had0mKTiHRUz7Sf7jgkm7MC+fYshiWW
 LpYIHa8YVc2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="236543460"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="236543460"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:33 -0800
IronPort-SDR: LNRD34yjDKhKsejH9usrAuRXFZh1h9gtsXH3CebUPDjWub2FJGJHN03b1fseTFWRiEy4qQ0YV2
 PlGvHyJk9HFA==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="548095161"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:31 -0800
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
Subject: [linux-safety] [PATCH v2 4/5] x86/mce: remove redundant call to irq_work_queue()
Date: Fri, 27 Nov 2020 16:18:18 +0000
Message-Id: <20201127161819.3106432-5-gabriele.paoloni@intel.com>
In-Reply-To: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
References: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: mlPf5btCB5lo3MvHLxrxYAp7x5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606493913;
 bh=2crtWspoj4OrC4YPp5UD6nLFCfij4H+LfwTxZPWssrU=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=mr4yNVBwoGPmxq5yObohDc6+1wo55Wvte51/A3NjDMVx7MEEovqlZ9eFyvQUUB848+V
 c41tGSKkz9uo10+K+32Ag9kB2i/MiFPFkeok5s3fDe3WPD4NNwlF7IOeE740LJr9VDD/9
 C+CNUbmYz9U/M2z+3/lGPSwDvIxhYZLU854=

Right now in do_machine_check() __mc_scan_banks() triggers
the following call tree:
__mc_scan_banks()->mce_log()->irq_work_queue(&mce_irq_work).

Hence the call of irq_work_queue() below after __mc_scan_banks()
seems redundant. Just remove it.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index d766a3f6a343..802302c54762 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1408,9 +1408,6 @@ noinstr void do_machine_check(struct pt_regs *regs)
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
View/Reply Online (#211): https://lists.elisa.tech/g/linux-safety/message/211
Mute This Topic: https://lists.elisa.tech/mt/78549948/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


