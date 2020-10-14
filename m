Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.10704.1602678051926983338
 for <linux-safety@lists.elisa.tech>;
 Wed, 14 Oct 2020 05:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=issICAMX;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: LbQAEGyNTorro6oEoclsR1LvXKNGgSi/IzVQOf4jwE+k60J6DUotpBR47qWKtdILApgReMJjVQ
 TK2udQ+3O9pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="250793737"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="250793737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 05:20:50 -0700
IronPort-SDR: eaLXIfNkALpi1mQa5GQ96ZVnxOnl50VbBEnyq+qb2C79ybmSupnSrCMZ0UDTRYJpj1I57m7gzR
 dagWMQuE/QMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="356618573"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2020 05:20:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 14 Oct 2020 05:20:50 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 14 Oct 2020 05:20:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 14 Oct 2020 05:20:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 14 Oct 2020 05:20:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzS3KMyyAhrsBmAl+UUzOGglIawJS+LIwQacURJA6fUlBwc3pfptpra0bhch1oG6L7OL11o/aq9/1+tRR1AiDS7ULJNOibQ6tjxM6b7DKzbpKlen8DRKJs0AUEIEejBnEquPef3lJMLFHT/EPfeLhfrMXmCjvLdHUvQuH9kXG6Q8SI63L8WJkwDTaGN6x0ZqpqBKtDjv7yZLNfnI86QhMbiWaMhLrNx0BfYpjPM1il2MmDqehKirA38HSKup8jt3lgxZ0Ozig+1SHxlzUAwcnxWvOM4BdoSuH9nu9wSyME4ACJL2VGLlCeY3F2wvVaOt/qMolqQo4ua/cQKR33A58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJC9kxvDLNnTwiYuT4RQ2vP++sfvbp9Ht7595YT39Eg=;
 b=Rv9IRUC4BgpO63qbHsfKuqmiRC71mdtV/vw0b1rcTgQ/ITPInknYYI5aLKciTawkNEJdJUrDQ0qphsUgr50TrJ+wsiFrVODMfghNUw9JbBhhsJKSrCbsBJ9WjfbzP8rfVYRB6EAEHRcHTd8JeDjqtb3Q9dd+cmk5b5UUGZrG6LeUmdVvzPmQYKXe2AualigJCdBDt6+TR6+Kmi8U/zAtQGlLiRu/osi31imO/UNt92mzH5oYTNTlAOi1pq27yCN0vjmMNqXV6tkVFS4qQ3pmtC5Fa+9V5FWXPA+gA9Qfz2MDWMdrjsnAnmklHDHRSnfynT9mi6Pis8xDtTKUmkDlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJC9kxvDLNnTwiYuT4RQ2vP++sfvbp9Ht7595YT39Eg=;
 b=issICAMX4IPSzi16hn2RfJhDO+KsSrW/T609glHiu5jUuZcoLAzMjogQqpulw8H/0eeHX3pSmUeNRg1dG45RB9TKOK5x6HinUYP2UlMBOVAC5zwIGwkeLu81Ak1Y7mMMVshaFe4vJOL0h1nysPA4k0J1FWgHcmP10MPeoqmk8Ks=
Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 12:20:48 +0000
Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 12:20:48 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC: "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [RFC PATCH 1/2] bust_spinlocks: add kernel-doc format doc
Thread-Topic: [linux-safety] [RFC PATCH 1/2] bust_spinlocks: add kernel-doc
 format doc
Thread-Index: AQHWoUY+w7wZM3T9XkiTVKjsNRArB6mWnLwAgABl8IA=
Date: Wed, 14 Oct 2020 12:20:48 +0000
Message-ID: <MN2PR11MB41586C90E51F1FE30BB4769588050@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <20201013094938.356837-2-gabriele.paoloni@intel.com>
 <alpine.DEB.2.21.2010140753210.6186@felia>
