Return-Path: <SRS0=aO5T=FB=lists.elisa.tech=bounce+72012+207+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BB0C64E7A
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:28 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774332222C
	for <linux-safety@archiver.kernel.org>; Fri, 27 Nov 2020 16:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="YvDGc+Am"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774332222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+207+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id bJytYY5279335xGVECmP74mg; Fri, 27 Nov 2020 08:18:26 -0800
X-Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.20964.1606493906000708956
 for <linux-safety@lists.elisa.tech>;
 Fri, 27 Nov 2020 08:18:26 -0800
IronPort-SDR: rL7WHmWzk35s+eZxgTWc+oQI7v4czNWRK1BPBVw9g7v/dA0C+6Knq0on20f8YgWl+5oJL4oTtt
 4iv4ud+FbNPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="236543447"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="236543447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:23 -0800
IronPort-SDR: T/NWv4uCOBGKnlk2FygWraXekl408JsHQNbQYeOPsnFR037rmidmuwBhpKYYyBXX6kEtHakYr8
 esiAIiCl+mpQ==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="548095098"
X-Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 08:18:21 -0800
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
Subject: [linux-safety] [PATCH v2 0/5] x86/MCE: some minor fixes
Date: Fri, 27 Nov 2020 16:18:14 +0000
Message-Id: <20201127161819.3106432-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 1JSfXci9b8RDHCQdC7AedFNXx5278000AA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606493906;
 bh=lsRXVnHQnRL41Ztj7d6iO+Di7AfgeCnBFHEBszdnHu8=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=YvDGc+Am6GXomabjMrVSlc/m6vGe0o92lVuUdWpPYa/bbWg12nO/GvErpmF4k9ZDuSy
 17JgrTsqIrDRERWUDL38ViXzFOdWePA73t+2eLysSWZKCxZdGifMjQBSlKl2ka9N2SFWR
 c2ed/Lm86sbfalS8P5ydGWr+82e8UgRANNA=

During the safety analysis that was done in the context of the
ELISA project by the safety architecture working group some
incorrectnesses were spotted.
This patchset proposes some fixes.

Changes since v1:
- fixed grammar
- improved readibility of patch1 and Cc'd for stable
- kill_it flag renamed to kill_current_task

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>

Gabriele Paoloni (5):
  x86/mce: do not overwrite no_way_out if mce_end() fails
  x86/mce: move the mce_panic() call and 'kill_it' assignments to the
    right places
  x86/mce: for LMCE panic only if mca_cfg.tolerant < 3
  x86/mce: remove redundant call to irq_work_queue()
  x86/mce: rename kill_it as kill_current_task

 arch/x86/kernel/cpu/mce/core.c | 39 +++++++++++++++-------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

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
View/Reply Online (#207): https://lists.elisa.tech/g/linux-safety/message/207
Mute This Topic: https://lists.elisa.tech/mt/78549943/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


