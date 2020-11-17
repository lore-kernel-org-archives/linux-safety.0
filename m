Return-Path: <SRS0=8Ij+=EX=lists.elisa.tech=bounce+72012+174+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA218C2D0E4
	for <linux-safety@archiver.kernel.org>; Tue, 17 Nov 2020 15:32:58 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225C82463C
	for <linux-safety@archiver.kernel.org>; Tue, 17 Nov 2020 15:32:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="RpFEjJDJ"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+174+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id qXl6YY5279335xD2oBOZ2m3R; Tue, 17 Nov 2020 07:32:57 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [2.127.6.98])
 by mx.groups.io with SMTP id smtpd.web08.9398.1605627176336397112
 for <linux-safety@lists.elisa.tech>;
 Tue, 17 Nov 2020 07:32:57 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 1000)
	id 35C371612FE; Tue, 17 Nov 2020 15:32:54 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: manishc@marvell.com
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>,
	GR-Linux-NIC-Dev@marvell.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech
Subject: [linux-safety] [PATCH] staging: qlge: Remove unnecessary parentheses
Date: Tue, 17 Nov 2020 15:32:29 +0000
Message-Id: <1605627149-21512-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: YxNfSNTTP2hHwUz4cD0uSJcZx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605627177;
 bh=/0Y7ldH73bUtEbYSlnaxxPb8jS4xpRg6GDOI/USvzXc=;
 h=Cc:Date:From:Subject:To;
 b=RpFEjJDJBm+RN8UfBRKfRP6GxBsRRMxf5O0nfbsA7UMurkuey5E9Kcxg8uHi4pEicZA
 2ud3I+qkqEnA9VpSXQ2RGYuDYR21JNBLt5dlvdMvjJQ9AnlozKUQ+mb80vnzm/k/NZuQ2
 WalDQpzNiY4ZebbclZV4K5DPwHVQrbFTsXE=

There were some redundant brackets in qlge_dbg.c. Reported by
checkpatch.

CC: GR-Linux-NIC-Dev@marvell.com
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-kernel@vger.kernel.org
CC: linux-safety@lists.elisa.tech
Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 drivers/staging/qlge/qlge_dbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
index 42fd139..2ed5f32 100644
--- a/drivers/staging/qlge/qlge_dbg.c
+++ b/drivers/staging/qlge/qlge_dbg.c
@@ -734,7 +734,7 @@ int ql_core_dump(struct ql_adapter *qdev, struct ql_mpi_coredump *mpi_coredump)
 	}
 
 	/* Insert the global header */
-	memset(&(mpi_coredump->mpi_global_header), 0,
+	memset(&mpi_coredump->mpi_global_header, 0,
 	       sizeof(struct mpi_coredump_global_header));
 	mpi_coredump->mpi_global_header.cookie = MPI_COREDUMP_COOKIE;
 	mpi_coredump->mpi_global_header.header_size =
@@ -1222,7 +1222,7 @@ static void ql_gen_reg_dump(struct ql_adapter *qdev,
 {
 	int i, status;
 
-	memset(&(mpi_coredump->mpi_global_header), 0,
+	memset(&mpi_coredump->mpi_global_header, 0,
 	       sizeof(struct mpi_coredump_global_header));
 	mpi_coredump->mpi_global_header.cookie = MPI_COREDUMP_COOKIE;
 	mpi_coredump->mpi_global_header.header_size =
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#174): https://lists.elisa.tech/g/linux-safety/message/174
Mute This Topic: https://lists.elisa.tech/mt/78318204/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


