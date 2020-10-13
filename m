Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.12091.1602596358663498952
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 06:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=g0ZkFalH;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: Zgvzs+OQ9WHRtmKT6g+a8JRJHdmcUJxH1pcxDYh0pCy1wdwMy0UgEBwPVM9iJ5xXaesNHWQAc4
 +bvqiWSMNN/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="162445803"
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="162445803"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 06:39:17 -0700
IronPort-SDR: CjARokzKgni2TxHiT0ghk8D6HXNTSZcfF4da8Bz0ImnrgbwKIHFPhmfxtxQLt5LACYI6flfRId
 qG/pB/ytchQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="463488763"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2020 06:39:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Oct 2020 06:39:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Oct 2020 06:39:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 13 Oct 2020 06:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehrJcyfue/JZXUxdVvn4Vib2JLPcw7EBWJwh7+KHNKZITYahpqDfDfmACXUTemPkmvHZrz1g8n4lrxHMkyJ/KndfHn9owrukl9HKV/qd4bQROKNDiQ1zaFgZB8Tyup83Ed/9iQf3q8zrFVG76y5emMlLVh8KzLIhgBGaYbeB/8zh8ZjCxrbPRNPFMLXEAdbV/lPprmHJvrlfTxTZmi4DAK3cXpkhfroCeNPcqBEfGV2qG3ZiaXnmV/IAb1SDJNvuYxYmmtGNjhxR4R9QS77XJvh/zAtcRtdLj8CYsCP0PpeCmrElcNj7Bo6MJVCcFvQB8Mpg53grobZ+ZqwgPhkfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hYb31ms/PY0Ss7fQbYDQEz+oB9DNb1Mr4pUM1Q2OsQ=;
 b=EVnKGx0SoVf2v0pF2JwF+r6fGT2rI0MHfZWGoZYxP/DboJPI0P2eMQdIDQMEzbL4iAruGFdumB1scTBeFwijewgk5p6BRsZEiI1nASR+ssFsBb4fdJgp+XqxJ85AfvX7Er1efmuJECniA5Q0046BrrAwPdWtatFpRdbUrw/g2g1gGpzXnHSogb9+/5BM804VXzwVpbb0RpC/O+c7y58O26TmEkX8jMemPnS4Fw+cxERpiIzgoPjVTJH0gja9aJyyxv5fhHHDkAlYkhhkwN4TBeCo5YPzRUjBsWrLBs9y0wDJKwFce1ulxMsyDVX5Tmi0b537pabdvlLiajbsFwD7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hYb31ms/PY0Ss7fQbYDQEz+oB9DNb1Mr4pUM1Q2OsQ=;
 b=g0ZkFalHMmDct5z9dlCdURU0fNeOfWTx2lNXLL0sY6ybt/sgOYnqkMv5OBIbsFjsOG5gU6OBTSKwTw+hhIlAnvtIEQwoZcbf9bDEOZo8EaQbqhb5C9ReDjP4m56h4P74LgdruoAJeAPfmpJbwom/eK6Z3PARsT0SNf2hZ2QhGms=
Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB4000.namprd11.prod.outlook.com (2603:10b6:208:13a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 13 Oct
 2020 13:39:13 +0000
Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b%6]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 13:39:13 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: "i33399_yamaguchi@aisin-aw.co.jp" <i33399_yamaguchi@aisin-aw.co.jp>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
CC: "safety-architecture@lists.elisa.tech"
	<safety-architecture@lists.elisa.tech>
