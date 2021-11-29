Return-Path: <bounce+72012+264+5278000+9232812@lists.elisa.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BF0C433F5
	for <linux-safety@archiver.kernel.org>; Mon, 29 Nov 2021 15:01:38 +0000 (UTC)
X-Received: by 127.0.0.2 with SMTP id HklMYY5279335xjxyEAfV9zj; Mon, 29 Nov 2021 07:01:38 -0800
X-Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web10.62079.1638198096871226711
 for <linux-safety@lists.elisa.tech>;
 Mon, 29 Nov 2021 07:01:37 -0800
X-Received: from [90.200.202.165] (helo=ubuntu.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mri9m-0000SZ-Bc; Mon, 29 Nov 2021 15:01:26 +0000
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: linux-safety@lists.elisa.tech,
	lukas.bulwahn@gmail.com,
	sudip.mukherjee@codethink.co.uk
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH] staging: net: Tidy codeblocks and remove unused assignments
Date: Mon, 29 Nov 2021 15:01:17 +0000
Message-ID: <20211129150117.3220-1-milan.lakhani@codethink.co.uk>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: GzCqsc6JffF6Nr27nAhshkAGx5278000AA=
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1638198098;
 bh=M5zSXT5p6UeLgiHCqdRTLRK8902F2ea1IzVDdOHR6Jo=;
 h=Cc:Date:From:Subject:To;
 b=DnInE7I6ZyzSboerB2lYsZfVWgQMt0k4QT+8LBPXNpM8vQqg+PufrVLDFnPDGAM8YkW
 J7mHziEIb9XAg1zANW1xV+5ZyhLB6d7wixNDPDxfSq4bzBch0XPYIXHVVDkF955Vs2mzR
 //9NA7xcHO22mA0GU1P9yafMCxhlX74chr8=
Message-ID: <20211129150117.veD_R_rC_miTXdMvW5C1ZNefZMGRZ1n6qRedsUbuet0@z>

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



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#264): https://lists.elisa.tech/g/linux-safety/message/264
Mute This Topic: https://lists.elisa.tech/mt/87379258/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


