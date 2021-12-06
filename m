Return-Path: <milan.lakhani@codethink.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F28C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:04:06 +0000 (UTC)
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk
 [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web10.53640.1638806641333439493
 for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 08:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: milan.lakhani@codethink.co.uk)
Received: from [90.200.202.165] (helo=localhost.localdomain)
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1muGT2-0002ln-A2; Mon, 06 Dec 2021 16:03:52 +0000
From: Milan Lakhani <milan.lakhani@codethink.co.uk>
To: lukas.bulwahn@gmail.com,
	linux-safety@lists.elisa.tech,
	nghialm78@gmail.com
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [PATCH v2] fs/ext4: Remove unecessary deadstores
Date: Mon,  6 Dec 2021 16:03:35 +0000
Message-ID: <20211206160335.6147-1-milan.lakhani@codethink.co.uk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Mon, 06 Dec 2021 16:04:06 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/267
Message-ID: <20211206160335.Rel2hxNaWgpS5QQwbEJ_1Pbvvsqp2ZYBv9U6R9hR7LQ@z>

Just assigning the 'frame' variable to 'entries2' is sufficient, rather than to
'entries = entries2'. This also removes two other cases where variables are
assigned to values that are never read afterwards, making the code more legible
and efficient.

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 fs/ext4/namei.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 52c9bd154122..fee50ebde197 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2432,7 +2432,6 @@ static int ext4_dx_add_entry(handle_t *handle, struct ext4_filename *fname,
 	if (err != -ENOSPC)
 		goto cleanup;
 
-	err = 0;
 	/* Block full, should compress but for now just split */
 	dxtrace(printk(KERN_DEBUG "using %u of %u node entries\n",
 		       dx_get_count(entries), dx_get_limit(entries)));
@@ -2507,7 +2506,7 @@ static int ext4_dx_add_entry(handle_t *handle, struct ext4_filename *fname,
 			/* Which index block gets the new entry? */
 			if (at - entries >= icount1) {
 				frame->at = at - entries - icount1 + entries2;
-				frame->entries = entries = entries2;
+				frame->entries = entries2;
 				swap(frame->bh, bh2);
 			}
 			dx_insert_block((frame - 1), hash2, newblock);
@@ -3183,8 +3182,6 @@ int __ext4_unlink(handle_t *handle, struct inode *dir, const struct qstr *d_name
 		retval = ext4_mark_inode_dirty(handle, dir);
 		if (retval)
 			goto out;
-	} else {
-		retval = 0;
 	}
 	if (inode->i_nlink == 0)
 		ext4_warning_inode(inode, "Deleting file '%.*s' with no links",
-- 
2.25.1


