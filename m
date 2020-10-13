Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.10097.1602590292543640779
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 04:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=q8VclyEu;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: 4zLGMfNDa858c3Uzk1WyuOTTF3ZARpN2kvaMHFYG/e1jlT9JrJ02BhGChSyYoVyVc9tHulmxUX
 136aN2g8ELQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="153726343"
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="153726343"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 04:58:12 -0700
IronPort-SDR: LscWRzah06j+JFZocJnpWHMtXo9MKPF3CtGY0qr/STvWzx3BhAt7FZdhnRKNqMHv5beVpDQgLU
 2WYGiTpT2KiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="351086696"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2020 04:58:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Oct 2020 04:58:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Oct 2020 04:58:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 13 Oct 2020 04:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUulrhrfcE0oY3g+2oLjRkr/sSBMaZ8fD/u7ulgcfT0cumSxNOUIJdhR80l1y/S9FSxbm8/G07hPb0B1UmN9cAFmrY08ulrXPN/tJ1KMnVpMgEDo/G3tyLzBeNM5eB4AUFXQM3k+V803OlBQF9DAtTaMTZw8foHUS4GhsH225y13wGhrGZpParUMFH6mUtG6Rdp5aNVYAxI7P7UIO4UTKb6NKxZbRy6TiM/+KpvLfAygFiFsK47mslEFa8cVA2LLULcZhu9S54Iry75/h48H3G1WIEt2ChK10DSMdMu3ejOLje8bj9i7L+z1smuYn9JILB4E1lVETiLG+WwpkOVfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QitbMxQJV+Pke+kGfmxEsdmN7h8rRokIJ63n48XZBVs=;
 b=gcDTN6RCoNdR62MTpYLaqvEFJJ0hsqOOSOVzgf3syOUoYfBnAi2mYG0nh6kfonHdNMOeNXOwqyyhriDWCI2VBhMbst8qZH8t2mqVk9D9CaLhMddBorXP4KEju+ypcbnYUPUPDYwWADlY9KgIEP+ClScA0URQYzpeKAKqRDcKlGZzWNDbhbXc11LFZHuV3MA+aeJ4kqvr7TXZcoQyVn4vs6YX8wun/HbtUWJyB1OyTKcTkzJ9zgQwkUr/LCHWSiG1YGGtOQ4jrtWzMX4ukAD98f0fODct+tKUgFI3aKIXy0aRlkeWO9bpK8J9UawjyG/WuvGY2QqQZ+OA/CAztflEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QitbMxQJV+Pke+kGfmxEsdmN7h8rRokIJ63n48XZBVs=;
 b=q8VclyEuczgXj+geYhH8B0qZQmaVlrbmOfOiDp/eG+DCC3hvpICIUyfoWzM50i4NRsmL1Q3zS4mMcS1YYfW7+uvJI6ZKgn2OH7Q1JhXsCLzSIbh7z2fh8sEwG+Kpj8rOg9JJAcAFtsOU2pikDGPOy9fSkHZtOVXDIt7/qVRHPZU=
Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB3968.namprd11.prod.outlook.com (2603:10b6:208:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 13 Oct
 2020 11:58:06 +0000
Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b%6]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 11:58:06 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
CC: "safety-architecture@lists.elisa.tech"
	<safety-architecture@lists.elisa.tech>
Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
Thread-Topic: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement
 oops_in_progress unconditionally
