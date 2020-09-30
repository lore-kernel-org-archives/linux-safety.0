Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.1798.1601491388935554280
 for <linux-safety@lists.elisa.tech>;
 Wed, 30 Sep 2020 11:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gy4xqQj0;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id a9so550124wmm.2
        for <linux-safety@lists.elisa.tech>; Wed, 30 Sep 2020 11:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Hgch/OU0fUgiG3/fTy3bhBDktVyr1lWgsfs92Fqm60E=;
        b=Gy4xqQj07MvJJi/1fgMrYLmwe96RaUqcWYCzIfzOjDedCQ54s1LDQ0WMennSf+Tvm4
         U0mjGZGoklNdXahK1oYoGCpAQlytuhQ41jhjNdiFaAx+eH1yZVU7JCpyKJiDgKGCmCWK
         x/eGs/YuSRHCnmRJpDh/O/h+fa+lckVhktl8SqdRkMSdxv85yZ/1jF65X88ZZBzhe6Sf
         TfTK9i3N5qiBdV1N/wc14dn7IGbmuZA2mBA7gPZ8kHieI0ZXWhQIxYEd4lDjYraV2A83
         NCGY5kyx88iMvrBeU2dQJ7UjQHTw6SXwP7DaJJYPEfGj9jkYW/NmbGTlQtvCn4D7jnDY
         wiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Hgch/OU0fUgiG3/fTy3bhBDktVyr1lWgsfs92Fqm60E=;
        b=mSpIRW7cTKPi05Frwpz3m/GEDrqDO/nvDVij1QS8jF0F3gL21ynqEU5a0soPm2LxH4
         qe4IIgCMPDe0lspnyNxPz7DKeV2RA7j5ZNqWqpywlpW+a6uHW1mdOCU6aq0CHQoLqGbU
         ryOrZPC0wjGnINnFzPyDsDhVj9z5NrXlB7jaRmmoOiaTjcx/LctZKOIXKZrAWFtQcit3
         8TNHrC/q625QNC11rOfOX9QE3JmqHcIz8qPo2ryySsIHo2mib23sWlWhJQeWsV8O1ZvD
         8x+Sg4llINaq/ntAmB0FrsBLf1KydNdDicB0cEY7BRoBfmzai2663sILpqB8jFvEQ6Ki
         O3Wg==
X-Gm-Message-State: AOAM530QgQcQdbkvztsZjSTu4oOYBOMgo8hJXTfDvujUN7SGc/Ung4Ph
	jCMY2cGrUbGJhupH4stJWuw=
X-Google-Smtp-Source: ABdhPJzGABrgVbqXqM0qsgciuACgzThRniFfbVtpTIiaUkUkhZ00iFN3+fVGYavAFupDn2rREYgquA==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr4407645wmi.5.1601491387204;
        Wed, 30 Sep 2020 11:43:07 -0700 (PDT)
Return-Path: <sudipm.mukherjee@gmail.com>
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id d13sm4318214wrp.44.2020.09.30.11.43.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 11:43:06 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] tracing: remove a pointless assignment
Date: Wed, 30 Sep 2020 19:43:03 +0100
Message-Id: <20200930184303.22896-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0

The variable 'len' has been assigned a value but is not used after that.
So, remove the assignement.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 kernel/trace/trace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index d3c75aab44ad..e13cb3baeff0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6662,7 +6662,6 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 		written = -EFAULT;
 	} else
 		written = cnt;
-	len = cnt;
 
 	if (tr->trace_marker_file && !list_empty(&tr->trace_marker_file->triggers)) {
 		/* do not add \n before testing triggers, but add \0 */
-- 
2.11.0