In-Reply-To: <alpine.DEB.2.21.2010140753210.6186@felia>
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
x-ms-office365-filtering-correlation-id: 1bc93166-fe74-4df9-b676-08d8703b9545
x-ms-traffictypediagnostic: MN2PR11MB4693:
x-microsoft-antispam-prvs: <MN2PR11MB4693FFD1B075CD7A5460314488050@MN2PR11MB4693.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /G8SDevbeteEjQfuZL8Hf0Ghnl6qXdGDWS2ZvN5R5sFUDEe6PntpKwTRpqnwj80ewyB/kLHgAkVTcavIWkHBfKS2tjBTiggiCJZde3FEDync+Mz9QgeWcXRr7dm3bcylnS2FvgSm3DI4g/hPsSemW2oqZJp9ZOuFx/iSWo9x+BidMH4i8sk7gBxb525DWJaIXbhcogtrT3KCQH7ZTDgglT2c8xTqDIu1FtPXM5YmbbgqWqRTgXkAp7kUSZCRINCOZsAc3V61q1W3dgK1v/2v36MQcQGli/+CF+RhMDMAl2/8dD68wjus8bTvlr7zczzKxmdoOho29qfTratUnPrKDVRysU7SDeF24Mx4bJfftdSHOhGAxJQiZp8p4yqwoM5z6SBuUuzn4cxFdna4wlT1fQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4158.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(9686003)(66446008)(6506007)(8676002)(53546011)(186003)(64756008)(76116006)(6916009)(26005)(66476007)(66946007)(66556008)(2906002)(33656002)(8936002)(4326008)(316002)(5660300002)(83080400001)(966005)(83380400001)(52536014)(7696005)(55016002)(478600001)(86362001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ZOvPRNXtVPnmIDKiWWLQoINoV92LUzt1Dy2MnEq7EBv5f8E/DolfIf/D8DRIAPLLI4p5StKWAgmaPtdmzS3V01nfFFpk+gJpPljrFSnkKE9lXaslCY4tU/F/lJHcRkZMPLesqs2QC7LbxkGyrXOEzHmvW+9JU5ZYRdqlp8EtRPQ/it11gZiLInXI9LbOMOyVmOR1bobtaMor2HzquqKFvKvNW1bJpGcgaukIJ0Y1ZyHoCu7ND78dflL74O/DkFLePyPRHjHvmNwhgn6ESGhWVgCeMCzU5vl3AlFMl3SGOjARGR0sjWk1klDjy5+dv4WCmlqCsHuIYK2NuOpKJdxpoiKoWZcmec1sExRX9pQRCy/K0vkd66ipKkfx9GdPjwU7iwTX8glOYKqPa50d21nhEJB1vx+gzznA1AzAyLkDfI5Bg/kT+KdNRSOeLY6uLkHtn7C1CYKQT9KWRF/LU2Jteq/IFT+/fDoWzBjHJt9jVv4SxOlZbxkcXvpHiWcqJED5IvuLpzY3Uq+Ko0BJAtZwtE9EJ2Ptb3eWtDIrGQLD+a2u6NXeh4jMxqviWB0p/XJkJxz8Fb6E4P/IOLL3hCh7B/ZFUM52hW+okgaUV7b1j4UOiMQUk8wJvB5UdQnODO+wCnrZxw16YgjHS9tbAJ9G9Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc93166-fe74-4df9-b676-08d8703b9545
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 12:20:48.1611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtbvTrJXsFgqi2YWiGmfZZ6ALYC2m7W0fp9+rEkQc2LR9F73wQtDxoAzciec8Yvmgrptu4cnKYt6OpTk4FqDMacIT8sDQRZZfFn58KArFFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
Return-Path: gabriele.paoloni@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Lukas

> -----Original Message-----
> From: linux-safety@lists.elisa.tech <linux-safety@lists.elisa.tech> On B=
ehalf
> Of Lukas Bulwahn
> Sent: Wednesday, October 14, 2020 8:03 AM
> To: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> Cc: linux-safety@lists.elisa.tech
> Subject: Re: [linux-safety] [RFC PATCH 1/2] bust_spinlocks: add kernel-d=
oc
> format doc
>=20
>=20
>=20
> On Tue, 13 Oct 2020, Paoloni, Gabriele wrote:
>=20
> > In the ELISA Linux Foundation project we are trying to
> > improve the functions' documentation to make it more suitable
> > to derive functions' specs and write unit tests. This is needed
> > to make Linux more usable in functional safety systems.
>=20
> This motivation is very personal but I think it is inappropriate for a
> commit message.

You are right. I'll move this into the cover-letter

>=20
> How about:
>=20
> Explain the special purpose of bust_spinlocks().

Maybe I will just say: 'bust_spinlocks() is missing a kernel-doc=20
format and is used quite extensively in the fault handling paths
of different HW architectures; hence this patch tries to provide
a more suitable kernel-doc specification for this function '=20

>=20
>=20
> > So I am adding a proper kernel-doc format for bust_spinlocks.
> >
> > Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> > ---
> > With respect to this patch I have a question on how to set
> > the function context; i.e. I don't know if it can be executed
> > in any context or if it has limitations.
> > ---
> >  lib/bust_spinlocks.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> > index 8be59f84eaea..594b270161d9 100644
> > --- a/lib/bust_spinlocks.c
> > +++ b/lib/bust_spinlocks.c
> > @@ -5,8 +5,6 @@
> >   * Provides a minimal bust_spinlocks for architectures which don't
> >   * have one of their own.
> >   *
> > - * bust_spinlocks() clears any spinlocks which would prevent oops, di=
e(),
> BUG()
> > - * and panic() information from reaching the user.
>=20
> This description reads slightly nicer than the new one below.

Right but this is the effect of oops_in_progress being =3D 1

>=20
> >   */
> >
> >  #include <linux/kernel.h>
> > @@ -17,6 +15,15 @@
> >  #include <linux/vt_kern.h>
> >  #include <linux/console.h>
> >
> > +/**
> > + * bust_spinlocks - increases or decreases oops_in_progress.
> > + * if oops_in_progress !=3D 0 spinlocks which would prevent
>=20
> Do not explain the implementation, explain the intent.

If I had to derive unit tests from this doc I think I need to explain
the main goal of this function (i.e. increasing/decreasing bust_spinlocks)=
...?

>=20
> > + * oops, die(), BUG() and panic() information from reaching
> > + * the user are busted.
> > + * @yes: input flag; if zero decreases oops_in_progress,
> > + * otherwise increases it.
>=20
> I think the argument name 'yes' is terrible, and the documentation adds
> nothing to resolve the existing terror.

Yes it is ugly but I wanted to avoid too many cosmetics....

>=20
> What is the semantics of this argument?
>=20
> In which cases should I pass 0 as argument and which cases not?

Looking at the code you should pass 1 if you are in the middle
of oops(), die(), bug() and you want to make sure your debug messages
to be printed, you pass 0 once you have finished printing your msgs.

Thanks
Gab

>=20
> If it is not possible to explain that here, let us not do it and then
> document other functions instead.
>=20
> > + *
> > + */
> >  void bust_spinlocks(int yes)
> >  {
> >  	if (yes) {
> > --
> > 2.25.1
> >
> > ---------------------------------------------------------------------
> > INTEL CORPORATION ITALIA S.p.A. con unico socio
> > Sede: Milanofiori Palazzo E 4
> > CAP 20094 Assago (MI)
> > Capitale Sociale Euro 104.000,00 interamente versato
> > Partita I.V.A. e Codice Fiscale  04236760155
> > Repertorio Economico Amministrativo n. 997124
> > Registro delle Imprese di Milano nr. 183983/5281/33
> > Soggetta ad attivita' di direzione e coordinamento di
> > INTEL CORPORATION, USA
> >
> > This e-mail and any attachments may contain confidential material for
> > the sole use of the intended recipient(s). Any review or distribution
> > by others is strictly prohibited. If you are not the intended
> > recipient, please contact the sender and delete all copies.
> >
> >
> >
> >
> >
> >
> >
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
