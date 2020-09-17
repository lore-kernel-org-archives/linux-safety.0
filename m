Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.14848.1600347571865975923
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 05:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=UnJ3prMd;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: rPQnNUyUi2ecBCV2OXNxAPxTEfzhF2mYL6aRTGeRR+Houcc2zP+Tpxla6aIcjnREdvwnwt/gXT
 Uec9vSJ8INvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="223865772"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="223865772"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 05:59:20 -0700
IronPort-SDR: EeMdeWMcsMEZPwarVOpmlVFvgN1HcWzu+m1sUlf0IvlntPDyLEyNOviFzkLWfyaNN/AQLu854W
 KuS34bw8AHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="452282119"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP; 17 Sep 2020 05:59:19 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 05:59:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Sep 2020 05:59:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 17 Sep 2020 05:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UosvJbi1tnheiadbjA3+Lj+jV736mU83eEete1QEuy5VRqTNLR2WQcPB6x1DV+wuSKqpFHpRU1eCNL+5Y7M/UuiX8muJc9T79rlEEf1WNN8GH1QVHmWOu8H1QLiyrtIROJMlVOYDBrYAzieYkIDpA96hjseB05Ghayh7b9jKia22wjdnxf292ur896EDJEt6jgLN5QzsQCQUNU3wFMhz6WASAzaH1OOha3nNULeqPdovvyzXEexiVE+QNj+uKcuaO8nzEx3hhgfTZkCqqYl30fphr7KBgsur71FamN0Of3vxNK0BFKmhqqs1y1RxwUn0zAdP66iuFrN61lFsov9TeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN06/OHyFf4eyM5GckO9AmwYTDXP9ObA+UFmYxlR52U=;
 b=gPOGrYpM7kJvi2k/h+AO1nYw4Fryr3POksgAMxTCEx52E9MqRM34DhGW6e+mNNBkFs6lSfgCCSDKpRup0L3npeFfXl/kjIfrQsACimLOCs8XZmZjBSFpU8tF2wcGN9+kMv5SOv+mUGbRECz0i8Xq7Kw+MjhceJEnLuwRXnU9XOoFooRtwx7aIPqJEcUKb+peuTIbQri8fsc5Do7CFTInpj++5Potese+3Cu+cw6ai1sI+FZzo9awb/DKZb7qPwMgyZ7ydGwQmh6l7Yatquhz1h1cdv3I7l5NU8zOEzj7LiJQLdYPMEg+m1WYO3hqTIlts1eeDU2AT9J9uBKaSlVaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN06/OHyFf4eyM5GckO9AmwYTDXP9ObA+UFmYxlR52U=;
 b=UnJ3prMdb8x2WEmqF6t1szZjz2Olqk4aMLnFT5aVb6C3RRt8NVWPmwISezkN9pBeBvCiLdHVYxICKCEbeqexfso2BdIjuq38/G25OSe6Lq5a5xFH4R8XhiaJ/+HA0nEgrNgY5AK0IVLRivd5NiJBaJWtRkLUGmRTUrwulAkE7Jw=
