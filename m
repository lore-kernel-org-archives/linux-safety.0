Return-Path: <SRS0=+nJB=NK=lists.elisa.tech=bounce+72012+245+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852F5C4338F
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 22:34:05 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C05E60EFE
	for <linux-safety@archiver.kernel.org>; Thu, 19 Aug 2021 22:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C05E60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id C7eCYY5279335xvju391T3em; Thu, 19 Aug 2021 15:34:04 -0700
X-Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.76218.1629412444235788097
 for <linux-safety@lists.elisa.tech>;
 Thu, 19 Aug 2021 15:34:04 -0700
X-Received: by mail-pf1-f176.google.com with SMTP id y11so6860811pfl.13
        for <linux-safety@lists.elisa.tech>; Thu, 19 Aug 2021 15:34:04 -0700 (PDT)
X-Gm-Message-State: phJGwbo3EfJZfsyywvOfQnebx5278000AA=
X-Google-Smtp-Source: ABdhPJxtbivTYkL7QVMA3/HhUoxMbZ4xhJ2eYi+nhug9CXX800xuK/SUXWaqDdimfCZ11L9jAhjRYg==
X-Received: by 2002:a05:6a00:aca:b029:392:9c79:3a39 with SMTP id c10-20020a056a000acab02903929c793a39mr16537245pfl.57.1629412443387;
        Thu, 19 Aug 2021 15:34:03 -0700 (PDT)
X-Received: from ubuntu.localdomain ([171.224.180.204])
        by smtp.gmail.com with ESMTPSA id b14sm4393658pfo.76.2021.08.19.15.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 15:34:02 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [linux-safety] [PATCH v3] perf tools: Add missing newline at the end of file
Date: Fri, 20 Aug 2021 05:33:50 +0700
Message-Id: <20210819223350.97895-1-nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1629412444;
 bh=rq3oO5sp65rdZ+cmNBU+QCfq3LO6YoQETQSDLENkqoc=;
 h=Cc:Date:From:Subject:To;
 b=XAgQsUZm6+GKPW0qExyarz6mRvT/Q1nuFp25ACflMI8Kk+MAjjzdV0qWaDLUn+FqzZx
 JJjBRwcyx99Ds7h7y3EiIm5taL1GjQftjsI8OPO0Ew/xAJJMiGFh3TbiDX166G9AlEXn+
 bOK9i4LyazXwC2/kKJaSAYeVBMaq+TvnYBY=

Add missing newline at the end of file parse-sublevel-options.h.
Thus removing relevant warning reported by checkpatch.

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
View/Reply Online (#245): https://lists.elisa.tech/g/linux-safety/message/245
Mute This Topic: https://lists.elisa.tech/mt/85008796/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


