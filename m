Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.1440.1601931465668821166
 for <linux-safety@lists.elisa.tech>;
 Mon, 05 Oct 2020 13:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQw3aCS/;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id v12so897784wmh.3
        for <linux-safety@lists.elisa.tech>; Mon, 05 Oct 2020 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0eiYnVUSZWaB7wjTbIdc+IOLA3BxLnNTNEEMhygD1Ts=;
        b=kQw3aCS/Afak1JMHu44Vl9eOt2UZHhjFsmf0/eoMBBrhfzNwwe4z9cFieF2+muK/Xn
         jW/6fEctYM5tOZ52kdkdFjj6CwFswNljkxUUglGD4d1sxepxX+nXDF7l7hs7gDP8v38J
         eY3DZaVWJDg0toAapAVa9U4P/94e2YaMIz6S6KsSLBl1rY2TZcra1qZl9jQ8zemCpqb2
         RbnB44Mmr76drR+GvahpSGXZzus56PsdwQN+2rT0lE6Leaoe2txdjGk9O9hwF8QHnLUv
         E03HZk/oA9qbcYZMtfiZeSsh1BpgTnesYp6K/MTEIXW7i3G4mYw25B7eABjnfjVqcsWC
         TB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0eiYnVUSZWaB7wjTbIdc+IOLA3BxLnNTNEEMhygD1Ts=;
        b=Won7UEhAqrcgvQbXnFhx61ygdf7V99kVhH6NgbKqJrXBW/gRRRWiYYr6vAAgXYlzPs
         nmA2WD0iHNeSTCdz+Vp/3Cr6T7eoQKJyY+gcMH6NAbFrhPfFZvGxpbpabsBGmeIDkghd
         hJVocyaEpHYAimHEPg6QC0rmJ+nQZs7/IMPkLpaBy+I5JHfpVJ+vWiD0n/H/IXylxZTk
         13Gk8vpbgwH1odK1jZdljcjbTpoh7LEhgTSzvhliurKAjtA2CF/bf4W+V5cT+hsKdGOw
         +Pa0Rg6nm49il6cIYla0nwU+oaCOqSg113FK7/WBruY3r9FDyA8hf6k9Dj3iJTJPDTK4
         AR1w==
X-Gm-Message-State: AOAM533i3LTPEeQ9IX4ugNCe2Y1lc2+3qoWGLa8ApJL0K7FSlKQdKE0p
	VZZDedHua454+KdWp6Q1ZSg=
X-Google-Smtp-Source: ABdhPJyYsi9VQcnonSkp6FT2w5YczNf/fjur2N+ipdQc3Q+Ko2Ny3v6++Z2bPFWyL7yGgMvbwKlu0A==
X-Received: by 2002:a05:600c:4108:: with SMTP id j8mr1235393wmi.116.1601931464022;
        Mon, 05 Oct 2020 13:57:44 -0700 (PDT)
Return-Path: <sudipm.mukherjee@gmail.com>
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id c16sm1515319wrx.31.2020.10.05.13.57.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 13:57:43 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] kernel/relay.c: drop unneeded initialization
Date: Mon,  5 Oct 2020 21:57:27 +0100
Message-Id: <20201005205727.1147-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0

The variable 'consumed' is initialized with the consumed count but
immediately after that the consumed count is updated and assigned to
'consumed' again thus overwriting the previous value.
So, drop the unneeded initialization.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

The resultant binary stayed same after this change. Verified with
md5sum which remained same with and without this change.

$ md5sum kernel/relay.o 
20854215a46e241520576a5d3c523073  kernel/relay.o

 kernel/relay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/relay.c b/kernel/relay.c
index fb4e0c530c08..b08d936d5fa7 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -1002,7 +1002,7 @@ static int relay_file_read_avail(struct rchan_buf *buf)
 	size_t subbuf_size = buf->chan->subbuf_size;
 	size_t n_subbufs = buf->chan->n_subbufs;
 	size_t produced = buf->subbufs_produced;
-	size_t consumed = buf->subbufs_consumed;
+	size_t consumed;
 
 	relay_file_read_consume(buf, 0, 0);
 
-- 
2.11.0
