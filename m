Return-Path: <SRS0=0p3m=FT=lists.elisa.tech=bounce+72012+221+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393DDC4361B
	for <linux-safety@archiver.kernel.org>; Tue, 15 Dec 2020 19:50:42 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D93822A99
	for <linux-safety@archiver.kernel.org>; Tue, 15 Dec 2020 19:50:41 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+221+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id hACAYY5279335xi8SLHltt3Q; Tue, 15 Dec 2020 11:50:41 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [5.68.98.115])
 by mx.groups.io with SMTP id smtpd.web09.1433.1608061840116157633
 for <linux-safety@lists.elisa.tech>;
 Tue, 15 Dec 2020 11:50:40 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 0)
	id 31983160D80; Tue, 15 Dec 2020 19:50:38 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: corbet@lwn.net,
	sudip.mukherjee@codethink.co.uk,
	lukas.bulwahn@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	devel@driverdev.osuosl.org,
	gregkh@linuxfoundation.org
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH] Documentation: process: Correct numbering
Date: Tue, 15 Dec 2020 19:50:35 +0000
Message-Id: <1608061835-5118-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: lDPzVvllLTXSVv1wHsUo3oE3x5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1608061841;
 bh=4XqAk/EpnV1/b8acSkN98aWO3O+dV0MfsWalLtiTYAc=;
 h=Cc:Date:From:Subject:To;
 b=sKYoO/x9WEX5fxSSUmU7lCCBiHduFCZimRh8C/JlzUm4o1o/t/VGJKDoYraPKEBaPqD
 DVjEfXQljoYgSjr0fsfbDZX9Uq84HdIAcESnwfoX8aDeWjQf8KZCEmqzWmnlip/2S5UV/
 zcmSviNYtU02SVYTttQWc+6Qc5KrEPvfYF8=

Renumber the steps in submit-checklist.rst as some numbers were skipped.

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 Documentation/process/submit-checklist.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index 1879f88..230ee42 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -75,44 +75,44 @@ and elsewhere regarding submitting Linux kernel patches.
 13) Has been build- and runtime tested with and without ``CONFIG_SMP`` and
     ``CONFIG_PREEMPT.``
 
-16) All codepaths have been exercised with all lockdep features enabled.
+14) All codepaths have been exercised with all lockdep features enabled.
 
-17) All new ``/proc`` entries are documented under ``Documentation/``
+15) All new ``/proc`` entries are documented under ``Documentation/``
 
-18) All new kernel boot parameters are documented in
+16) All new kernel boot parameters are documented in
     ``Documentation/admin-guide/kernel-parameters.rst``.
 
-19) All new module parameters are documented with ``MODULE_PARM_DESC()``
+17) All new module parameters are documented with ``MODULE_PARM_DESC()``
 
-20) All new userspace interfaces are documented in ``Documentation/ABI/``.
+18) All new userspace interfaces are documented in ``Documentation/ABI/``.
     See ``Documentation/ABI/README`` for more information.
     Patches that change userspace interfaces should be CCed to
     linux-api@vger.kernel.org.
 
-21) Check that it all passes ``make headers_check``.
+19) Check that it all passes ``make headers_check``.
 
-22) Has been checked with injection of at least slab and page-allocation
+20) Has been checked with injection of at least slab and page-allocation
     failures.  See ``Documentation/fault-injection/``.
 
     If the new code is substantial, addition of subsystem-specific fault
     injection might be appropriate.
 
-23) Newly-added code has been compiled with ``gcc -W`` (use
+21) Newly-added code has been compiled with ``gcc -W`` (use
     ``make EXTRA_CFLAGS=-W``).  This will generate lots of noise, but is good
     for finding bugs like "warning: comparison between signed and unsigned".
 
-24) Tested after it has been merged into the -mm patchset to make sure
+22) Tested after it has been merged into the -mm patchset to make sure
     that it still works with all of the other queued patches and various
     changes in the VM, VFS, and other subsystems.
 
-25) All memory barriers {e.g., ``barrier()``, ``rmb()``, ``wmb()``} need a
+23) All memory barriers {e.g., ``barrier()``, ``rmb()``, ``wmb()``} need a
     comment in the source code that explains the logic of what they are doing
     and why.
 
-26) If any ioctl's are added by the patch, then also update
+24) If any ioctl's are added by the patch, then also update
     ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
 
-27) If your modified source code depends on or uses any of the kernel
+25) If your modified source code depends on or uses any of the kernel
     APIs or features that are related to the following ``Kconfig`` symbols,
     then test multiple builds with the related ``Kconfig`` symbols disabled
     and/or ``=m`` (if that option is available) [not all of these at the
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#221): https://lists.elisa.tech/g/linux-safety/message/221
Mute This Topic: https://lists.elisa.tech/mt/78984776/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


