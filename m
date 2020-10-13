Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.10080.1602590262437154496
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 04:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=HgkzB6Oc;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: 2hWBslUfRFWyBRWA3+K6DnErKPGBluZXLX/yShqszWnjRzLmT6b4+4FJOTtGV7m8UmKxTyJv3v
 2P3CkL1ZbKcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="153726299"
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="153726299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 04:57:37 -0700
IronPort-SDR: jEdFeq+Nz+A1BnFNs8kBxibePdRNARoOmnOK/7OerHXHniIaFxW2FIA5Z9Zyca6wt5whzQGskZ
 k2TyZJStabrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="521008499"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2020 04:57:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Oct 2020 04:57:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Oct 2020 04:57:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 13 Oct 2020 04:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBiZirMmMC7UyAUHvZ3AOWGo6UF7idGV/GoEX81QNrFhUtu2OEBij/0KrGBb2FT8SnGxtwyNT2uK4+6r+FReg5VX5GsQWLjPchbNBD+0QL6RP8s80G2nvAlqzOWB+0xqf+fv3ZxhpR4+FwktGoHbH6SAkHfhkV0NPuLiIjKaYYfDO6b4CNe2GnaNCHoBeCbFH/oxI8oQOCAHnU1Cq6I1JzssYVz/YyjKu6AuTkOJY9UJhxQuuN8hNGXbLfacFO65dZUBfC0jadZxPraAX4iK5xYLOdbl9MwLUjU77m+uBOcUIBqZ/Ik5bKgw+JGU4NIiKqQxtJT761gOg7kPh0l5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4s6mY47hg0XlzxmAxKQwjdw8jbsYGDm7FXAeuj+Qhs=;
 b=nHU2970ppFT7uEA7qnEVN2wsUI9JXphaxMGVXeqLfYgRycdtOiklVdCMHHXnTQfYAWHF/otclhFEttxGsqONUZazuB4pA0GRtu1hH7nMVi4mGWaW9+63+i1v6CF0w0QDqP4iUe1re+OcFSLh3TL5qfb4LjwCTvxWzyrnYk6Y83KGz7lCgRBNip9MmYT9+GLd0kl7UC0YQ1LBj7H4GQTl01XB5Ag5uyb/BgHlUkO+7rBn/6gWtTYUKiVnFWv/xqjf/9K8BY3N5x7NGb8Fh4yVJ6SVzsAStns7USvW3r5DdpZ305CiXyg5SCAbiUQVl4oegb7fOrRI8JEbPvk1D7Ym9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4s6mY47hg0XlzxmAxKQwjdw8jbsYGDm7FXAeuj+Qhs=;
 b=HgkzB6OcsK8ae3hVVY4H7mtnJO4PfFJ022g8bULcY7CV9If3Y1aipMxdRmrDffRcRkftPyl2OpDFZx9SO35DtxqeXQjfNESMiksN4mHfj64Wj3hSn/48CaYONMxbK6FnvzDvd6phXi6G+BcvT9C3wg5oPyTSdnqw+YoYHDsu/js=
Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB3968.namprd11.prod.outlook.com (2603:10b6:208:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 13 Oct
 2020 11:57:33 +0000
Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b%6]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 11:57:33 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
CC: "safety-architecture@lists.elisa.tech"
	<safety-architecture@lists.elisa.tech>
Subject: Re: [linux-safety] [RFC PATCH 0/2] improve bust_spinlocks dependability
Thread-Topic: [linux-safety] [RFC PATCH 0/2] improve bust_spinlocks
 dependability
