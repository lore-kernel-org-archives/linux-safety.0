Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.1211.1603735357184355691
 for <linux-safety@lists.elisa.tech>;
 Mon, 26 Oct 2020 11:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=akulYrwl;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id x7so13760939wrl.3
        for <linux-safety@lists.elisa.tech>; Mon, 26 Oct 2020 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dr/M5m284ccLeNOnUZwOiheVtoOaVvfBzrCmSiaeimE=;
        b=akulYrwlVSGJpPDC77vrNk+/ekLvFK7m9ZYXW18qFiVTxqz71UQD4kL34+wANlmTVv
         AEB34pClXCQubR8meZl1EWal3gpTwjpHWc2Py4ypB2QtxS+yy9sealpLbbu2FF8Jnl0+
         2+3nbJrORnVzZWi5pglb8E85aXluq/GZkhZ072/GAu0J4wnj3c90JbnN6WVg11WZ/jFr
         iWC9+ljZvMqkDtPVJlQdcCkmYLsNoDjjvTXdaMAlkBnGq+H/acQ+lYXejcXMJdnd2ko6
         VjxQqpHN9OXq77dI8p8ags+eJ2ixfImHotPQoNSY4/EKPBEFPwr2OyZCupD8u8zgmVOm
         JOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dr/M5m284ccLeNOnUZwOiheVtoOaVvfBzrCmSiaeimE=;
        b=ixiNtblsIg0WjD+7pPUDjEobRUygjnQA03fc7aV8bshVkDtVfuY4JA2MuEnb8K3i5O
         oj0rJ/zkCMvuEWnK0qgLx2uQyzXESD2U7tgDIRghOoKJGGurCN3q67Mppr3w4M5lFlhC
         XpFvfcOdTAN4kiBIp3wI0PLLtoHQ5p2zOnX9CPbQw9xgljPhbI+KpfSnsz+vnq4xBonY
         7irGAro5eNSxiMDVA/A2fh9G48Azo7ETxHLE9n5oUAWCfPU7rFH78YBl8fUaDcPbmosy
         OW4Nho5N3vFc46rLG3vWjCk8Fl4ojJWOSSXaW0F6Pec99hOuX6Ok7+CwfRSv5dJKwsXS
         lpzg==
X-Gm-Message-State: AOAM533vDpXYg4Qgs8ypHG3QDQM0bMdNbxqlJWz3DUOwYtgWjr+HiKzs
	ziKR88GVyNMrbIlUBewSOrM=
X-Google-Smtp-Source: ABdhPJy3v17H0nndO/wow3Iyw/sF1O6Mqems54hgdg6CPu8vTLvCzEuv3AXub44dapk3cnvbMC+Kiw==
X-Received: by 2002:adf:e849:: with SMTP id d9mr20693375wrn.25.1603735355389;
        Mon, 26 Oct 2020 11:02:35 -0700 (PDT)
Return-Path: <sudipm.mukherjee@gmail.com>
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id r1sm25575100wro.18.2020.10.26.11.02.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 11:02:34 -0700 (PDT)
From: "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
To: John Stultz <john.stultz@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] misc: hisi_hikey_usb: use PTR_ERR_OR_ZERO
Date: Mon, 26 Oct 2020 18:00:26 +0000
Message-Id: <20201026180026.3350-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0

Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
doing 'return 0'.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/misc/hisi_hikey_usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
index cc93569e601c..989d7d129469 100644
--- a/drivers/misc/hisi_hikey_usb.c
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -168,10 +168,7 @@ static int hisi_hikey_usb_parse_kirin970(struct platform_device *pdev,
 
 	hisi_hikey_usb->reset = devm_gpiod_get(&pdev->dev, "hub_reset_en_gpio",
 					       GPIOD_OUT_HIGH);
-	if (IS_ERR(hisi_hikey_usb->reset))
-		return PTR_ERR(hisi_hikey_usb->reset);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hisi_hikey_usb->reset);
 }
 
 static int hisi_hikey_usb_probe(struct platform_device *pdev)
-- 
2.11.0
