Return-Path: <SRS0=cn1V=FB=lists.elisa.tech=bounce+72012+212+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DE6C3E8C5
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:36 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDD82223F
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="jMl32CIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CDD82223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+212+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id Q5HWYY5279335xm0WND5SXs2; Fri, 27 Nov 2020 08:18:36 -0800
X-Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.20964.1606493906000708956
 for <linux-safety@lists.elisa.tech>;
 Fri, 27 Nov 2020 08:18:36 -0800
IronPort-SDR: V5Kv/x9f42NBP+l4wSNHUtwGW81RKTLUFSnANAYUlIiRyoZxUEc0eVz9qRFfkcxaK7jHzVIYr7
 8sU8A6XcDw0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="236543465"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="236543465"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:35 -0800
IronPort-SDR: 4VpXVwaAo5p2D9bQaGy9uojCA1TWHWQumUv8bqM7lWNzcxc56DDhQq8JqftyXhyoiCbpvYoDml
 ilFJOE0+OD2Q==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="548095177"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:33 -0800
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
Subject: [linux-safety] [PATCH v2 5/5] x86/mce: rename kill_it as kill_current_task
Date: Fri, 27 Nov 2020 16:18:19 +0000
Message-Id: <20201127161819.3106432-6-gabriele.paoloni@intel.com>
In-Reply-To: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
References: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 5ZaF4Bc8JgcSesiiMxfoZzvBx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606493916;
 bh=NSlUO70SfvQyEFRtDS9Y0ge/lBX/vaOgifyrY9Rx69E=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=jMl32CIF34m3IlwjZ606TC7HeZBwSEu8a01DsHv0c1POJNL+Aatik2gxyQMV49nGLEc
 wZIq/1xbVZ7nVovJjZ0uPvJG4ajMZOtz9pb+CUNIDSGTEIAMZGnJrXUoi3aZDpKo1A+/q
 q+leuTobKXtQuqjC6YW+1R2Yx1APBCJMPb8=

Currently if an MCE happens in user-mode or while the kernel
is copying data from user space, 'kill_it' is used to check
if we can recover the execution of the interrupted task or
not; the flag name however is not much meaningful, hence
rename it to match its goal.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 802302c54762..740a4fcc1e90 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1320,10 +1320,10 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	int no_way_out = 0;
 
 	/*
-	 * If kill_it gets set, there might be a way to recover from this
+	 * If kill_current_task is not set, there might be a way to recover from this
 	 * error.
 	 */
-	int kill_it = 0;
+	int kill_current_task = 0;
 
 	/*
 	 * MCEs are always local on AMD. Same is determined by MCG_STATUS_LMCES
@@ -1350,7 +1350,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	 * severity is MCE_AR_SEVERITY we have other options.
 	 */
 	if (!(m.mcgstatus & MCG_STATUS_RIPV))
-		kill_it = (cfg->tolerant == 3) ? 0 : 1;
+		kill_current_task = (cfg->tolerant == 3) ? 0 : 1;
 	/*
 	 * Check if this MCE is signaled to only this logical processor,
 	 * on Intel, Zhaoxin only.
@@ -1408,7 +1408,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
 		}
 	}
 
-	if (worst != MCE_AR_SEVERITY && !kill_it)
+	if (worst != MCE_AR_SEVERITY && !kill_current_task)
 		goto out;
 
 	/* Fault was in user mode and we need to take some action */
@@ -1416,7 +1416,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
 		/* If this triggers there is no way to recover. Die hard. */
 		BUG_ON(!on_thread_stack() || !user_mode(regs));
 
-		queue_task_work(&m, kill_it);
+		queue_task_work(&m, kill_current_task);
 
 	} else {
 		/*
@@ -1434,7 +1434,7 @@ noinstr void do_machine_check(struct pt_regs *regs)
 		}
 
 		if (m.kflags & MCE_IN_KERNEL_COPYIN)
-			queue_task_work(&m, kill_it);
+			queue_task_work(&m, kill_current_task);
 	}
 out:
 	mce_wrmsrl(MSR_IA32_MCG_STATUS, 0);
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
View/Reply Online (#212): https://lists.elisa.tech/g/linux-safety/message/212
Mute This Topic: https://lists.elisa.tech/mt/78549949/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


