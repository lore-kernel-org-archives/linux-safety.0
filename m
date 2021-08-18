Return-Path: <SRS0=eln1=NJ=lists.elisa.tech=bounce+72012+240+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D2DC4338F
	for <linux-safety@archiver.kernel.org>; Wed, 18 Aug 2021 17:01:26 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF336102A
	for <linux-safety@archiver.kernel.org>; Wed, 18 Aug 2021 17:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEF336102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id DJgrYY5279335xmRNfahD6Hb; Wed, 18 Aug 2021 10:01:25 -0700
X-Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.57259.1629306084803281641
 for <linux-safety@lists.elisa.tech>;
 Wed, 18 Aug 2021 10:01:24 -0700
X-Received: by mail-pj1-f52.google.com with SMTP id j12-20020a17090aeb0c00b00179530520b3so9377889pjz.0
        for <linux-safety@lists.elisa.tech>; Wed, 18 Aug 2021 10:01:24 -0700 (PDT)
X-Gm-Message-State: 7I0Dr3sSE0ER90FsuGugnwwxx5278000AA=
X-Google-Smtp-Source: ABdhPJzlfsktAUR3yabQVfFo5ra/gdgpEuDoV82BPNZo3JTGZpX17MLWYQI+GTRtVioslbVX/1DsOQ==
X-Received: by 2002:a17:902:a705:b029:12b:71be:d24e with SMTP id w5-20020a170902a705b029012b71bed24emr8143744plq.29.1629306083993;
        Wed, 18 Aug 2021 10:01:23 -0700 (PDT)
X-Received: from ubuntu.localdomain ([171.224.180.204])
        by smtp.gmail.com with ESMTPSA id j35sm316527pgm.55.2021.08.18.10.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 10:01:23 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [linux-safety] [PATCH] parse-sublevel-option.h : Add new line and license identifier
Date: Thu, 19 Aug 2021 00:01:09 +0700
Message-Id: <20210818170109.62277-1-nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1629306085;
 bh=AavvBBsQ8rM0Z+QOvRVeqwhPS7AqNDrSL7JZyudYils=;
 h=Cc:Date:From:Subject:To;
 b=JnbhNsSt+G6eHziPPzd6CRi0tcayXrl5XHtzMyq6Rs3F4oFVGH5eXcfwNhkKNxL/fRJ
 /vYoFIv370nct9r5s3WYepDJXDt7JMT9zgRH5gRcBQlawLPiuQD4rQCq8dSnvCCm3rYTD
 CwA1oC+ETXfY7ctXD5JBIQ9EpeS88ia+1AY=

Add the new line at the end of file and add SPDX license identifier GPL-2.0, thus removing warning while running checkpatch.pl script

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 tools/perf/util/parse-sublevel-options.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-sublevel-options.h b/tools/perf/util/parse-sublevel-options.h
index 9b9efcc2aaad..bb44b5af2963 100644
--- a/tools/perf/util/parse-sublevel-options.h
+++ b/tools/perf/util/parse-sublevel-options.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
 #ifndef _PERF_PARSE_SUBLEVEL_OPTIONS_H
 #define _PERF_PARSE_SUBLEVEL_OPTIONS_H
 
@@ -8,4 +10,5 @@ struct sublevel_option {
 
 int perf_parse_sublevel_options(const char *str, struct sublevel_option *opts);
 
-#endif
\ No newline at end of file
+#endif
+
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#240): https://lists.elisa.tech/g/linux-safety/message/240
Mute This Topic: https://lists.elisa.tech/mt/84977020/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


