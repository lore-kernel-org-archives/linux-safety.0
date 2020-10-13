Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.10221.1602590274874717560
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 04:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=NRIfiIBo;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: Yhu9WA/5r9va4fZF9WIokqmfftVi91N56pJVe9WX0tjhUYnGixERtbfRRltQQztYIRwjmb65Gb
 uDf7KQtxSz2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="230074337"
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="230074337"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 04:57:52 -0700
IronPort-SDR: Hq3iclxoa1Dc6lypn6xS1SbWReePuVruD3PcqNIK5W15KkZAGywaPeKSGIuIK513iRl3XHm/98
 V+7pAY7dm7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="299581397"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2020 04:57:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Oct 2020 04:57:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Oct 2020 04:57:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 13 Oct 2020 04:57:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecWpYGyHasRHl4Ha1k68hxYNCp1cZOTpJyUSTmpPxQJdPNAGnrb2qNR9EllTEq/IBwF2oxeazgshexuP1NYj2uYIZmCDHaWiTKB9wWCrnW2QGvvY9jrPU+VWioKD/1F+MPoEddufKE1UK06krQA9l0aQzAEXNLYPb8LtVuJAR5zYbcsWaaYKXFbjNcphGV3/r06QKByA96gx77X0jcwMDq06GFsuc/6vpsWWGDW2AIhc1ztABauLM+qIVN1tUfs/WlZZPqS7ZegCeo3zoBj5WL12k9eCjlRxrpQte3Kw3WgfeCiRYzqfmiqeVMKAH6P7Ec706FqkfXNTjEE+gfRzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Uotm5tWDuLvV7AkGXKuQTOx5PnYvFgqY70iBzJXN48=;
 b=XwOygyamokQyndQlzaGtZoCZUcj/rSrYiLb5vB+aXf11NDBerSF5seEmQfOUaSIRHNiVulzAsUDzqDyXQRliH01Se7ikq5YwUJF8VrTQabU9FG6mBPCbOVJJ6sMCmact22xGM6sQCROag6eGS/kjdV26ZPZ4A5DMWTwrRKE8lFx9CyjVn0jsOo4V1N987Xbx3wtqdMLH2W46dFeZzfIZxPJs/UQ4aS8B+K5MTp9D8gcwT/LMw84DJjj1UXz61YPH7/oBM959dNGmIjUS84B4CaTNs19wk6JdvYpiHIbbQ+L6RIUawEvSfG/PoZN9KXHGfw0sSdrOQJoCnKmAmOsTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Uotm5tWDuLvV7AkGXKuQTOx5PnYvFgqY70iBzJXN48=;
 b=NRIfiIBojIWbpkWH5DOmBeImQ8Ga6ANb6RVcFAScCqTpHPN2Q4gpY/12vF2jkLxzv7R+MSzR3y1+4WWdyTapdtLvRK73j40fhCr0NcqanLmSwo78LXpQxFqlblvRiVKv0Q6CAea0scU1FKYbuTQ2OjyNDePYPNOvNPCZsOkBET8=
Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB3968.namprd11.prod.outlook.com (2603:10b6:208:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 13 Oct
 2020 11:57:50 +0000
Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b%6]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 11:57:50 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
CC: "safety-architecture@lists.elisa.tech"
	<safety-architecture@lists.elisa.tech>
Subject: Re: [linux-safety] [RFC PATCH 1/2] bust_spinlocks: add kernel-doc format doc
Thread-Topic: [linux-safety] [RFC PATCH 1/2] bust_spinlocks: add kernel-doc
 format doc
