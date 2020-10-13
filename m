Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.8229.1602582614818797112
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 02:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: hc5jZzK9bRo2mCqhtKNDmOgrTTDrmJRbhW0a5zMrRA/Kf3Vtyr/Tt5MST4iAwyZhqQcdcIsDBo
 igMkZRvxAGdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="165093417"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="165093417"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 02:50:00 -0700
IronPort-SDR: /jCbjjDSsDRSjyGfB1MqqRNntspMoj2Yl5HqvxpZDGdEaiyb0U+s4dgGNFugVtb2N6HEDwpF9j
 6us67uzDkxrQ==
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="463427609"
Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 02:49:59 -0700
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: linux-safety@lists.elisa.tech
Cc: gabriele.paoloni@intel.com
Subject: [RFC PATCH 1/2] bust_spinlocks: add kernel-doc format doc
Date: Tue, 13 Oct 2020 10:49:37 +0100
Message-Id: <20201013094938.356837-2-gabriele.paoloni@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013094938.356837-1-gabriele.paoloni@intel.com>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the ELISA Linux Foundation project we are trying to
improve the functions' documentation to make it more suitable
to derive functions' specs and write unit tests. This is needed
to make Linux more usable in functional safety systems.
So I am adding a proper kernel-doc format for bust_spinlocks.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
---
With respect to this patch I have a question on how to set
the function context; i.e. I don't know if it can be executed
in any context or if it has limitations.
---
 lib/bust_spinlocks.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
index 8be59f84eaea..594b270161d9 100644
--- a/lib/bust_spinlocks.c
+++ b/lib/bust_spinlocks.c
@@ -5,8 +5,6 @@
  * Provides a minimal bust_spinlocks for architectures which don't
  * have one of their own.
  *
- * bust_spinlocks() clears any spinlocks which would prevent oops, die(), BUG()
- * and panic() information from reaching the user.
  */
 
 #include <linux/kernel.h>
@@ -17,6 +15,15 @@
 #include <linux/vt_kern.h>
 #include <linux/console.h>
 
+/**
+ * bust_spinlocks - increases or decreases oops_in_progress.
+ * if oops_in_progress != 0 spinlocks which would prevent
+ * oops, die(), BUG() and panic() information from reaching
+ * the user are busted.
+ * @yes: input flag; if zero decreases oops_in_progress,
+ * otherwise increases it.
+ *
+ */
 void bust_spinlocks(int yes)
 {
 	if (yes) {
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
