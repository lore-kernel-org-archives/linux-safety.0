Return-Path: <SRS0=hVkx=E6=lists.elisa.tech=bounce+72012+199+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C598AC56202
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 10:49:16 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9566206F9
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 10:49:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="O9vh4hDF"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+199+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id BagmYY5279335xvwxfnrVPoY; Tue, 24 Nov 2020 02:49:15 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [2.127.6.98])
 by mx.groups.io with SMTP id smtpd.web08.50159.1606214953679323105
 for <linux-safety@lists.elisa.tech>;
 Tue, 24 Nov 2020 02:49:14 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 1000)
	id B15EF160BAE; Tue, 24 Nov 2020 10:49:11 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: gregkh@linuxfoundation.org,
	lukas.bulwahn@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	forest@alittletooquiet.net
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH v2 1/2] staging: vt6655: Fix alignment in device_main.c
Date: Tue, 24 Nov 2020 10:48:55 +0000
Message-Id: <1606214936-35192-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: DHZZ8QgvUBXTwtU20vUo8nDqx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606214955;
 bh=pSnHC+VtpWbXi3roAjqdtD+ZhXPndmeozhjxnhimdY8=;
 h=Cc:Date:From:Subject:To;
 b=O9vh4hDFUGdTqkMshF52UUiyf6z8wpkbacwAmKsRsaew8KrUNBs+nHZerpaCFn/piKm
 Ur8YGws9TKadfl5GpGfBQqHqJAqcqj3aKvX2k13207e0AN8tnwgkGakraR7YcijgpKaEr
 ier2n64cnuh3KlnXBIlQKOUxF5w4FGMkGxg=

Correct alignment to open parenthesis in device_main.c. Reported by
checkpatch.

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
View/Reply Online (#199): https://lists.elisa.tech/g/linux-safety/message/199
Mute This Topic: https://lists.elisa.tech/mt/78474578/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


