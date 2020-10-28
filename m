Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.7457.1603884944601564240
 for <linux-safety@lists.elisa.tech>;
 Wed, 28 Oct 2020 04:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iA5zf/Fl;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id w23so4220128wmi.4
        for <linux-safety@lists.elisa.tech>; Wed, 28 Oct 2020 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vjJC6dKOMFG4vb3AckKIuCP1t5bMO9lbc9KLXiwHlCo=;
        b=iA5zf/FlqjobUMNllNoEUYcZhA0WkST3Kufe8sISdot6joDpSTMZ6yeIW2JNyD98IM
         6+aHJMEE+sEmNs7Y1VGX1gB5+Eq03HvCPcgWkIMf3jsfpp/Aa2O3bZ6U9kDNoqB8sWX3
         Cruq46ytfedaQZUEALfYwCRQJJZbD/6UZq/yyNK03QgVttWCnd4sXrMMYQO6Yp9CB+za
         C/4yq1jf+tuP6ed0/5qTxiHW+HYjGsbPRGWR39qwTEDmX6QTzmPJgUVUCOyke9ZqhLmE
         HT4YL9z7YgKQdLEK0zsx6u/wq44s7nZ6RMYrp3o60UK1gbH2C1g0xpPJPU+wklgzl4dd
         WWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vjJC6dKOMFG4vb3AckKIuCP1t5bMO9lbc9KLXiwHlCo=;
        b=EYiEUlCpQ7KJ9Av7NqnMmw8Qv7you3Rz96vO16SKKqkI1tyUpR0MgLnDrx6RzqiU6A
         OQIVcLRBDI7kCuiudpiUbD/biPLWHjDAmZAO/K6RiNeK1f/owKekITG0/YVfp7+VTEx1
         hIdhynZu9QMfDuedfVEqnPfqdmaWrjl8gubl2bEFeFEAXsC5trlWKOqj+g5/QPWdP74A
         nlVgsHvtH3O3+mIAMBqtM2bPzkSYUKlKxnhTSEKXvfDoMjlru5DXQeKLh7iqoTyh1Hbc
         SKc2IRV1jNoxuYuFC5gCopxRIAlKYkFwZMwFfSylzLq9p3SwsNZNwAnWK+osGQM9oJRx
         RX1Q==
X-Gm-Message-State: AOAM5306divG2Sp4Vr5An4EpeEUQKi43Kj24FZ54aWBCuNXpjv7qQbIj
	yg+7Na7+5xzg2jR6It7p3Oc=
X-Google-Smtp-Source: ABdhPJzWzEGUl4KjLGJ2WRgqfIWkz3spMlmRWhF49/keLE8mg7+Jda9ImH3eqzpeVCsqwUWpshUujw==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr7798630wmc.87.1603884943015;
        Wed, 28 Oct 2020 04:35:43 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d7a:200:a915:6596:e9b0:4f60])
        by smtp.gmail.com with ESMTPSA id s11sm6579979wrm.56.2020.10.28.04.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:35:42 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	clang-built-linux@googlegroups.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] net: cls_api: remove unneeded local variable in tc_dump_chain()
Date: Wed, 28 Oct 2020 12:35:33 +0100
Message-Id: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
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
applies cleanly on current master and next-20201028

Jamal, Cong, Jiri, please ack.
David, Jakub, please pick this minor non-urgent clean-up patch.

 net/sched/cls_api.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
index faeabff283a2..8ce830ca5f92 100644
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
