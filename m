Return-Path: <SRS0=wR67=FO=lists.elisa.tech=bounce+72012+219+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C4EC433FE
	for <linux-safety@archiver.kernel.org>; Thu, 10 Dec 2020 10:30:55 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27DA23B31
	for <linux-safety@archiver.kernel.org>; Thu, 10 Dec 2020 10:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+219+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id B7noYY5279335xvUNVnOFB1r; Thu, 10 Dec 2020 02:30:54 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [5.68.98.115])
 by mx.groups.io with SMTP id smtpd.web11.11055.1607596253484387954
 for <linux-safety@lists.elisa.tech>;
 Thu, 10 Dec 2020 02:30:54 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 0)
	id 061731600BC; Thu, 10 Dec 2020 10:30:52 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	devel@driverdev.osuosl.org,
	rostedt@goodmis.org,
	mingo@redhat.com,
	gregkh@linuxfoundation.org
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>,
	lukas.bulwahn@gmail.com
Subject: [linux-safety] [PATCH v2] kernel: trace: Remove unneeded initialization in trace_uprobe.c
Date: Thu, 10 Dec 2020 10:30:18 +0000
Message-Id: <1607596218-7327-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: MVhbbPZcy4EezKB48XcDxKnhx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1607596254;
 bh=Wq6aRWtpp3QK9g4diGQdND/UiFsUhvpBUzSoev/+wtE=;
 h=Cc:Date:From:Subject:To;
 b=t/w2g6E6g4xNrN9YBLk2APotky9z1rKgTIsSLwcIFp2cN+bZv5Mzo2uYZj4W5+wTt0o
 YF7f5rOSTcQ7/03Dz4W3xjMpc3E5kbjatnO4wyXqrnSN/jmdTisBVTblL1Iaohi098HLl
 07HNX4bNnmDaNQGQyfItKuofqwt+6G8rxAA=

In trace_uprobe.c, trace_uprobe_create assigns ret to 0 but then never
uses this value.

CC: lukas.bulwahn@gmail.com
Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 kernel/trace/trace_uprobe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 3cf7128..c7c7070 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -541,7 +541,6 @@ static int trace_uprobe_create(int argc, const char **argv)
 	bool is_return = false;
 	int i, ret;
 
-	ret = 0;
 	ref_ctr_offset = 0;
 
 	switch (argv[0][0]) {
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#219): https://lists.elisa.tech/g/linux-safety/message/219
Mute This Topic: https://lists.elisa.tech/mt/78851477/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