Thread-Index: AQHWoUZL6VrhJo5MO0CCljPo0QSH+6mVbWrQ
Date: Tue, 13 Oct 2020 11:57:32 +0000
Message-ID: <MN2PR11MB4158ABDAC37C7A96F1392BF188040@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <163D84635034E7E1.31166@lists.elisa.tech>
In-Reply-To: <163D84635034E7E1.31166@lists.elisa.tech>
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
x-ms-office365-filtering-correlation-id: 60793144-e9f4-4a77-e62f-08d86f6f2b5d
x-ms-traffictypediagnostic: MN2PR11MB3968:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB39685DB6D0EFCB79568BEE2188040@MN2PR11MB3968.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6rFImurJ9HeDNV8i/0dy+MZz05X5iGRrsGc8oNXwy5/Z8dzBuBddP4tOhpAk0vZH02Olodt/BOge+S8HqawaIA4PdQLXrL40VzYv1h+LIHqL51NWt440j+PRMxqrRVguw1F/ZgCaHIDn8BCRmahKHNW8xHynrNXUGmOGuwIR8YyDQhvDnE4n8TQbCCUhnFQlvzjrDHHXrcIFo5EqgwgPouPUmWcs8TNYCh08ZMYcPAqsPt688ULiFmAkLom4ZHSFbxoKE3PTQ7DFNwVM1SxFKlpv/CkKSa0RKnKsasJ0fCAdFbgA1y0CaovaWDCkqza8WBd212ybkJx8qB7KD412KvHy5doGxdF8sqVhITozzHV8Oc/hGbVRhYufUb49YiqTuS/dse9HrEfokdHk0+aAoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4158.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(86362001)(966005)(8676002)(6506007)(53546011)(83380400001)(450100002)(478600001)(2906002)(33656002)(4326008)(9686003)(83080400001)(64756008)(316002)(26005)(186003)(110136005)(52536014)(66946007)(76116006)(66446008)(71200400001)(5660300002)(7696005)(55016002)(66476007)(66556008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: AyKj3v8TgH0gUyEfcc9gr0CABC0kD1x0NP4nK0PlEfhvttol+npzkFtZoDi4rxxwSOpTEx5tnRvdRfnMyc4+mZm+gtafF1mCX4hM0r8xGYf/yKLp6I73JbpEO8A4muNsfDmHnLCj4bkp3gGGlElNFvq2Ywdw2QYRaI/ACgJULIv/LLmTHwPT9MDWLSNuj3p1EkIKN2nJSovDfOAvntDLyCGBXMYQUGFpL6bRVIhv+sKdFFH/Womu7tWtpKetyWlbGi1jJIVBI304J7p9Y3urhDktLBQzIwtuQ51WyPUqwcw9+n9epXFmPsf2R9tkA3lcQ55MRhYNJPvioMGqeCSsIkeg1f5rU0oFK2R0kxyu+AMz7neENY4s9J2enAgtUTM92A9mMNQ4WwGzkP7MVCt8TKJXB6pUqqpAfYVpKXeEATljui9rAaQ4yEVti48C9onTZlHz2rR2ea9XNIwvQUnErLeQW4hfLUwh1ILWkkZS4IQ3i1QO9wNAQBL5UOyu0Se0zyEMst1WhMnntilUk5BzVJMF+aoUExmK30OAyAwef5w3iuXBgn6RUOE+GURUdi061IK/6RCcJzwjrzxp+O3lgRzrWuo9rTRZBV98js9PIfVvt0pLFwS7cUQQSH8BHnxeX0Q/PSfWnlsGiq2xvXnsrA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60793144-e9f4-4a77-e62f-08d86f6f2b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 11:57:33.0463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9mv1e38buFYh02QPs/CIZgSmYNIlgSvMBOvnYK+JsTASWVe9s8sqOBzFtgkMWVGH/JPAj/eAtE6Qzg5S9B5V9YmwXAHTn1Pub5N19qviCZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3968
Return-Path: gabriele.paoloni@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

+CC Safety Arch mailing list

> -----Original Message-----
> From: linux-safety@lists.elisa.tech <linux-safety@lists.elisa.tech> On B=
ehalf
> Of Paoloni, Gabriele
> Sent: Tuesday, October 13, 2020 11:50 AM
> To: linux-safety@lists.elisa.tech
> Cc: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> Subject: [linux-safety] [RFC PATCH 0/2] improve bust_spinlocks
> dependability
>=20
> This patchset provides a kernel-doc documentation format
> for bust_spinlocks() and fixes a weakness where the global
> variable oops_in_progress gets unconditionally decremented
>=20
> Gabriele Paoloni (2):
>   bust_spinlocks: add kernel-doc format doc
>   bust_spinlocks: do not decrement oops_in_progress unconditionally
>=20
>  lib/bust_spinlocks.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
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
