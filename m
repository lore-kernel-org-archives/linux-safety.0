Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.9649.1603369155757195404
 for <linux-safety@lists.elisa.tech>;
 Thu, 22 Oct 2020 05:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XrWl3BsB;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id n18so2099556wrs.5
        for <linux-safety@lists.elisa.tech>; Thu, 22 Oct 2020 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=R5XsbNT2+v4PMPJ6Orq+zbKWSsCFMYz0hTLkHCIJRjs=;
        b=XrWl3BsBSgtE/cg6RPM+RkAFYxNxYyuo2hEetPXA+IFQDP2b1Lj0FErjwIWZtJkO9z
         INKgCmY+6KG2w+lc/5+oaO5CBC6IKxsyvIqCEDHvETVVvf3jD9J8YyiG6U847NeKvKen
         zSTKd7pb48z/Fo/F2oGeUBeYJzeCXaQRVxrPMqyXgL8pWsw5+UP827F6uHOsYdMnWolL
         1edSTtZxX+ioZAa2WCx2E761VsohE3kKVsqD8x2E0oI1yHEvC4/DeiUMSe8QPwdgWJM/
         dJetaID6MVA9lDMggSHlnt3ujsL8QIEmMj8qKd0JdDW5Z/ElCQfwCCg7RYK6+YERrPWb
         KQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=R5XsbNT2+v4PMPJ6Orq+zbKWSsCFMYz0hTLkHCIJRjs=;
        b=EpsBkHXVb3mboUXnyrPc3kQCXfjr7qNkyrwDjB9fEb4tPnjm2Gh+QAYqofUUv8mlRO
         oxqgBLj2TSkNWmp71cTByf8nh9P96DGhY9s6oc6Y+tJVkEAhBIsg4RnLcsgmu2cz/XFy
         zhYwBK9XO9n5nYOkyRhYnWdUl3pGBDycXKqkz2rvKGVdQ13XO36UtkppVRaIUQAsabnl
         0ZvZjgYbi1SBOp3xmTTsOS/+dfaMlCFtk1GA5NShbZswqVLvMygqxUyBulMoRYfI3rLC
         Hf8Rn4aubXS1Z6mc25Z8Rl3E7ErtAPtZ7RzLtM7M+Dl87ydwAmpOU9p9wWepeKsB1bVO
         92aw==
X-Gm-Message-State: AOAM532RyZBpM5Qpz6+MpHHkAleCh1JFSQ+NsfGaUTHb2Qm6KYNB2SlJ
	FdNUkvbW9esIY0WsB24EBEw9lJqrxv8=
X-Google-Smtp-Source: ABdhPJzNs5XukkCPM2LOfmZswQ8XSG3PN0ndM1Y/modAX3S19GnGQ/Jgu0qz0MrNmBwwrarBzUmDfQ==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr2358072wre.13.1603369153873;
        Thu, 22 Oct 2020 05:19:13 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia.fritz.box ([2001:16b8:2d01:7e00:2ced:5fc0:fc3e:a67f])
        by smtp.gmail.com with ESMTPSA id e13sm3525807wrt.57.2020.10.22.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 05:19:13 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
To: linux-safety@lists.elisa.tech
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] kernel/hung_task.c: make type annotations consistent
Date: Thu, 22 Oct 2020 14:19:03 +0200
Message-Id: <20201022121903.18673-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit 32927393dc1c ("sysctl: pass kernel pointers to ->proc_handler")
removed various __user annotations from function signatures as part of its
refactoring.

It also removed the __user annotation from proc_dohung_task_timeout_secs()
at its declaration in ./sched/sysctl.h, but not at its definition in
./kernel/hung_task.c.

Hence, sparse complains:

  kernel/hung_task.c:271:5: error: \
  symbol 'proc_dohung_task_timeout_secs' redeclared with different type \
  (incompatible argument 3 (different address spaces))

Adjust the annotation at the definition fitting to that refactoring to make
sparse happy again, which also resolves this warning from sparse:

  kernel/hung_task.c:277:52: warning: incorrect type in argument 3 \
    (different address spaces)
  kernel/hung_task.c:277:52:    expected void *
  kernel/hung_task.c:277:52:    got void [noderef] __user *buffer

No functional change. No change in object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 kernel/hung_task.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

please review, test and confirm that the object code does not change.

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index a672db830a94..bb2e3e15c84c 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -269,8 +269,7 @@ static long hung_timeout_jiffies(unsigned long last_checked,
  * Process updating of timeout sysctl
  */
 int proc_dohung_task_timeout_secs(struct ctl_table *table, int write,
-				  void __user *buffer,
-				  size_t *lenp, loff_t *ppos)
+				  void *buffer, size_t *lenp, loff_t *ppos)
 {
 	int ret;
 
-- 
2.17.1
