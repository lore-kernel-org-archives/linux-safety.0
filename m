Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.31.1601933528064505995
 for <linux-safety@lists.elisa.tech>;
 Mon, 05 Oct 2020 14:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jyV5eB05;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id z22so865357wmi.0
        for <linux-safety@lists.elisa.tech>; Mon, 05 Oct 2020 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=o3Ej3LavHo/S663DnWXhpENRkd1MBuaBAhHjxbMV30s=;
        b=jyV5eB05miHoZqZ0XtU79dn4XyVWl5bBvj4y6c/qdqgb7oUCoG45AZ0/1VbwBHHDP2
         qogvIKBEX4MeuFVH/coQvrR5GLJXRAh9RrmQg7F5OtLSQ0XkDqBZg+eN6mPN0GahEi/P
         pIrlK8rpMeS6zHCSfaBdCWeqWSPy1917Ic2D3bvGzx7M2r3tSXWFeSfPTe7LGRqKcxEL
         CC24abMJ0KFZ7aK2DG2WMLt1RIRWs85Z0KNaFIssjIQ33xU3VhUg4KJ/HW2lLPChYHrN
         sEAtCg6AIPjddhnq+cTi6b2Hro/C0jh+12ngjZ6rgM3HgfVv72t5yu+9qfJ8rw5w0/A3
         sGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=o3Ej3LavHo/S663DnWXhpENRkd1MBuaBAhHjxbMV30s=;
        b=WsR9Mqj+NoD1gEIulERJQpe7QBheVFBsd/zubMlcx9vBclKzh9g/GXjxSmcZd8p9Y2
         exy4mxIKA0Zf4P07dE8U7mmVEkBDBvGoEHUWx/9JGPgHEPsHdeOA/XbEN0dq9WDTiSNT
         YqC1sankf22DWbVuNxKsHipGn+bL9EYg+/ILAHS8Hu7wXBDkmQd3iqkQ8pVx7xOasn34
         uNLBjMdBWAv2Xn3uMBpmo96ACbusguOtC8bMdziboRCBgl5sR68kzcEFjpVHe5nn/NIk
         zJl0FPFtlGnzB2fWyL3jJsgNew7jXxfXTo6SlFl43HSyXBQiVcwMDeb7RuAtY4OP6WPC
         A7mA==
X-Gm-Message-State: AOAM533JWN4Or6JxRNUP+SZ2DLWr8Ez3wOm4GUff/gbrN2aU1wL/uMgg
	2VQXZqejS/8fd8mkCz1MrlY=
X-Google-Smtp-Source: ABdhPJzZRxNQ/305lZa0njFqzSW0QW0eoQM1oNffk9v2kzF6D9dfQMiMJZvwTogMHAlr2n5+uPeulQ==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr1302967wmc.84.1601933526399;
        Mon, 05 Oct 2020 14:32:06 -0700 (PDT)
Return-Path: <sudipm.mukherjee@gmail.com>
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id q9sm1474013wrd.57.2020.10.05.14.32.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 14:32:05 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	linux-usb@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] usb: host: ehci-sched: avoid possible NULL dereference
Date: Mon,  5 Oct 2020 22:31:49 +0100
Message-Id: <20201005213149.12332-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0

find_tt() can return NULL or the error value in ERR_PTR() and
dereferencing the return value without checking for the error can
lead to a possible dereference of NULL pointer or ERR_PTR().

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/usb/host/ehci-sched.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index 6dfb242f9a4b..f3fd7e9fe6b2 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -245,6 +245,8 @@ static void reserve_release_intr_bandwidth(struct ehci_hcd *ehci,
 	/* FS/LS bus bandwidth */
 	if (tt_usecs) {
 		tt = find_tt(qh->ps.udev);
+		if (IS_ERR_OR_NULL(tt))
+			return;
 		if (sign > 0)
 			list_add_tail(&qh->ps.ps_list, &tt->ps_list);
 		else
@@ -1338,6 +1340,8 @@ static void reserve_release_iso_bandwidth(struct ehci_hcd *ehci,
 		}
 
 		tt = find_tt(stream->ps.udev);
+		if (IS_ERR_OR_NULL(tt))
+			return;
 		if (sign > 0)
 			list_add_tail(&stream->ps.ps_list, &tt->ps_list);
 		else
-- 
2.11.0