Subject: Re: [ELISA Safety Architecture WG] [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
Thread-Topic: [ELISA Safety Architecture WG] [linux-safety] [RFC PATCH 2/2]
 bust_spinlocks: do not decrement oops_in_progress unconditionally
Thread-Index: AQHWoUZU/WqT/Dj8t0+JYIno0AEOYKmVbZxggAANdcCAAAv6YA==
Date: Tue, 13 Oct 2020 13:39:12 +0000
Message-ID: <MN2PR11MB41588FAE4D4D0E9C4590793F88040@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <163D8465D1668B95.25724@lists.elisa.tech>
 <MN2PR11MB41582F55CDBF50A053DF233788040@MN2PR11MB4158.namprd11.prod.outlook.com>
 <B5A52225FE7FBE4EA743EA87175029980128AA18D9@SMAIL-JP-MBX02.intra.aisin-aw.co.jp>
In-Reply-To: <B5A52225FE7FBE4EA743EA87175029980128AA18D9@SMAIL-JP-MBX02.intra.aisin-aw.co.jp>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
authentication-results: aisin-aw.co.jp; dkim=none (message not signed)
 header.d=none;aisin-aw.co.jp; dmarc=none action=none header.from=intel.com;
x-originating-ip: [93.57.250.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c2f8cbc-3d15-4526-cb53-08d86f7d5f27
x-ms-traffictypediagnostic: MN2PR11MB4000:
x-microsoft-antispam-prvs: <MN2PR11MB40004339991C9F290056015488040@MN2PR11MB4000.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:235;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Djtl8btiQnVhLwPKgwY33BTvU6f24cgEPrGh5LhFwf7MEUd18NjYAJNqSY4ne6H2h87kb54/sTeqeRFYw2R/Q0Rrv4C8eKyrCjz5MTiT7XlOGRQd/3ELLS9tu4sWOzxyZtUF0+UNbsEjN4nguMZw9Rep9sZEW4K6CtWN8UUskf2cbSfHiQwJzf9wnwAYbg07yYqnMKUNFe+gMWakqEpYGWHPnaiv+2Y9vku4l3oEZuR84kGOlVoZQxZFoc4HE5sYoR382mZhk+OEnPtwvz55qiRjea6AVZjOTtTi/cR2zvoacYUt3RsSciwXWJAHJ7RmSffw19OJhbakuxfk9Pvho+83VIKml8LQWzHUYyj/4fV/gejWaNQKuEvhXbz7BWYs+6wZo3WstWN5OOkBzWDYKg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4158.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(5660300002)(7696005)(8676002)(66946007)(66556008)(66476007)(64756008)(966005)(83380400001)(76116006)(83080400001)(8936002)(478600001)(66446008)(186003)(86362001)(52536014)(26005)(4326008)(9686003)(316002)(2906002)(6506007)(53546011)(71200400001)(33656002)(110136005)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: HLwdEBmRzbMjjts1wVXhW+TSeib3sxvDFKfJMsuVB2xJIOGikx3vwMgoDlDISl4vdoLyXdO+TQh8vIo6N4CDeTU731OYYciazas7SvxNDK1HpDrPHzbxVxZLtEL/iBw5hQav84tPQbzi3F2tBGmAS74yWQGECwDH7pgc0oMenzPNUQ+Lq+ywuQex97t0T88PVFR8uZ6kIKkfhzC9v0OWQ6mYfhrx3nGo2DLIKPV7us3e/Q8+Fa5UnNN6rF/oCKm72VutHjwxMK3jsVSLlRh/3wPN1ZwD6FlEy96JSliRT7zwzBZ2KgvEqMzHAGpjO9qNwdA92mB/bLoXpV7kHezP3j6zc49hsI+r/nji9W5zyJRtKNiSBM0m2YagnR0VtZVIusuFdn+VTGTU29OsZUmogVcyZhrtEy476Jlek7Fu1EqiH9JyqR7+sD54/YZslmRJFJ2LMzyQP4nSi/i3COB22Wy9Olr2EoFFZ/y/4ZDDAeLb03242Zx6t+wBu62MppsVR4iU6kdbCdNi55JWsA8HqWpzZ83jPFr+bnx1YgdZzT6UBFy5fYn2mByYiurP9Ix2ys72c6847JougRx0E1V0ZFpMh4E7ICMSAFGnY+yABkr/56VD/O8eSeGuMAbfI8y/8emBi1oFohZJRXIH3BFEvQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2f8cbc-3d15-4526-cb53-08d86f7d5f27
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 13:39:12.7076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rsvk5TO1tUszfOE4FfWFojYXbFADrkG71rDNzmKiPckhJbp+2zZ8cCvvtKnGTW+mezJIad12oB769inW4eB7O7y2rymqHvLPH/QjCVJBTSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4000
Return-Path: gabriele.paoloni@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: safety-architecture@lists.elisa.tech <safety-
> architecture@lists.elisa.tech> On Behalf Of i33399_yamaguchi@aisin-
> aw.co.jp
> Sent: Tuesday, October 13, 2020 3:07 PM
> To: Paoloni, Gabriele <gabriele.paoloni@intel.com>; linux-
> safety@lists.elisa.tech
> Cc: safety-architecture@lists.elisa.tech
> Subject: Re: [ELISA Safety Architecture WG] [linux-safety] [RFC PATCH 2/=
2]
> bust_spinlocks: do not decrement oops_in_progress unconditionally
>=20
> Hi Gab
>=20
> I think so, this patch is good.
> If you agree to my opinion, please more improve.
> In a very rare case, the oops_in_progress could be a negative value.  Be=
cause
> this decrement/increment is a read-modified statement.  On the other han=
d,
> shouldn't take exclusions such as spin lock with this function.
>=20
> if (!oops_in_progress)
> change to
> if (oops_in_progress <=3D 0)
>=20
> How about?

Mmmmm what you are proposing is right, I was just wondering if it is neede=
d....
Looking in the Kernel source code I am seeing that oops_in_progress is alw=
ays set to 1 or 0
except in https://elixir.bootlin.com/linux/latest/source/kernel/debug/kdb/=
kdb_io.c#L578.
Here oops_in_progress is incremented and then decremented right after...
actually I am wondering if in this file we should call bust_spinlocks() in=
stead
of directly incrementing/decremeting the variable....=20

Thanks
Gab

>=20
> Best,
> /_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
> Doctor of Informatics, Specialist
> Software Fundamental Technology Group
> Application Development Department
> Connected & Sharing Solutions Division
> AISIN AW CO.,LTD.
> YAMAGUCHI Naoto
> E-mail=1B$B!'=1B(B i33399_YAMAGUCHI@aisin-aw.co.jp
> /_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
> -----Original Message-----
> From: safety-architecture@lists.elisa.tech <safety-
> architecture@lists.elisa.tech> On Behalf Of Paoloni, Gabriele
> Sent: Tuesday, October 13, 2020 8:58 PM
> To: Paoloni, Gabriele <gabriele.paoloni@intel.com>; linux-
> safety@lists.elisa.tech
> Cc: safety-architecture@lists.elisa.tech
> Subject: Re: [ELISA Safety Architecture WG] [linux-safety] [RFC PATCH 2/=
2]
> bust_spinlocks: do not decrement oops_in_progress unconditionally
>=20
> +CC safety arch mailing list
>=20
> > -----Original Message-----
> > From: linux-safety@lists.elisa.tech <linux-safety@lists.elisa.tech> On
> > Behalf Of Paoloni, Gabriele
> > Sent: Tuesday, October 13, 2020 11:50 AM
> > To: linux-safety@lists.elisa.tech
> > Cc: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> > Subject: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not
> > decrement oops_in_progress unconditionally
> >
> > In the current implementation if the input flag is 0 oops_in_progress
> > is unconditionally decremented, thus allowing to become a negative
> > number. Since right now oops_in_progress is a global variable used in
> > the kernel as a conditional flag to check if oops, panic(), BUG() or
> > die() is in progress the current unconditional decrement may lead to
> > unexpected behavior in the Kernel paths conditionally executing over
> > this flag.
> >
> > This patch only decrement oops_in_progress if it is non zero
> >
> > Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> > ---
> >  lib/bust_spinlocks.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c index
> > 594b270161d9..842633ac9130 100644
> > --- a/lib/bust_spinlocks.c
> > +++ b/lib/bust_spinlocks.c
> > @@ -23,6 +23,9 @@
> >   * @yes: input flag; if zero decreases oops_in_progress,
> >   * otherwise increases it.
> >   *
> > + * Note: if oops_in_progress is already 0 it will not
> > + * be decreased
> > + *
> >   */
> >  void bust_spinlocks(int yes)
> >  {
> > @@ -33,7 +36,9 @@ void bust_spinlocks(int yes)
> >  	=09unblank_screen();
> >  #endif
> >  	=09console_unblank();
> > -	=09if (--oops_in_progress =3D=3D 0)
> > +	=09if (oops_in_progress)
> > +	=09	oops_in_progress--;
> > +	=09if (!oops_in_progress)
> >  	=09	wake_up_klogd();
> >  	}
> >  }
> > --
> > 2.25.1
> >
> > ---------------------------------------------------------------------
> > INTEL CORPORATION ITALIA S.p.A. con unico socio
> > Sede: Milanofiori Palazzo E 4
> > CAP 20094 Assago (MI)
> > Capitale Sociale Euro 104.000,00 interamente versato Partita I.V.A. e
> > Codice Fiscale  04236760155 Repertorio Economico Amministrativo n.
> > 997124 Registro delle Imprese di Milano nr. 183983/5281/33 Soggetta ad
> > attivita' di direzione e coordinamento di INTEL CORPORATION, USA
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
>=20
> ---------------------------------------------------------------------
> INTEL CORPORATION ITALIA S.p.A. con unico socio
> Sede: Milanofiori Palazzo E 4
> CAP 20094 Assago (MI)
> Capitale Sociale Euro 104.000,00 interamente versato Partita I.V.A. e Co=
dice
> Fiscale  04236760155 Repertorio Economico Amministrativo n. 997124 Regis=
tro
> delle Imprese di Milano nr. 183983/5281/33 Soggetta ad attivita' di dire=
zione e
> coordinamento di INTEL CORPORATION, USA
>=20
> This e-mail and any attachments may contain confidential material for th=
e
> sole use of the intended recipient(s). Any review or distribution by oth=
ers is
> strictly prohibited. If you are not the intended recipient, please conta=
ct the
> sender and delete all copies.
>=20
>=20
>=20
>=20
>=20
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
