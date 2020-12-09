Return-Path: <SRS0=LX2j=FN=lists.elisa.tech=bounce+72012+217+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022DEC4361B
	for <linux-safety@archiver.kernel.org>; Wed,  9 Dec 2020 13:17:15 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3F422AAA
	for <linux-safety@archiver.kernel.org>; Wed,  9 Dec 2020 13:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+217+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id e4rPYY5279335xZxJUwotqRh; Wed, 09 Dec 2020 05:17:13 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [5.68.98.115])
 by mx.groups.io with SMTP id smtpd.web12.6258.1607519832883640887
 for <linux-safety@lists.elisa.tech>;
 Wed, 09 Dec 2020 05:17:13 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 1000)
	id A63D5160E87; Wed,  9 Dec 2020 13:17:10 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH] kernel: trace: Remove deadstore in trace_uprobe.c
Date: Wed,  9 Dec 2020 13:16:54 +0000
Message-Id: <1607519814-86271-1-git-send-email-milan.lakhani@codethink.co.uk>
In-Reply-To: <devel@driverdev.osuosl.org, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org>
References: <devel@driverdev.osuosl.org, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: YLwLb0oVQ5oS5VbagDol22gFx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1607519833;
 bh=kZnSf2Xe3bcf5XkV5G693yrBnOjY9InwRhPKl4nG7fI=;
 h=Cc:Date:From:Subject:To;
 b=Zc44O765Y0srj7OkReBBjMFEpvuhxE6UhLmERetL+CZdPL/OobNlnaDJwSKAZGqiO6T
 k0Uhpq8d73AC9pWjsedVhlBb2Q4y5+KmrXA6UIfzH8nkb4oFiBXjal74y3wpzGx+57evO
 cgUxxvQ9+Q9Z0KjgbSUeVoa66sbTTcObstI=

In trace_uprobe.c, trace_uprobe_create assigns ret to 0 but then never
uses this value.

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
View/Reply Online (#217): https://lists.elisa.tech/g/linux-safety/message/217
Mute This Topic: https://lists.elisa.tech/mt/78828451/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


