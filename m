Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.26720.1602451529127749319
 for <linux-safety@lists.elisa.tech>;
 Sun, 11 Oct 2020 14:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s+LGa/kT;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id e2so15610329wme.1
        for <linux-safety@lists.elisa.tech>; Sun, 11 Oct 2020 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FNN9OqkWHxkI2/FsUjbbTqtGt1jNhP9w+BKvnMiIIQI=;
        b=s+LGa/kT4lkSTkks6KB0yAW55qco2n1RBE7rjb9RfNzn5g6MQ7tRlgP/xN/qNO94jE
         qsad0x8X1jVeIUGGb9Nd7dg6MTksGtwW13Zqrp9m96R92Re98bkroi1LAq1YJLFjBATh
         hFaRlRFqIAtJezVPS1KPsla9ZONLsImKQQ6rtGJ6H2s+L3x755cOk3+gRwptvml+EckS
         3xO57Wxta5H38FmRXsK97p9EUhVkxX5APREzgGbpFI3Fo1W6umgDOTrLNC1kuCo4GTQh
         okIdRI/ycFYDwZd49CDW/MRlZE33SoggqfMxcrIlHnEpAE8SOJUzMFlqZWLYNmJZQ9UD
         nMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FNN9OqkWHxkI2/FsUjbbTqtGt1jNhP9w+BKvnMiIIQI=;
        b=JgqUrsfAKmUgZTUsPLYrcHhkR/kC6xxQ9a8tBM0pTA4cJnRVGT8Ze/X5jmVncxXCHm
         xh4Y02qJZmrZNsxpcbs5yc8HVsJvqmBfHP6tosA9NXEj8JnPT6jc6XTpK/xZPSVJcSrB
         O8T7d22PtnZdFf+h3iYkuGTpo76InllpLTtVq8pBGwVk1x9qnpOlZjY9AaAm18cPPhTh
         EceCLvDEkD2L3HeV/IJEVzlIsVqqtIcyXVq9N3IMkUHy2l5/RksiJazi9KCZhv+tko9x
         5gBpPcYrScF+9b1/T8SBCyvOVX6d0vEK5o9oH+L7AqxyR40mcxYwN4I6PfoCi7fhPAo9
         dP9Q==
X-Gm-Message-State: AOAM530kTt+k2XlOzf9DVAiSiojzWFxKcH6+MTen+xjXKEV0+IDgPs23
	dS0QjWGzlYFVT84idVbCGZc=
X-Google-Smtp-Source: ABdhPJxNEUKo2W9hGeuoPkuyK6LDZibfcvoGmM+X2LpblcY0/MsoiH5sox5Bs66Yf3mxRQU74EO8AQ==
X-Received: by 2002:a1c:2e0d:: with SMTP id u13mr7862095wmu.179.1602451527531;
        Sun, 11 Oct 2020 14:25:27 -0700 (PDT)
Return-Path: <sudipm.mukherjee@gmail.com>
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id z17sm8908722wrr.93.2020.10.11.14.25.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Oct 2020 14:25:27 -0700 (PDT)
From: "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
To: Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] e1000: drop unneeded assignment in e1000_set_itr()
Date: Sun, 11 Oct 2020 22:23:26 +0100
Message-Id: <20201011212326.2758-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0

The variable 'current_itr' is assigned to 0 before jumping to
'set_itr_now' but it has not been used after the jump. So, remove the
unneeded assignement.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/net/ethernet/intel/e1000/e1000_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index 5e28cf4fa2cd..042de276e632 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -2632,7 +2632,6 @@ static void e1000_set_itr(struct e1000_adapter *adapter)
 
 	/* for non-gigabit speeds, just fix the interrupt rate at 4000 */
 	if (unlikely(adapter->link_speed != SPEED_1000)) {
-		current_itr = 0;
 		new_itr = 4000;
 		goto set_itr_now;
 	}
-- 
2.11.0
