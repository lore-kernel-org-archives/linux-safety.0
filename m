Return-Path: <bounce+72012+265+5278000+9232812@lists.elisa.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D469C4332F
	for <linux-safety@archiver.kernel.org>; Mon,  6 Dec 2021 15:01:52 +0000 (UTC)
X-Received: by 127.0.0.2 with SMTP id r44ZYY5279335xEgqel9C6zY; Mon, 06 Dec 2021 07:01:52 -0800
X-Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web12.52582.1638802911410631055
 for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 07:01:52 -0800
X-Received: from [90.200.202.165] (helo=localhost.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1muFUx-0006Cs-2c; Mon, 06 Dec 2021 15:01:47 +0000
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: linux-safety@lists.elisa.tech,
	lukas.bulwahn@gmail.c,
	nghialm78@gmail.com
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH] fs/ext4: Remove unecessary deadstores
Date: Mon,  6 Dec 2021 15:01:39 +0000
Message-ID: <20211206150139.5463-1-milan.lakhani@codethink.co.uk>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: yICHtiQJFgYFBIN73kMScGtYx5278000AA=
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1638802912;
 bh=C6EPYIOfD/jy2gctTovQrRmSG7p/C3jJ8YnKfIh/oRk=;
 h=Cc:Date:From:Subject:To;
 b=xbVvOm6INl93Q7wI0Ed/e25LTKfxXqHXW9QYApztlHdzjZ2KB2VVfUw+0H+CefFnB28
 8c964jefby5qHAPxpWcXiyHb1ZOcrvUiZr+jOy9CI3wi/bHtcCXzQEhHDoyU4Qs2XU7nl
 dRF0F/2UPrxGyjK+8pQH85c2zn+uw1VOhyI=
Message-ID: <20211206150139.42QSKLDiJTlqTASsFUw3pjSPh3plxaw3EV5wOWznjKM@z>

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 fs/ext4/namei.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 52c9bd154122..f341478e9740 100644
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
+				frame->entries;
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
View/Reply Online (#265): https://lists.elisa.tech/g/linux-safety/message/265
Mute This Topic: https://lists.elisa.tech/mt/87541425/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


