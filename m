Return-Path: <SRS0=mQRo=NK=lists.elisa.tech=bounce+72012+243+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4300C4338F
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 10:05:08 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1467261130
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 10:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1467261130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id fkdTYY5279335xcrEWp96Qfv; Thu, 19 Aug 2021 03:05:07 -0700
X-Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.66910.1629367507430917045
 for <linux-safety@lists.elisa.tech>;
 Thu, 19 Aug 2021 03:05:07 -0700
X-Received: by mail-pl1-f172.google.com with SMTP id n12so3628271plf.4
        for <linux-safety@lists.elisa.tech>; Thu, 19 Aug 2021 03:05:07 -0700 (PDT)
X-Gm-Message-State: QqLBVDvuUzvOZN8D3vLM7AYkx5278000AA=
X-Google-Smtp-Source: ABdhPJw1k3CEeXhtNCwpIMmokSxw9YbQOTANkx6AbvYk8sZ80DuUJyM13KJtWTVskq67s0S4btuhnw==
X-Received: by 2002:a17:903:4095:b029:12d:315e:5f0d with SMTP id z21-20020a1709034095b029012d315e5f0dmr11079858plc.19.1629367506775;
        Thu, 19 Aug 2021 03:05:06 -0700 (PDT)
X-Received: from ubuntu.localdomain ([171.224.180.204])
        by smtp.gmail.com with ESMTPSA id 26sm3436948pgx.72.2021.08.19.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 03:05:06 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: 
Cc: Nghia Le <nghialm78@gmail.com>,
	linux-safety@lists.elisa.tech
Subject: [linux-safety] [PATCH v2] parse-sublevel-options.h : Add missing newline
Date: Thu, 19 Aug 2021 17:04:51 +0700
Message-Id: <20210819100451.87747-1-nghialm78@gmail.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1629367507;
 bh=q+f4IyE9d9Xa2VEgOBws2ObrK74ffFIoo4lOvEloTfI=;
 h=Cc:Date:From:Subject:To;
 b=IYtQQLJ05F1ll2U/5trjgBoD88akzhlmlrixSNrITbb0lll0GzDPg9OK49p9UnqPmfv
 axBgx5IJzRVn0PA2gVZeJD3Dea1ks31EjgLKH3EDBI2chpsQv5FetT8mvQ2vZg7EFWa1D
 1hgtlGrzQauSIlM02G8S7leTJfCtrIVU/e4=

Add missing newline at the end of file, thus removing relevant warning
reported by checkpatch.pl

Checkpatch.pl reported for patch as below:

total: 0 errors, 0 warnings, 6 lines checked

v2-0001-parse-sublevel-options.h-Add-missing-newline.patch has no obvious
style problems and is ready for submission.

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 tools/perf/util/parse-sublevel-options.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-sublevel-options.h b/tools/perf/util/parse-sublevel-options.h
index 9b9efcc2aaad..578b18ef03bb 100644
--- a/tools/perf/util/parse-sublevel-options.h
+++ b/tools/perf/util/parse-sublevel-options.h
@@ -8,4 +8,4 @@ struct sublevel_option {
 
 int perf_parse_sublevel_options(const char *str, struct sublevel_option *opts);
 
-#endif
\ No newline at end of file
+#endif
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#243): https://lists.elisa.tech/g/linux-safety/message/243
Mute This Topic: https://lists.elisa.tech/mt/84993288/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


