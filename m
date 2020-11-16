Return-Path: <SRS0=ZuZ5=EW=lists.elisa.tech=bounce+72012+170+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881A6C2D0A3
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 16:56:12 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 042D720E65
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 16:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="d3qMr8SV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 042D720E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+170+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id YCINYY5279335xI9cBG1ggc0; Mon, 16 Nov 2020 08:56:11 -0800
X-Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.37685.1605545771012746916
 for <linux-safety@lists.elisa.tech>;
 Mon, 16 Nov 2020 08:56:11 -0800
X-Received: by mail-wr1-f68.google.com with SMTP id k2so19481517wrx.2
        for <linux-safety@lists.elisa.tech>; Mon, 16 Nov 2020 08:56:10 -0800 (PST)
X-Gm-Message-State: HjB3lUkdtckS5Q56q0NJRxvtx5278000AA=
X-Google-Smtp-Source: ABdhPJxU6kxyRt4iLAsiDSGX2pIkswZYteymqDmfvEZ7u7/u0Yo6zB0NJQktTFsMB/UVTXHFnHIElQ==
X-Received: by 2002:adf:ea91:: with SMTP id s17mr20593129wrm.349.1605545769524;
        Mon, 16 Nov 2020 08:56:09 -0800 (PST)
X-Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id d2sm19314593wra.73.2020.11.16.08.56.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2020 08:56:09 -0800 (PST)
From: "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [linux-safety] [PATCH] PCI: tegra: Use PTR_ERR_OR_ZERO
Date: Mon, 16 Nov 2020 16:54:07 +0000
Message-Id: <20201116165407.8050-1-sudipm.mukherjee@gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605545771;
 bh=e/Q8ozKSu3uZjG4QXu/fX/EEJVCgO2IeuQB8tKl9Kiw=;
 h=Cc:Date:From:Subject:To;
 b=d3qMr8SVXNuBRhxCdfD9ksJKN25l2MZCZIbFD4fQvHWJgsJkCgl55UzCFKFU40FlwWb
 rdF2pkbfRESdH6WtPkQkRaqcCsXuJWnXgG8QL5A70fGmU+DNKWY/gZlprkPNONr+oJStg
 l9j/w2lBqG/sWj/3XqGi+XyHCtnsQbCcaP0=

Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
doing 'return 0'.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/pci/controller/pci-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8fcabed7c6a6..4c52b2d58645 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1308,10 +1308,8 @@ static int tegra_pcie_resets_get(struct tegra_pcie *pcie)
 		return PTR_ERR(pcie->afi_rst);
 
 	pcie->pcie_xrst = devm_reset_control_get_exclusive(dev, "pcie_x");
-	if (IS_ERR(pcie->pcie_xrst))
-		return PTR_ERR(pcie->pcie_xrst);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(pcie->pcie_xrst);
 }
 
 static int tegra_pcie_phys_get_legacy(struct tegra_pcie *pcie)
-- 
2.11.0



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#170): https://lists.elisa.tech/g/linux-safety/message/170
Mute This Topic: https://lists.elisa.tech/mt/78296400/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


