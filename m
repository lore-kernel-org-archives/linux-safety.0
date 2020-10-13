Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.8224.1602582604220276914
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 02:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: rgcysVXE5qMwNOsFY9FzjrtsRJN1/kKzjn3G3AxloCBF1IqXDneJMVBCgzI8Z5WrIQj21o/0yN
 y1YebdsylXUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="227521198"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="227521198"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 02:49:50 -0700
IronPort-SDR: BpFXEhYaTR0+VeV7fg0pMLUuBXpuhjJQlLqCy03/BTve9La9/dQSefuB2dsDz5eIWaakbcTsAq
 ScS55OQc2Aog==
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="463427562"
Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 02:49:49 -0700
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: linux-safety@lists.elisa.tech
Cc: gabriele.paoloni@intel.com
Subject: [RFC PATCH 0/2] improve bust_spinlocks dependability
Date: Tue, 13 Oct 2020 10:49:36 +0100
Message-Id: <20201013094938.356837-1-gabriele.paoloni@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset provides a kernel-doc documentation format
for bust_spinlocks() and fixes a weakness where the global
variable oops_in_progress gets unconditionally decremented

Gabriele Paoloni (2):
  bust_spinlocks: add kernel-doc format doc
  bust_spinlocks: do not decrement oops_in_progress unconditionally

 lib/bust_spinlocks.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

-- 
2.25.1

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
