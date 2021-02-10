Return-Path: <SRS0=4y//=HM=lists.elisa.tech=bounce+72012+239+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF56C433DB
	for <linux-safety@archiver.kernel.org>; Wed, 10 Feb 2021 22:22:09 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFDEF64ECF
	for <linux-safety@archiver.kernel.org>; Wed, 10 Feb 2021 22:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+239+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id C1c3YY5279335xb8uPv7ZSqz; Wed, 10 Feb 2021 14:22:08 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [90.222.153.26])
 by mx.groups.io with SMTP id smtpd.web11.313.1612995727229740966
 for <linux-safety@lists.elisa.tech>;
 Wed, 10 Feb 2021 14:22:07 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 1000)
	id 66504160097; Wed, 10 Feb 2021 22:22:05 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: lukas.bulwahn@gmail.com,
	sudip.mukherjee@codethink.co.uk,
	linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	corbet@lwn.net
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH] include/linux/build_bug.h: Add documentation
Date: Wed, 10 Feb 2021 22:21:55 +0000
Message-Id: <1612995715-37324-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 00f2ZuWnTw5Lt1W7cnO93EUGx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1612995728;
 bh=Zs9Q75SitizPwMCRDbH6TuUjLCz8/4Le3wMBEPYC1SE=;
 h=Cc:Date:From:Subject:To;
 b=WKWGyf46lkIf6VLEaR6cEmJ9BCXZh/JTg5X5kZ7E1nGNa1HajcIHkKSn4nKTAToWTsG
 XamAxzgV61Ws2XGP91iSa2Dasg3F4UQ8jWe/o8yRjP0L4tAobIb6dufmMKM+RMi/dWLgP
 V6ZP0HoJ6JBKBVd7QmcF5VvRzUyKNovmmC0=

Add missing documentation describing function parameters of macros,
thus removing warnings.

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 include/linux/build_bug.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/build_bug.h b/include/linux/build_bug.h
index e3a0be2..457c5f2 100644
--- a/include/linux/build_bug.h
+++ b/include/linux/build_bug.h
@@ -32,7 +32,8 @@
 /**
  * BUILD_BUG_ON_MSG - break compile if a condition is true & emit supplied
  *		      error message.
- * @condition: the condition which the compiler should know is false.
+ * @cond: the condition which the compiler should know is false.
+ * @msg: the error message to show when the condition is true.
  *
  * See BUILD_BUG_ON for description.
  */
@@ -60,6 +61,8 @@
 
 /**
  * static_assert - check integer constant expression at build time
+ * @expr: the integer constant expression which the compiler should know is
+ * true.
  *
  * static_assert() is a wrapper for the C11 _Static_assert, with a
  * little macro magic to make the message optional (defaulting to the
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#239): https://lists.elisa.tech/g/linux-safety/message/239
Mute This Topic: https://lists.elisa.tech/mt/80544677/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