Received: from BY5PR11MB4195.namprd11.prod.outlook.com (2603:10b6:a03:1be::26)
 by BYAPR11MB2743.namprd11.prod.outlook.com (2603:10b6:a02:c7::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 12:59:15 +0000
Received: from BY5PR11MB4195.namprd11.prod.outlook.com
 ([fe80::b879:fdbe:e87b:6806]) by BY5PR11MB4195.namprd11.prod.outlook.com
 ([fe80::b879:fdbe:e87b:6806%7]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 12:59:14 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "linux-safety@lists.elisa.tech"
	<linux-safety@lists.elisa.tech>
CC: "development-process@lists.elisa.tech"
	<development-process@lists.elisa.tech>
Subject: Re: [ELISA Development Process WG] [PATCH] mm: vmscan: provide a change to the development-process group
Thread-Topic: [ELISA Development Process WG] [PATCH] mm: vmscan: provide a
 change to the development-process group
Thread-Index: AQHWjM7CoqVw7yoSUUGyBqwThwnJmalsxbrQ
Date: Thu, 17 Sep 2020 12:59:14 +0000
Message-ID: <BY5PR11MB419520C95C248EFDB49A3DEA883E0@BY5PR11MB4195.namprd11.prod.outlook.com>
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200917084409.26992-1-lukas.bulwahn@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [93.57.250.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a002ad43-51e4-4d54-a784-08d85b097ae1
x-ms-traffictypediagnostic: BYAPR11MB2743:
x-microsoft-antispam-prvs: <BYAPR11MB274382DD4B3F381585A216F1883E0@BYAPR11MB2743.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZLPE1nVZt2gk68lagPwMjvJTBcyyzRzxnW1+4jcUB3R54LjNoIdZdzUiJnBwBlSKLCjbzTHkgcavKl2T65tGog6RQ0X07oooZaM2QrujDoT7a18kAxCpPnxlB5esNCdhLHTYqpujzFeEEqIvcD+9NnhzDvISmYQuIGRrLHJNNZKI/w+eKxSrGFwG8XOEfIBE4Jrn3piCa+3GFk6myPETtdp3RlB0ABU2IlIZB0lAWlluubQ7WEiyq8KR0GbwB9j2iEXFm7JLGqMGgOo29upBR4UfWWPxy0WvwHTU/+cnLAAbhYd4ATJAl8seWQMmME2OLE72OnL2fZ9KOAgnJZW9ixnqtGcnYDS/4LqYTHJU+i7im5XOC217yShyXIAox7SBR4HAxUFI5lDQ+W88HFMsTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4195.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(4326008)(55016002)(110136005)(52536014)(966005)(33656002)(9686003)(2906002)(76116006)(53546011)(6506007)(7696005)(5660300002)(66446008)(66556008)(66946007)(66476007)(64756008)(8936002)(71200400001)(86362001)(26005)(316002)(186003)(83380400001)(478600001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hu87y46nLKRSCFEuV8nj63g2BChPm0Nkbcltl3yqFCqnxFPr7pSRbI1SjFvEGTjYRD7hN1uYh3geDW3IIQ1Hhqpn27zXB3EXb0Up/tRRZAOG7MDu/MIu3hAcVfnSOSThgCYguq8hby7VKdVcTeeudc+Bv1gbn8ONZrRHASSBKbnmrM33LWDs/E6hgkXTu1ZXMABt+3vILS9AlUVFp2LWb7J3c2saXy75jm7UUppeGlC1ukHvN5nJpII12ih7LrBUKoKD2GDgin04ZS5EuPFxF1gjDxiwHWIf8lY02vpVr1wf0cmUEST2ar/Kn6DC/reAgcU36sE57XIi+IJutJ02jTZTXPQ9i47QFs+5yRzZEAKVAYL3SDfDrgEePWZjUx9L7ZOTb0Io18pIvDYeyOJmYCw5TWoITxcqXPoMu6zRucDIg5bm5irVQnlt7rHwMtO0zChGFylZQZQxOdRmg36HuP5zD26+Wd5CxyeR4SmSBnI5PKtnW296QJ+J7ofyemjRkSLMWxC22DzOw7pojuMMxccQ4QNeoX8VN+M0hG5J5oiNCdD0noKHrg1cXs2D372QMdxsIRWyFbm7c38Xwjg5mcgx8cmF7PrLwvtqlp8PQ8STpq3khuN8Hp7HEGlbgTirgPNDr1X9/UDC5kVRVZ+UPQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a002ad43-51e4-4d54-a784-08d85b097ae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 12:59:14.5428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0jNTiIO8JB1sqaJQqLLssCrL0ygvhW9grM2zYu89Dpq1OarH9zykN5PJbz7pGLIROOiqTbdJaYAL9DYRxd/MkIySkHCdoG36/y5lSz+sG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2743
Return-Path: gabriele.paoloni@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: development-process@lists.elisa.tech <development-
> process@lists.elisa.tech> On Behalf Of Lukas Bulwahn
> Sent: Thursday, September 17, 2020 10:44 AM
> To: linux-safety@lists.elisa.tech
> Cc: development-process@lists.elisa.tech; Lukas Bulwahn
> <lukas.bulwahn@gmail.com>
> Subject: [ELISA Development Process WG] [PATCH] mm: vmscan: provide a
> change to the development-process group
>=20
> I think this change is needed for safety, whatever that might mean to yo=
u.
>=20
> I am unqualified to really make a change here, as I have no clue what th=
is
> code does, nor what my change does, but sure, the testing and verificati=
on
> reference process can now point out the required next steps in the
> reference process to test this code and code change.
>=20
> Good luck :)
>=20
> Not intended for distribution to the general kernel mailing lists.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> I would like to submit such a patch, what do I need to do according to
> the expected testing and verification recommendations for safety-related
> systems?

Probably the problem is not just limited to submitting patches, but I thin=
k it
is a good starting point.

>=20
> Please help me. What do I need to compile, what test do I need to run,
> which verification tool do I need to employ for this change?

Right. I have tried to reformulate the problem as "ok I am looking at or I=
 am
trying to change one or more code lines, so I would like to understand if =
such
code lines are tested today and how".
Right now if we had a s maintained structural coverage report we could tel=
l
if the impacted code lines are covered and by which tests...I could not fi=
nd it
so I guess that so far we are missing it....am I wrong?

As next step I went to look at the function wrapping the impacted code lin=
e
that in this case is kswapd. I could not find it tested in the Kunit frame=
work.

As next steps then I would run the available tests in
https://elixir.bootlin.com/linux/latest/source/tools/testing/selftests
in conjunction with GCOV trying to figure out if that line is covered alre=
ady
somehow.

There are probably smarter, better, faster ways to elaborate on this...so
here I just put down what I would do in order to figure this out...

Gab


>=20
> Or even more basic: where would I even find that information?
>=20
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 980155e257bf..aef8060efa8f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3893,7 +3893,7 @@ static int kswapd(void *p)
>  	=09	=09	highest_zoneidx);
>=20
>  	=09/* Read the new order and highest_zoneidx */
> -	=09alloc_order =3D reclaim_order =3D READ_ONCE(pgdat-
> >kswapd_order);
> +	=09alloc_order =3D READ_ONCE(pgdat->kswapd_order);
>  	=09highest_zoneidx =3D kswapd_highest_zoneidx(pgdat,
>  	=09	=09	=09	highest_zoneidx);
>  	=09WRITE_ONCE(pgdat->kswapd_order, 0);
> --
> 2.17.1
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
