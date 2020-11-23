Return-Path: <SRS0=EuCO=E5=lists.elisa.tech=bounce+72012+186+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70D4C56202
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 11:59:44 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF4A208DB
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 11:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="LXq9OS93"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+186+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id OstuYY5279335xibvu6y1SLS; Mon, 23 Nov 2020 03:59:42 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [2.127.6.98])
 by mx.groups.io with SMTP id smtpd.web09.34188.1606132781993865019
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 03:59:42 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 1000)
	id 0B8671612F6; Mon, 23 Nov 2020 11:59:40 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: forest@alittletooquiet.net
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech
Subject: [linux-safety] [PATCH 1/2] staging: vt6655: Fix alignment in device_main.c
Date: Mon, 23 Nov 2020 11:59:37 +0000
Message-Id: <1606132778-34209-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: ZMtqgbRJPXnAelIQFFvIxsnAx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606132782;
 bh=l7i2svaIHP/KI4qRcxznphjumaB/+lYgkevIQfInj/o=;
 h=Cc:Date:From:Subject:To;
 b=LXq9OS93xZ5/knJEsah7sdyGI4C+7uWbPc9EnQ5IxhUr/3hJ4Ao3XjTQfue3Z7zO80V
 qx6Lq85tIBVuim99i0zQ8AYf0SDTs4EB1QMGW4k5T3qUjDNB+Wu1It+POmpcYeuecwet5
 0fFbZUYsDY8mJAEcJI44oxqq8zk6+3FSHlU=

Correct alignment to open parenthesis in device_main.c. Reported by
checkpatch.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>
CC: linux-kernel@vger.kernel.org
CC: linux-safety@lists.elisa.tech
Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 9c7d70e..2108ae6 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1077,7 +1077,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 				PSbIsNextTBTTWakeUp((void *)priv);
 
 			if ((priv->op_mode == NL80211_IFTYPE_AP ||
-			    priv->op_mode == NL80211_IFTYPE_ADHOC) &&
+			     priv->op_mode == NL80211_IFTYPE_ADHOC) &&
 			    priv->vif->bss_conf.enable_beacon)
 				MACvOneShotTimer1MicroSec(priv,
 							  (priv->vif->bss_conf.beacon_int -
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#186): https://lists.elisa.tech/g/linux-safety/message/186
Mute This Topic: https://lists.elisa.tech/mt/78451463/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


