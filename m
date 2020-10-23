Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.2119.1603483012031597450
 for <linux-safety@lists.elisa.tech>;
 Fri, 23 Oct 2020 12:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jNKiz3vl;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dn5so2673852edb.10
        for <linux-safety@lists.elisa.tech>; Fri, 23 Oct 2020 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gs9Ph8IaZNOUoj4TYQUI3Ou8u+xm5f9EGbSdqQH05DQ=;
        b=jNKiz3vlWN+SsDX8nCMXEgwJSL6WxS+YOjFN+oQXadMCmumE616gvmUwx/5Z/HZIdi
         W0dX17XEvRxbZgy3VkIzoEG4b/7FD7OaOXPvMdy4CxJCUizMBmOhMGfUPp3e7bIMlIf0
         bYdspFbLNPL5CQ1uaO2XtiOZF0YOVljOj/Yh2fiYyVXTiN2HKBXcE9Ezn7SHZ6aMkrfY
         RsVpvvzuHt2qYT8o0he8RHkQfKnsrJ2AN50gGLEYQRHmikML+/kf/HrOILTN+BH3I9Y8
         eFSKSFXhwAGLaLGmDpt72AJv46ANRfXYpQbvZ6GF4DaLh+cFh1Ot0liTPvPYudQzZLOD
         3DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gs9Ph8IaZNOUoj4TYQUI3Ou8u+xm5f9EGbSdqQH05DQ=;
        b=kL9Rvn4PFHJN114walgr1meXMMRsHlezTNBynZqiZ/spf/At+jk3+G22YB7Qnup5qM
         r5FbdLptMmjO8MSkHnGzRm/zQ0pMdfTURlifYwInVTQmHGKikfGrmrYneqbOLi+Ue6Ne
         FcfukmZB7T+d7xk3IDfEU6/TQ992jmWCs51YleD5wMuSJ/1DEyloD9FB5NOmNX6DIKRi
         ZPg7aG4YQrlPxSDuwWB8tNn9jgfBWpaTthAITtQfhEX8mVMjc/kP9/Utb+SlR1WmDDTY
         kOphNyVKvR5w1xST2ozIcr5MlMGH5dL5d9GEsS4aXdI7BJa0oy1KcrctRQwZQDhRAS4O
         /8yw==
X-Gm-Message-State: AOAM533jwfpDNRs1m2d2exT9bYeXvIGKqSKisf91nQurrC30OQDWxTnq
	wck+EsGJVbPDNEyjZa5mu1t4xLgXzAjlCw==
X-Google-Smtp-Source: ABdhPJwku0JhUtMkQ4V4/HatzdDnYPNBS1NboAzL+QCOH8wc3hxicc+w3rkXbugh7G2bbHCxCJ5xCg==
X-Received: by 2002:aa7:cd8e:: with SMTP id x14mr4027351edv.173.1603483010023;
        Fri, 23 Oct 2020 12:56:50 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d20:a600:91f0:3b46:85c0:ebc7])
        by smtp.gmail.com with ESMTPSA id u26sm1211271eds.2.2020.10.23.12.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 12:56:49 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] net: cls_api: remove unneeded local variable in tc_dump_chain()
Date: Fri, 23 Oct 2020 21:56:40 +0200
Message-Id: <20201023195640.13391-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

make clang-analyzer on x86_64 defconfig caught my attention with:

net/sched/cls_api.c:2964:3: warning: Value stored to 'parent' is never read
  [clang-analyzer-deadcode.DeadStores]
                parent = 0;
                ^

net/sched/cls_api.c:2977:4: warning: Value stored to 'parent' is never read
  [clang-analyzer-deadcode.DeadStores]
                        parent = q->handle;
                        ^

Commit 32a4f5ecd738 ("net: sched: introduce chain object to uapi")
introduced tc_dump_chain() and this initial implementation already
contained these unneeded dead stores.

Simplify the code to make clang-analyzer happy.

As compilers will detect these unneeded assignments and optimize this
anyway, the resulting binary is identical before and after this change.

No functional change. No change in object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 net/sched/cls_api.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
index 41a55c6cbeb8..56517ed7e96c 100644
--- a/net/sched/cls_api.c
+++ b/net/sched/cls_api.c
@@ -2940,7 +2940,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
 	struct tcf_chain *chain;
 	long index_start;
 	long index;
-	u32 parent;
 	int err;
 
 	if (nlmsg_len(cb->nlh) < sizeof(*tcm))
@@ -2955,13 +2954,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
 		block = tcf_block_refcnt_get(net, tcm->tcm_block_index);
 		if (!block)
 			goto out;
-		/* If we work with block index, q is NULL and parent value
-		 * will never be used in the following code. The check
-		 * in tcf_fill_node prevents it. However, compiler does not
-		 * see that far, so set parent to zero to silence the warning
-		 * about parent being uninitialized.
-		 */
-		parent = 0;
 	} else {
 		const struct Qdisc_class_ops *cops;
 		struct net_device *dev;
@@ -2971,13 +2963,11 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
 		if (!dev)
 			return skb->len;
 
-		parent = tcm->tcm_parent;
-		if (!parent) {
+		if (!tcm->tcm_parent)
 			q = dev->qdisc;
-			parent = q->handle;
-		} else {
+		else
 			q = qdisc_lookup(dev, TC_H_MAJ(tcm->tcm_parent));
-		}
+
 		if (!q)
 			goto out;
 		cops = q->ops->cl_ops;
-- 
2.17.1
