Return-Path: <SRS0=0hIL=EW=lists.elisa.tech=bounce+72012+172+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F036C2D0A3
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 17:10:02 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B1F20E65
	for <linux-safety@archiver.kernel.org>; Mon, 16 Nov 2020 17:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="ufF+p8GA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99B1F20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+172+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id PU0GYY5279335xIlpkYvNGpf; Mon, 16 Nov 2020 09:10:01 -0800
X-Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.38098.1605546112542513008
 for <linux-safety@lists.elisa.tech>;
 Mon, 16 Nov 2020 09:01:52 -0800
X-Received: by mail-wm1-f68.google.com with SMTP id a3so24241052wmb.5
        for <linux-safety@lists.elisa.tech>; Mon, 16 Nov 2020 09:01:52 -0800 (PST)
X-Gm-Message-State: MynRQIBtIetwLQDyEBwuVPrcx5278000AA=
X-Google-Smtp-Source: ABdhPJzI6XAZ9igUYwWvC227Lh/pGF/9AZ8r1Lo0t64282p84UhM0xX65sPVYICkN7HZC6IeMKV9ow==
X-Received: by 2002:a1c:c286:: with SMTP id s128mr16426739wmf.88.1605546110875;
        Mon, 16 Nov 2020 09:01:50 -0800 (PST)
X-Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d134sm20299429wmd.8.2020.11.16.09.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:01:49 -0800 (PST)
Date: Mon, 16 Nov 2020 18:01:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
	linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [linux-safety] [PATCH] PCI: tegra: Use PTR_ERR_OR_ZERO
Message-ID: <20201116170137.GA2587640@ulmo>
References: <20201116165407.8050-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201116165407.8050-1-sudipm.mukherjee@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605546601;
 bh=uFCk1fO+B85T79RVuEbQss73Z2uapI10RHQvdqeXYIw=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=ufF+p8GA1uRJa7aJKW1rIj4tiPwH6mOBuUXV8KgC2v6sTOL3M8nig29As2D5MpMbo50
 14MObnwWIEP+Rpq7xp/SX1kHPQq6QRTlcGX/z9r860ZTbnU6v33fv7cPgybm43upHXPOR
 3oOBVVR5VVapevJaZuq27Eyei1YmppUoHmo=

--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 04:54:07PM +0000, Sudip Mukherjee wrote:
> Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
> we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
> doing 'return 0'.
>=20
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

This has been proposed multiple times in the past and Bjorn and I have
agreed every time that this is not an improvement, so sorry, but NAK.

Thierry


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#172): https://lists.elisa.tech/g/linux-safety/message/=
172
Mute This Topic: https://lists.elisa.tech/mt/78296400/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@a=
rchiver.kernel.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+ysHsACgkQ3SOs138+
s6GC7xAAnSsYlESiX6ESGZs1qV+dr+SktWx1QxMTKlk4fG43Mryvctb5YZb8vq2F
YZSf0Z/c1W9TbPrn2OLF3ZGi9dZanU5VsRzIiiCXXUF1NPLIdELn2Nes0WpBD9i2
6ZoUqRG4n3+8av6H3m3VJdbGElBOdFpGDcrzw1v7RQFjkBRYBtCKV7GxJo7so7u5
FgSBoJB/qL5+DVxa/6DJNtmiYqBk4ZGKpiTOVPzTgN1Fb3ZKoz/KPuql7cmunwxV
BbB2Xnibu3yJDW/TxaHin7+xUGTc9J9HAtIOKmY2ZnBeVDW6NC9e31x9i13efMLe
nLFLfw0KNdsHiex4aRgdEHqtZxYOCBUWA0vbMuzG5dnzCkZTZzqvn+Nvw/wntAv8
O7v/SK2j4cuo8g9V2alT8PKU99xALK9K4sxnZaN18sluR0Kx3JwLNnyT7Mqnpdwn
hwrvcHC34nNGAgrVri/SPzFPQt7zUrJHYlCjad5CS4G/sX+dr+AtnJ3gSAEFKo5R
+7YGVow03aIon+34KSyM+WBZrl+xwWxUlc04lr48UwavftC2Bp52Trup/yOaEUpi
3jOmv3hel97NrRun3JZA1SxD86wGuVUWRlDSAbTR6BDgau5bGViGRCobqRYGbA/w
nwgs2ETztkeL2jlyI5nVufNgQJ77SdECYl5Zm3Ga1xqMKZHaOK8=
=hvDV
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
