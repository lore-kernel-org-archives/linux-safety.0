Return-Path: <bounce+72012+267+5278000+9232812@lists.elisa.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9530EC433F5
	for <linux-safety@archiver.kernel.org>; Mon,  6 Dec 2021 16:04:03 +0000 (UTC)
X-Received: by 127.0.0.2 with SMTP id gAtOYY5279335xpuAGe0k5ZK; Mon, 06 Dec 2021 08:04:03 -0800
X-Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web10.53640.1638806641333439493
 for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 08:04:02 -0800
X-Received: from [90.200.202.165] (helo=localhost.localdomain)
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1muGT2-0002ln-A2; Mon, 06 Dec 2021 16:03:52 +0000
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: lukas.bulwahn@gmail.com,
	linux-safety@lists.elisa.tech,
	nghialm78@gmail.com
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH v2] fs/ext4: Remove unecessary deadstores
Date: Mon,  6 Dec 2021 16:03:35 +0000
Message-Id: <20211206160335.6147-1-milan.lakhani@codethink.co.uk>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: HmCYriijmz5pBTOeCE2SL8shx5278000AA=
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1638806643;
 bh=quXMfzuPBHezsiBESzVCFhsSfQ9ulY/0Y2OMdHw5B2o=;
 h=Cc:Date:From:Subject:To;
 b=fXJ5QbKCzH1CLOsJTugSPpOwzRv259MgFYS04g0VAO3Jnv59v4OVVCjO6bLZCSfpeNS
 s/8aiQlRYMbHwxZ8dgaam/yxfXHqkcC89VgHpgC04JgqvhMhBoCkQxww5d8fqaasHlJHq
 Irn6EpJVDcqP4ja/+YoAkdy1WUC/IMhymQI=

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



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#267): https://lists.elisa.tech/g/linux-safety/message/267
Mute This Topic: https://lists.elisa.tech/mt/87542989/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