Thread-Index: AQHWoUZU/WqT/Dj8t0+JYIno0AEOYKmVbZxg
Date: Tue, 13 Oct 2020 11:58:06 +0000
Message-ID: <MN2PR11MB41582F55CDBF50A053DF233788040@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <163D8465D1668B95.25724@lists.elisa.tech>
In-Reply-To: <163D8465D1668B95.25724@lists.elisa.tech>
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
x-ms-office365-filtering-correlation-id: ca7c8136-dc8b-4459-d93d-08d86f6f3f39
x-ms-traffictypediagnostic: MN2PR11MB3968:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3968BE712471AAE3E0A2BE6E88040@MN2PR11MB3968.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XfzNXGZG1x/3z015XPdfZAUkyQIa/r7Qf5FzvqeBcOQClqgEpzaKdn5f10Z3wY8HBfs0jKE9p4ouRDmIv2Noc/yuH470xofL9kixJxzBldvaYZjfdJDo7mWef1ADTf0fbuni947RaPs81ACwC8yMwDl+cuJXgT4h8NI7UBCj5ti+7jYVsJeoGykWbqi42fuCK30cRG4nqr6FLknEePMTykMDejGo54UUSp6SRbQk+XwQ42zP2ZTNHM9AJ9L77k8dHYC/s2HUUfwXXzCOCLruwWm/bgdYpD3AztLMdmKmUx5Jmmu9cCtuqYW8helZVWW9aD0U/omypFlD0pVwKRcmbye+1AyD23+6ElruoR84Rf5nTVKazjtj4WonN3x0d96aBbyXkvXsdxbQEcrcGboWSA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4158.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(86362001)(966005)(8676002)(6506007)(53546011)(83380400001)(450100002)(478600001)(2906002)(33656002)(4326008)(9686003)(83080400001)(64756008)(316002)(26005)(186003)(110136005)(52536014)(66946007)(76116006)(66446008)(71200400001)(5660300002)(7696005)(55016002)(66476007)(66556008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: rXBFqBxDzjgO70tjfyzyMzoOo6YnITCNRmyA+x/eXJF2efhh0u94yUYneKQHgK8ZPEJ2HZvaGklZZWcwjNmuD+DzYJyE2oillETERK99Di5dmk/jYAysm9YX+btvAf5j5J9m/Va6RNF7b/WTPhrn+2NIGmh4UGsQVOrxivVVgHVe5sttP0rF6iiLOWB2h8TLWo+9nFBqrIq44b0Jw5H5m4aPQJd0aT3hQHbiGMWlAj1r+xyJpx5qR4KU4sDwZfe3vI+uBR9cRuwUuZ+OrMVgQia7m0Zb+D9PR2QWenunVGQ1j+XZ4pThFoI0robpnLpxxgQmASathrzTPcxY6M07lnWSRyOXguTRuNmz4YB9PxR2SMj7oyU6IZNs8IVFneeyfNlEHYu6YY8e/JjnVEZiFEywUWyiZRia3/g0/0pAQIA57THRS4hL/oENDxdIA6eb1p/73gvX7lZpC0ybsfYZjaHOtvv94noZKTSLOdPPMLZlITHVW0PPUcIwOndGUdyUXIb6boVVOaPQBG2y+TO9DwSUoIoNJ5LJxxM8gSUwB80988fHMz2IB68UlHY+DV9myzNd6+cRA5kER8gd8tNa9iRCQEyLwivdvFm+a4W+C8CDEmF0J40mdKkoElxLuu+faml6wHp9axNhR4CvTjj4lQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7c8136-dc8b-4459-d93d-08d86f6f3f39
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 11:58:06.4604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wv2bOA6b6l6+8l7OrxIhyccClxlTyaJu97Rr7bu9jmJh3K737/Zg9XgNdyogssolh4FNjYrctivHYdZf456waNfpP7DFTzncwcU+OJ5tU64=
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
> Subject: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement
> oops_in_progress unconditionally
>=20
> In the current implementation if the input flag is 0
> oops_in_progress is unconditionally decremented, thus allowing
> to become a negative number. Since right now oops_in_progress
> is a global variable used in the kernel as a conditional flag
> to check if oops, panic(), BUG() or die() is in progress the
> current unconditional decrement may lead to unexpected behavior
> in the Kernel paths conditionally executing over this flag.
>=20
> This patch only decrement oops_in_progress if it is non zero
>=20
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> ---
>  lib/bust_spinlocks.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> index 594b270161d9..842633ac9130 100644
> --- a/lib/bust_spinlocks.c
> +++ b/lib/bust_spinlocks.c
> @@ -23,6 +23,9 @@
>   * @yes: input flag; if zero decreases oops_in_progress,
>   * otherwise increases it.
>   *
> + * Note: if oops_in_progress is already 0 it will not
> + * be decreased
> + *
>   */
>  void bust_spinlocks(int yes)
>  {
> @@ -33,7 +36,9 @@ void bust_spinlocks(int yes)
>  	=09unblank_screen();
>  #endif
>  	=09console_unblank();
> -	=09if (--oops_in_progress =3D=3D 0)
> +	=09if (oops_in_progress)
> +	=09	oops_in_progress--;
> +	=09if (!oops_in_progress)
>  	=09	wake_up_klogd();
>  	}
>  }
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
