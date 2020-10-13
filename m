Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8229.1602582614818797112
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 02:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: 7YE3OhZH19cHbHKaIg6ceyeq5wJRDhx8I6Bl1Y9cSvJLUjBk7jnUCRamjmtX0aBanRU3pA8sIh
 WkUh9w43figg==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="165093423"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="165093423"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 02:50:02 -0700
IronPort-SDR: /ztbp2kr8ZOHXgrgY4G413bnBkrCkuvat5Z3qDqmuNfs8d+CFfrNnVr9lyzRooGb2unzhwkuHx
 qs/zWpIq6MfQ==
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="463427624"
Received: from paolonig001.ir.intel.com ([163.33.183.93])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 02:50:02 -0700
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: linux-safety@lists.elisa.tech
Cc: gabriele.paoloni@intel.com
Subject: [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
Date: Tue, 13 Oct 2020 10:49:38 +0100
Message-Id: <20201013094938.356837-3-gabriele.paoloni@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013094938.356837-1-gabriele.paoloni@intel.com>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the current implementation if the input flag is 0
oops_in_progress is unconditionally decremented, thus allowing
to become a negative number. Since right now oops_in_progress
is a global variable used in the kernel as a conditional flag
to check if oops, panic(), BUG() or die() is in progress the
current unconditional decrement may lead to unexpected behavior
in the Kernel paths conditionally executing over this flag.

This patch only decrement oops_in_progress if it is non zero

Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
---
 lib/bust_spinlocks.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
index 594b270161d9..842633ac9130 100644
--- a/lib/bust_spinlocks.c
+++ b/lib/bust_spinlocks.c
@@ -23,6 +23,9 @@
  * @yes: input flag; if zero decreases oops_in_progress,
  * otherwise increases it.
  *
+ * Note: if oops_in_progress is already 0 it will not
+ * be decreased
+ *
  */
 void bust_spinlocks(int yes)
 {
@@ -33,7 +36,9 @@ void bust_spinlocks(int yes)
 		unblank_screen();
 #endif
 		console_unblank();
-		if (--oops_in_progress == 0)
+		if (oops_in_progress)
+			oops_in_progress--;
+		if (!oops_in_progress)
 			wake_up_klogd();
 	}
 }
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
