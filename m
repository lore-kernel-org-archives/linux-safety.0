Return-Path: <SRS0=hn7s=PW=lists.elisa.tech=bounce+72012+261+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461DDC433FE
	for <linux-safety@archiver.kernel.org>; Wed,  3 Nov 2021 23:28:36 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8FD61106
	for <linux-safety@archiver.kernel.org>; Wed,  3 Nov 2021 23:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF8FD61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id x9TSYY5279335xpwtkBn6BQb; Wed, 03 Nov 2021 16:28:35 -0700
X-Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4676.1635982114942806572
 for <linux-safety@lists.elisa.tech>;
 Wed, 03 Nov 2021 16:28:35 -0700
X-Received: by mail-pl1-f171.google.com with SMTP id k4so4136973plx.8
        for <linux-safety@lists.elisa.tech>; Wed, 03 Nov 2021 16:28:34 -0700 (PDT)
X-Gm-Message-State: KcBnFg3wqlg4AisSLaj1ZFbwx5278000AA=
X-Google-Smtp-Source: ABdhPJzOONsgvJ75M07O3ej9pW7+V/r7plAxHaLSPzW9DoG6X2iIFLlzd6QIAxnlJEjozPBSRIDhoA==
X-Received: by 2002:a17:90a:62c1:: with SMTP id k1mr17929460pjs.33.1635982113867;
        Wed, 03 Nov 2021 16:28:33 -0700 (PDT)
X-Received: from localhost.localdomain ([171.224.180.34])
        by smtp.gmail.com with ESMTPSA id a15sm3606225pfv.90.2021.11.03.16.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:28:33 -0700 (PDT)
From: "Nghia Le" <nghialm78@gmail.com>
To: linux-safety@lists.elisa.tech,
	lukas.bulwahn@gmail.com
Cc: Nghia Le <nghialm78@gmail.com>
Subject: [linux-safety] [PATCH] ipv6: remove useless assignment to newinet in tcp_v6_syn_recv_sock()
Date: Thu,  4 Nov 2021 06:27:22 +0700
Message-ID: <20211103232722.30999-1-nghialm78@gmail.com>
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
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1635982115;
 bh=pwgOw/84MicTmDNG6jp0AU0u7PYwVbCLneE8grmSG2k=;
 h=Cc:Date:From:Subject:To;
 b=rnWOsMZoyC2gRXRpZmdTNRepzi1ytPdmnxe0A1eRcfsnMqAT/GExiA5u8rBnlcX4X2Y
 r7cu4s2DdeYEqWtY5m5AL/POXjbi9TVfQl+DHzCkGQhUEoV3mRs88VRUKk+yOz3pitxDr
 eNxPz5g2/OGgnp8g//GfvVd7dW58x28Qyl0=
Message-ID: <20211103232722.rWvvanakj0byG7NJOVN18fHkWZHSx2_TVcpPKWmiYHw@z>

The newinet value is initialized with inet_sk() in a block code starting
from checking condition of protocol to exiting by returning newsk
structure. Along the code path, newinet is never read. Thus, assignment
to newinet is wredundant and can be removed.

Signed-off-by: Nghia Le <nghialm78@gmail.com>
---
 net/ipv6/tcp_ipv6.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 2cc9b0e53ad1..551fce49841d 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1263,7 +1263,6 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
 
 		inet_sk(newsk)->pinet6 = tcp_inet6_sk(newsk);
 
-		newinet = inet_sk(newsk);
 		newnp = tcp_inet6_sk(newsk);
 		newtp = tcp_sk(newsk);
 
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#261): https://lists.elisa.tech/g/linux-safety/message/261
Mute This Topic: https://lists.elisa.tech/mt/86805127/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


