Return-Path: <SRS0=Ki0m=GP=lists.elisa.tech=bounce+72012+231+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EA1C433E9
	for <linux-safety@archiver.kernel.org>; Tue, 12 Jan 2021 13:43:58 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2B622285
	for <linux-safety@archiver.kernel.org>; Tue, 12 Jan 2021 13:43:57 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+231+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id PfmUYY5279335xC9l5nMPUg7; Tue, 12 Jan 2021 05:43:57 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [5.68.98.115])
 by mx.groups.io with SMTP id smtpd.web11.8998.1610459036305662920
 for <linux-safety@lists.elisa.tech>;
 Tue, 12 Jan 2021 05:43:56 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 0)
	id 79D43160D80; Tue, 12 Jan 2021 13:43:54 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: lukas.bulwahn@gmail.com,
	sudip.mukherjee@codethink.co.uk,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	linux-doc@vger.kernel.org,
	hch@lst.de
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH] docs: Remove make headers_check from checklist
Date: Tue, 12 Jan 2021 13:41:01 +0000
Message-Id: <1610458861-2832-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: qkzPYlI4ydedM7bLcbWwR8xXx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1610459037;
 bh=5YJ8DMwR0kf9lnJglG1Rk1DF71mzstWre2pW13/lVXo=;
 h=Cc:Date:From:Subject:To;
 b=WWiuI8hzNGjs04gmyNV9Lcp+b84YDmMCXu4IbDdShknwLyjymvwSAI89Uv4M78Zelzz
 uiMsj0ARtNdTEgDvbqVvgkuLakogRgJjJf3Glt2rJUZw6chCSUQui0gzjkOoHbdmOnynU
 gOv8lCGfJ/WZeEbaQWNpe1f7t67/i+jz/qI=

Remove the make headers_check step from submit-checklist.rst as this is
no longer functional.

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 Documentation/process/submit-checklist.rst | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index 230ee42..f709bea 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -89,30 +89,28 @@ and elsewhere regarding submitting Linux kernel patches.
     Patches that change userspace interfaces should be CCed to
     linux-api@vger.kernel.org.
 
-19) Check that it all passes ``make headers_check``.
-
-20) Has been checked with injection of at least slab and page-allocation
+19) Has been checked with injection of at least slab and page-allocation
     failures.  See ``Documentation/fault-injection/``.
 
     If the new code is substantial, addition of subsystem-specific fault
     injection might be appropriate.
 
-21) Newly-added code has been compiled with ``gcc -W`` (use
+20) Newly-added code has been compiled with ``gcc -W`` (use
     ``make EXTRA_CFLAGS=-W``).  This will generate lots of noise, but is good
     for finding bugs like "warning: comparison between signed and unsigned".
 
-22) Tested after it has been merged into the -mm patchset to make sure
+21) Tested after it has been merged into the -mm patchset to make sure
     that it still works with all of the other queued patches and various
     changes in the VM, VFS, and other subsystems.
 
-23) All memory barriers {e.g., ``barrier()``, ``rmb()``, ``wmb()``} need a
+22) All memory barriers {e.g., ``barrier()``, ``rmb()``, ``wmb()``} need a
     comment in the source code that explains the logic of what they are doing
     and why.
 
-24) If any ioctl's are added by the patch, then also update
+23) If any ioctl's are added by the patch, then also update
     ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
 
-25) If your modified source code depends on or uses any of the kernel
+24) If your modified source code depends on or uses any of the kernel
     APIs or features that are related to the following ``Kconfig`` symbols,
     then test multiple builds with the related ``Kconfig`` symbols disabled
     and/or ``=m`` (if that option is available) [not all of these at the
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#231): https://lists.elisa.tech/g/linux-safety/message/231
Mute This Topic: https://lists.elisa.tech/mt/79623000/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


