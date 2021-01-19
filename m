Return-Path: <SRS0=3ITB=GW=lists.elisa.tech=bounce+72012+232+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2426BC433DB
	for <linux-safety@archiver.kernel.org>; Tue, 19 Jan 2021 10:26:30 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F04823134
	for <linux-safety@archiver.kernel.org>; Tue, 19 Jan 2021 10:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+232+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id eWfqYY5279335x77o9ic3149; Tue, 19 Jan 2021 02:26:28 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [90.222.153.26])
 by mx.groups.io with SMTP id smtpd.web08.9678.1611051987092013857
 for <linux-safety@lists.elisa.tech>;
 Tue, 19 Jan 2021 02:26:27 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 0)
	id 8FF8A160D15; Tue, 19 Jan 2021 10:26:22 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: lukas.bulwahn@gmail.com,
	sudip.mukherjee@codethink.co.uk,
	linux-safety@lists.elisa.tech,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	harryxiyou@gmail.com,
	alex.shi@linux.alibaba.com
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH] docs: Change reference that was to removed file
Date: Tue, 19 Jan 2021 10:26:20 +0000
Message-Id: <1611051980-3834-1-git-send-email-milan.lakhani@codethink.co.uk>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: GGtbfT39ILTUk3g0KMnkah4Rx5278000AA=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1611051988;
 bh=+NvvZ/QM4p9UDni2T1g+dQwo50h/SOMH3ccxJJYO5Oc=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=nEyoGU7dHTJ6mZSu/YU/xAIe7aabY+kH6g4vbl05Ij+tgItE2sw/M04hxMFAqLatIif
 iAkOod4/rt+pGGtoNLHz9iti9LBohEG7u23PcU69GpaAPhbpYHvNgRWYFa1rDJdKOCvEY
 0flkx2mjSeaFoWGcO5BmFzGpcV0NrLoIYe0=

There were two references to
Documentation/devicetree/booting-without-of.rst for dtb format
information. This file has been removed, so I have changed the links to
Documentation/devicetree/usage-model.rst for this information, which
itself points to https://elinux.org/Device_Tree_Usage for an overview of
the device tree data format.

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 Documentation/arm/booting.rst                | 2 +-
 Documentation/translations/zh_CN/arm/Booting | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm/booting.rst b/Documentation/arm/booting.rst
index a226345..5392d01 100644
--- a/Documentation/arm/booting.rst
+++ b/Documentation/arm/booting.rst
@@ -128,7 +128,7 @@ it.  The recommended placement is in the first 16KiB o=
f RAM.
=20
 The boot loader must load a device tree image (dtb) into system ram
 at a 64bit aligned address and initialize it with the boot data.  The
-dtb format is documented in Documentation/devicetree/booting-without-of.r=
st.
+dtb format is documented in Documentation/devicetree/usage-model.rst.
 The kernel will look for the dtb magic value of 0xd00dfeed at the dtb
 physical address to determine if a dtb has been passed instead of a
 tagged list.
diff --git a/Documentation/translations/zh_CN/arm/Booting b/Documentation/=
translations/zh_CN/arm/Booting
index c3d26ce..d2939c7 100644
--- a/Documentation/translations/zh_CN/arm/Booting
+++ b/Documentation/translations/zh_CN/arm/Booting
@@ -124,7 +124,7 @@ bootloader =E5=BF=85=E9=A1=BB=E4=BC=A0=E9=80=92=E4=B8=
=80=E4=B8=AA=E7=B3=BB=E7=BB=9F=E5=86=85=E5=AD=98=E7=9A=84=E4=BD=8D=E7=BD=
=AE=E5=92=8C=E6=9C=80=E5=B0=8F=E5=80=BC=EF=BC=8C=E4=BB=A5=E5=8F=8A=E6=A0=
=B9=E6=96=87=E4=BB=B6
=20
 bootloader =E5=BF=85=E9=A1=BB=E4=BB=A5 64bit =E5=9C=B0=E5=9D=80=E5=AF=B9=
=E9=BD=90=E7=9A=84=E5=BD=A2=E5=BC=8F=E5=8A=A0=E8=BD=BD=E4=B8=80=E4=B8=AA=
=E8=AE=BE=E5=A4=87=E6=A0=91=E6=98=A0=E5=83=8F(dtb)=E5=88=B0=E7=B3=BB=E7=BB=
=
=9F
 RAM =E4=B8=AD=EF=BC=8C=E5=B9=B6=E7=94=A8=E5=90=AF=E5=8A=A8=E6=95=B0=E6=8D=
=
=AE=E5=88=9D=E5=A7=8B=E5=8C=96=E5=AE=83=E3=80=82dtb =E6=A0=BC=E5=BC=8F=E5=
=9C=A8=E6=96=87=E6=A1=A3
-Documentation/devicetree/booting-without-of.rst =E4=B8=AD=E3=80=82=E5=86=
=85=E6=A0=B8=E5=B0=86=E4=BC=9A=E5=9C=A8
+Documentation/devicetree/usage-model.rst =E4=B8=AD=E3=80=82=E5=86=85=E6=
=A0=B8=E5=B0=86=E4=BC=9A=E5=9C=A8
 dtb =E7=89=A9=E7=90=86=E5=9C=B0=E5=9D=80=E5=A4=84=E6=9F=A5=E6=89=BE dtb =
=E9=AD=94=E6=95=B0=E5=80=BC=EF=BC=880xd00dfeed=EF=BC=89=EF=BC=8C=E4=BB=A5=
=E7=A1=AE=E5=AE=9A dtb =E6=98=AF=E5=90=A6=E5=B7=B2=E7=BB=8F=E4=BB=A3=E6=9B=
=
=BF
 =E6=A0=87=E7=AD=BE=E5=88=97=E8=A1=A8=E8=A2=AB=E4=BC=A0=E9=80=92=E8=BF=9B=
=E6=9D=A5=E3=80=82
=20
--=20
2.7.4



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#232): https://lists.elisa.tech/g/linux-safety/message/=
232
Mute This Topic: https://lists.elisa.tech/mt/79948363/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@a=
rchiver.kernel.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


