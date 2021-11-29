Return-Path: <milan.lakhani@codethink.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6991C433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:01:38 +0000 (UTC)
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web10.62079.1638198096871226711
 for <linux-safety@lists.elisa.tech>;
 Mon, 29 Nov 2021 07:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: milan.lakhani@codethink.co.uk)
Received: from [90.200.202.165] (helo=ubuntu.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mri9m-0000SZ-Bc; Mon, 29 Nov 2021 15:01:26 +0000
From: Milan Lakhani <milan.lakhani@codethink.co.uk>
To: linux-safety@lists.elisa.tech,
	lukas.bulwahn@gmail.com,
	sudip.mukherjee@codethink.co.uk
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [PATCH] staging: net: Tidy codeblocks and remove unused assignments
Date: Mon, 29 Nov 2021 15:01:17 +0000
Message-Id: <20211129150117.3220-1-milan.lakhani@codethink.co.uk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Mon, 29 Nov 2021 15:01:38 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/264

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 .../net/wireless/marvell/mwifiex/debugfs.c    | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/debugfs.c b/drivers/net/wireless/marvell/mwifiex/debugfs.c
index dded92db1f37..7051d1066dab 100644
--- a/drivers/net/wireless/marvell/mwifiex/debugfs.c
+++ b/drivers/net/wireless/marvell/mwifiex/debugfs.c
@@ -471,33 +471,33 @@ mwifiex_regrdwr_read(struct file *file, char __user *ubuf,
 
 	if (!saved_reg_type) {
 		/* No command has been given */
-		pos += snprintf(buf, PAGE_SIZE, "0");
 		goto done;
 	}
-	/* Set command has been given */
+
 	if (saved_reg_value != UINT_MAX) {
-		ret = mwifiex_reg_write(priv, saved_reg_type, saved_reg_offset,
-					saved_reg_value);
+		/* Set command has been given */
+		mwifiex_reg_write(priv, saved_reg_type, saved_reg_offset,
+				saved_reg_value);
 
 		pos += snprintf(buf, PAGE_SIZE, "%u 0x%x 0x%x\n",
 				saved_reg_type, saved_reg_offset,
 				saved_reg_value);
 
-		ret = simple_read_from_buffer(ubuf, count, ppos, buf, pos);
+	} else {
+		/* Get command has been given */
+		ret = mwifiex_reg_read(priv, saved_reg_type,
+				saved_reg_offset, &reg_value);
 
-		goto done;
-	}
-	/* Get command has been given */
-	ret = mwifiex_reg_read(priv, saved_reg_type,
-			       saved_reg_offset, &reg_value);
-	if (ret) {
-		ret = -EINVAL;
-		goto done;
+		if (ret) {
+			ret = -EINVAL;
+			goto done;
+		} else {
+			pos += snprintf(buf, PAGE_SIZE, "%u 0x%x 0x%x\n",
+					saved_reg_type, saved_reg_offset,
+					reg_value);
+		}
 	}
 
-	pos += snprintf(buf, PAGE_SIZE, "%u 0x%x 0x%x\n", saved_reg_type,
-			saved_reg_offset, reg_value);
-
 	ret = simple_read_from_buffer(ubuf, count, ppos, buf, pos);
 
 done:
-- 
2.25.1


