Return-Path: <SRS0=NyVF=EW=lists.elisa.tech=bounce+72012+171+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30092C2D0A3
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 17:04:14 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FD120E65
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 17:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="pslGBNtn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FD120E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+171+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id QDb2YY5279335xySg2PJfWIq; Mon, 16 Nov 2020 09:04:13 -0800
X-Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.38146.1605546252587503969
 for <linux-safety@lists.elisa.tech>;
 Mon, 16 Nov 2020 09:04:12 -0800
X-Received: by mail-wr1-f65.google.com with SMTP id k2so19523332wrx.2
        for <linux-safety@lists.elisa.tech>; Mon, 16 Nov 2020 09:04:12 -0800 (PST)
X-Gm-Message-State: oBlyYaEiIHkMnElfDaQc9zvtx5278000AA=
X-Google-Smtp-Source: ABdhPJyBD20h4gSwItZ8R2pPrHI19fmIM94YDXSAfDUr2+CwfUxkevo5dfQispvXccljoij57t2fRw==
X-Received: by 2002:adf:f181:: with SMTP id h1mr19974392wro.267.1605546251120;
        Mon, 16 Nov 2020 09:04:11 -0800 (PST)
X-Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id u16sm23347986wrn.55.2020.11.16.09.04.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2020 09:04:10 -0800 (PST)
From: "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	linux-rtc@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [linux-safety] [PATCH] rtc: pcf8523: Use PTR_ERR_OR_ZERO
Date: Mon, 16 Nov 2020 17:02:09 +0000
Message-Id: <20201116170209.31584-1-sudipm.mukherjee@gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605546253;
 bh=/YVET5HhcwaaL9pggZOMCn3Hn+P5sm+PWdfYPz8hp64=;
 h=Cc:Date:From:Subject:To;
 b=pslGBNtngxXixkglESlU9Co08ATvAQmWq0Zbxqh1mKOPNgfHmgJQOdD4C5idOeOIAYa
 KXNjN+QTfeeoR0fxoET4HJ3HIY1fnwiqPCsvOnIFdhR2jFmr6+zvkyqHiJOXRdIL8UPpU
 NAz5u+TxqSxzMI7VfeL5KaCXABJil2Ho42M=

Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
doing 'return 0'.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/rtc/rtc-pcf8523.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 57d351dfe272..94f182599438 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -358,10 +358,8 @@ static int pcf8523_probe(struct i2c_client *client,
 
 	rtc = devm_rtc_device_register(&client->dev, DRIVER_NAME,
 				       &pcf8523_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(rtc);
 }
 
 static const struct i2c_device_id pcf8523_id[] = {
-- 
2.11.0



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#171): https://lists.elisa.tech/g/linux-safety/message/171
Mute This Topic: https://lists.elisa.tech/mt/78296613/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


