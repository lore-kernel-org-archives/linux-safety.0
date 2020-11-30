Return-Path: <SRS0=GSsP=FE=lists.elisa.tech=bounce+72012+213+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F498C64E8A
	for <linux-safety@archiver.kernel.org>; Mon, 30 Nov 2020 12:49:31 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504F5207BC
	for <linux-safety@archiver.kernel.org>; Mon, 30 Nov 2020 12:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="p1f9Jli5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 504F5207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+213+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id ahipYY5279335xZXR8wrpoak; Mon, 30 Nov 2020 04:49:29 -0800
X-Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.59191.1606740568904687875
 for <linux-safety@lists.elisa.tech>;
 Mon, 30 Nov 2020 04:49:29 -0800
X-Received: by mail-wr1-f65.google.com with SMTP id i2so16044547wrs.4
        for <linux-safety@lists.elisa.tech>; Mon, 30 Nov 2020 04:49:28 -0800 (PST)
X-Gm-Message-State: YPYMeuuPyDrNRPFg9sHEcyOZx5278000AA=
X-Google-Smtp-Source: ABdhPJxM4TlVkMpABcEDR1NbWu/p2BJ3zySpGa1lfl1C+p3MsU9fPZtsCLlJcirx2aXVoCo5MQk4/g==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr27218012wrq.416.1606740567358;
        Mon, 30 Nov 2020 04:49:27 -0800 (PST)
X-Received: from felia.fritz.box ([2001:16b8:2d4c:d300:8813:e95a:c6db:aa09])
        by smtp.gmail.com with ESMTPSA id n4sm24474781wmc.30.2020.11.30.04.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 04:49:26 -0800 (PST)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>
Cc: Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [linux-safety] [PATCH] printk: remove obsolete dead assignment
Date: Mon, 30 Nov 2020 13:49:15 +0100
Message-Id: <20201130124915.7573-1-lukas.bulwahn@gmail.com>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606740569;
 bh=p8XgvVYIEJMSYjiIogjSdGxus34hK4R7ewRFs0UCy2Y=;
 h=Cc:Date:From:Subject:To;
 b=p1f9Jli5q8A/O5/Z5K9iqTm5NejtZSlQEze0R1mMwQcTlaYoZ9yOcS/c5fdRdCTgXvu
 0t7/uVZFnXjY1WYPV+in0DdtSWUQYWWcKbiH6EaJhuQHE5sB0Nx3KITN8Y6kzxsPUwaH9
 7e0BS6KSDrDImqKEHZeTTq8ICjIbp7VQZMo=

Commit 849f3127bb46 ("switch /dev/kmsg to ->write_iter()") refactored
devkmsg_write() and left over a dead assignment on the variable 'len'.

Hence, make clang-analyzer warns:

  kernel/printk/printk.c:744:4: warning: Value stored to 'len' is never read
    [clang-analyzer-deadcode.DeadStores]
                          len -= endp - line;
                          ^

Simply remove this obsolete dead assignment here.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201130

Petr, please pick this minor non-urgent clean-up patch.

 kernel/printk/printk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index f279d4fbd9dd..6e4e38b7cd91 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -741,7 +741,6 @@ static ssize_t devkmsg_write(struct kiocb *iocb, struct iov_iter *from)
 			if (LOG_FACILITY(u) != 0)
 				facility = LOG_FACILITY(u);
 			endp++;
-			len -= endp - line;
 			line = endp;
 		}
 	}
-- 
2.17.1



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#213): https://lists.elisa.tech/g/linux-safety/message/213
Mute This Topic: https://lists.elisa.tech/mt/78607109/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