Thread-Index: AQHWoUZTrE3jiFOV4kqlKZVL1POLCqmVbYZg
Date: Tue, 13 Oct 2020 11:57:50 +0000
Message-ID: <MN2PR11MB4158BBC589A2141F5114244688040@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <163D8465C352C96E.25724@lists.elisa.tech>
In-Reply-To: <163D8465C352C96E.25724@lists.elisa.tech>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [93.57.250.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5782bfd7-80f6-4153-d9db-08d86f6f3582
x-ms-traffictypediagnostic: MN2PR11MB3968:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB396864AA65FD7B366061B82388040@MN2PR11MB3968.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5YiIeArbPTQroCrzsRTRwYtD5+nej4gs+oGhBJClojPD+aensNh08aYaOLxkmOEf/Lf6v69ToSWZ2gIKrRe1yWyone5YXiiV7RMM56pw0VZGgd9IF4P1YQ1oygcs7+TF+SVu5MYTpX0+X4QyFl7EAWwiwCCXrHn/G18kFdyHtXVLn7u2bq+7S3T5ZGwBpoj75PF0/ARgHdkykQUlmk+OPQR3IF0ozuxyKCcVre6rdGLj2b/Ht29ycJt11k8rEA//Y2uvbfut/py+UevZdqAtXVhdQYl46tdaHvP9MDPZbiSYlMIepRs3O5GWeEPW+WSI0FWJvVxkLzc7wKEvmpX2AU+cLG2QKoIpFufC+3+o0NO87wFj9niUmqqyq7v+KeEF+Nk8AqwY9TC6PJ/UrBJYPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4158.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(86362001)(966005)(8676002)(6506007)(53546011)(83380400001)(450100002)(478600001)(2906002)(33656002)(4326008)(9686003)(83080400001)(64756008)(316002)(26005)(186003)(110136005)(52536014)(66946007)(76116006)(66446008)(71200400001)(5660300002)(7696005)(55016002)(66476007)(66556008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: wK1aP1ixbQaYvVzI6dYDpUoB7Ynv6YBQBPHmZalxluIda7vLsjExRZpOhEgGVmYwEDg7h7tAT+6tSOBMMGa5MMDWnv4N6d3PxUn6cfrfudwlzljjD57MoXH3f5zh7VnBq7NekHZmClxwE70uZtntYkHPF4H5Z1uagIQC5DJzcIvAE1pp8GIjE7ZEk1xJrXm8ursI9lmH6onl83CD9sKQKEN9u5m/oSqATfj4NcbzbJsOK0RO2OhRKQzRoL+p2g+RCy69B/qTf5c3t/iLC3nnP+HMMAhNEUrDptCjz06opsmBZIBYsBb8e4Yx45YDBZyBq2tKoF06lGok7x5NUfWcfAPK8uHA7YjMVMGUAghoMSxen5X4skorTO/XeujLDkAvJSO7NxhJ8K3HepoIw1I4FNW9PeLDuSq/+vfoEMKKNreyf8Axg4txmDiUGYHeWd/MniTq18ZZiwAABjN/Zs1Gkavz7TIlyFCLV3KYK8QvZXB53UpLJXVqHKWVI9ze9i5RzmJFuMY49AODRa8Fs9lhxuXiBmG+iUq8znRLXJMga+tyaQjkiLyZP9YKZ0ol3LHOnGE1+rm6DthXZJxmnTpxC0Bw2Wp+OUKTMU6+XU639XMBUGO6MCcZRRLj5AvBspgOeJaojwA1d8iNpkPqR6UUvA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5782bfd7-80f6-4153-d9db-08d86f6f3582
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 11:57:50.1836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2DyLC8veds0XeVUUN8ED7SohbQteNU7cD6FaCI0pdkDPPRIyKQq4pyVoxLJbyRk0btPw8OSkslb5CbrXs79JuZChlPmIbA9CzqW3/y+SKYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3968
Return-Path: gabriele.paoloni@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

+CC safety arch mailing list

> -----Original Message-----
> From: linux-safety@lists.elisa.tech <linux-safety@lists.elisa.tech> On B=
ehalf
> Of Paoloni, Gabriele
> Sent: Tuesday, October 13, 2020 11:50 AM
> To: linux-safety@lists.elisa.tech
> Cc: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> Subject: [linux-safety] [RFC PATCH 1/2] bust_spinlocks: add kernel-doc
> format doc
>=20
> In the ELISA Linux Foundation project we are trying to
> improve the functions' documentation to make it more suitable
> to derive functions' specs and write unit tests. This is needed
> to make Linux more usable in functional safety systems.
> So I am adding a proper kernel-doc format for bust_spinlocks.
>=20
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> ---
> With respect to this patch I have a question on how to set
> the function context; i.e. I don't know if it can be executed
> in any context or if it has limitations.
> ---
>  lib/bust_spinlocks.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> index 8be59f84eaea..594b270161d9 100644
> --- a/lib/bust_spinlocks.c
> +++ b/lib/bust_spinlocks.c
> @@ -5,8 +5,6 @@
>   * Provides a minimal bust_spinlocks for architectures which don't
>   * have one of their own.
>   *
> - * bust_spinlocks() clears any spinlocks which would prevent oops, die(=
),
> BUG()
> - * and panic() information from reaching the user.
>   */
>=20
>  #include <linux/kernel.h>
> @@ -17,6 +15,15 @@
>  #include <linux/vt_kern.h>
>  #include <linux/console.h>
>=20
> +/**
> + * bust_spinlocks - increases or decreases oops_in_progress.
> + * if oops_in_progress !=3D 0 spinlocks which would prevent
> + * oops, die(), BUG() and panic() information from reaching
> + * the user are busted.
> + * @yes: input flag; if zero decreases oops_in_progress,
> + * otherwise increases it.
> + *
> + */
>  void bust_spinlocks(int yes)
>  {
>  	if (yes) {
> --
> 2.25.1
>=20
> ---------------------------------------------------------------------
> INTEL CORPORATION ITALIA S.p.A. con unico socio
> Sede: Milanofiori Palazzo E 4
> CAP 20094 Assago (MI)
> Capitale Sociale Euro 104.000,00 interamente versato
> Partita I.V.A. e Codice Fiscale  04236760155
> Repertorio Economico Amministrativo n. 997124
> Registro delle Imprese di Milano nr. 183983/5281/33
> Soggetta ad attivita' di direzione e coordinamento di
> INTEL CORPORATION, USA
>=20
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>=20
>=20
>=20
>=20
>=20

---------------------------------------------------------------------
INTEL CORPORATION ITALIA S.p.A. con unico socio
Sede: Milanofiori Palazzo E 4=20
CAP 20094 Assago (MI)
Capitale Sociale Euro 104.000,00 interamente versato
Partita I.V.A. e Codice Fiscale  04236760155
Repertorio Economico Amministrativo n. 997124=20
Registro delle Imprese di Milano nr. 183983/5281/33
Soggetta ad attivita' di direzione e coordinamento di=20
INTEL CORPORATION, USA

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
