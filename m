Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.10447.1602677131846982198
 for <linux-safety@lists.elisa.tech>;
 Wed, 14 Oct 2020 05:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=QZdVFMPn;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: +cZo/B8FYTHNvMyMVGCVe9G5WZQrZ7H2gLY76wdwtKzzHZHyF6LIC0hH13ZvEvt0Vl5xCQqZNm
 uSwEDxcdz/eQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="165301943"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="165301943"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 05:05:31 -0700
IronPort-SDR: R8FeirgSKwnlCpdLU3D4mwja0no07zFG6jtL8kNDKD+hKM10xszwrdhtrqz9iUirkb8H8ysYmF
 7Pz2zuGh/0tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="356615436"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2020 05:05:31 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 14 Oct 2020 05:05:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 14 Oct 2020 05:05:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 14 Oct 2020 05:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ginDxgFuaBtv4ZiKL/6c/cfaGHb32z3WBjSuYSH4P7vj9G+a3MT0HFwmAP9Vrg8b2mQQNZ7+U3cUes8SzBXhgBP5AYp/zbvJBMJSHnloD+YQbQkBJr7ZPsiwni/dn55dCw+pAEZkiVHodcSck55Sl5bmFLE+ZyLNjGIz8QP/rpm34zCLf7Huf/yk7O+WR4OliTdCbfA97XIdtPVJDauNhy3Rc0cFNLLMHr6CjtuwEjHvBpCx4ex5R4lJQovy5GEFvhb2h19K1RWY0xP1JpnXoHG70iGWZ0Yw0ftUz5OKbziBaen42S1/Pr8Agq5V4+BvHZ2+r/jk+9jM4rC2d1UbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjGE78Mv8c5FinxZ7IukwmWTJMuUU180SxbA7zJgJFI=;
 b=TXrxj800Q9owF+Qk158KLaMees1Wh5MI3tPcoOAoyUchSJfaPOMqLnOTRd/YbsJ7larNKjHeAMaLa+lgffOp8uBz4Ba1zDohwXe8kDLArICCFGCtj96criDrv1aBu7WEHiTPVP0NShbiqnyjc0CLv1uZsZ6Ly5DvMqGfUL1CJk+Lm0J/tH03VayX02u5Rknu2zTrJx/RUSpJHKNgeL3eOqxWXt4J84j1udTtZ2rXC6mZYaBv0M4nGYnj2Hspq6ZjDr51hT+xLPHbZu3dlZ57lAyN5cRyaDK/BRkgSvHtZKkVp8QvoV/cuG3JCfMh5h1SVsxAvHeBazQ0AgMQyXkzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjGE78Mv8c5FinxZ7IukwmWTJMuUU180SxbA7zJgJFI=;
 b=QZdVFMPnqS2GMs0sA42fkSW0kILITI/da+3lRptG9Tsa6U8RYK8cvvZG23+NIv0mqu6LkMfg8Y4849HYHx1nmZCw8v3iLNZxHivn8emq2Kd0dZZUB+EvTBTsz3ySAcg7OJsBRC6HF1FMr+aZyDLiybv1QuABMJRXmD0VHt0R+MI=
Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB3805.namprd11.prod.outlook.com (2603:10b6:208:f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 12:05:29 +0000
Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::fccb:7677:5020:533b%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 12:05:29 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC: "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
Thread-Topic: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement
 oops_in_progress unconditionally
Thread-Index: AQHWoUZAjwK5u335P0u3ImQQU2ltkqmWmggAgABk4KA=
Date: Wed, 14 Oct 2020 12:05:28 +0000
Message-ID: <MN2PR11MB4158AB45198CAE0BD2EBFA0188050@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <20201013094938.356837-3-gabriele.paoloni@intel.com>
 <alpine.DEB.2.21.2010140748000.6186@felia>
In-Reply-To: <alpine.DEB.2.21.2010140748000.6186@felia>
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
x-ms-office365-filtering-correlation-id: 12cc6715-86d2-4af9-b7ac-08d87039715d
x-ms-traffictypediagnostic: MN2PR11MB3805:
x-microsoft-antispam-prvs: <MN2PR11MB38055DBC81F863F8669AA4F588050@MN2PR11MB3805.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zQZZWAIb8+cKqddg58vm1ihYWopNwSRGAPzxxm/ZaikOMWB61Rss8yKjsHWOI0dXbx2KOqLJ/vS+0k8aZOu6FTPf07ogAlECaoLRYG3qAX0zBi1uBuBCczAGeiKt4jmICMMuM+VIJVUjm+kM2VJvjS1Sj75QDcwdCGWjaReet8ZfQ6/qotgFzhiocmrQlJyWUh14ObbY+g5a9XZivKOLGL/vokWiA99wvzC0vA3ZC8I0zp6h/h8BvS2dV/GYHQfNldUxBpGOToO8dE2TpD7GQbsmS53nI2rBG+ApmLIwvI12A4HJYdYzC2n9pt1BxxOM3X+A7FzbK+l0xvy8jxEejQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4158.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(26005)(52536014)(186003)(6916009)(86362001)(2906002)(6506007)(53546011)(55016002)(33656002)(4326008)(9686003)(316002)(71200400001)(66476007)(8936002)(478600001)(66946007)(8676002)(7696005)(5660300002)(64756008)(66556008)(66446008)(83380400001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: v0eGvAOs+wTWfC+2RaIRvp0imwgPdeWDDFv136/B2cVIGCCLd44ax7xcoYezESYUHftoz334KC/GzXmrLP0t1LCQ8x/HfVlxe6Mg5J4POoMOEO9Ro/Qsn+Nwc7Ss4k1P6qbZfNF9EalmzD1S1Zkxpf4kUokyXz5slpNpvJ2+WtpNfY310JyHN874SCKPuBuXdUDbz7hCTdeskUmcRnp+qJVVw4immz9BcQ0D32TI6FcsI+egxtVOyV6XSEylwAAwQ7ebbDZrd+0179mMZh/QlkofXewld1suHPTjRz0wpM9RRZIa24P2OnQS2EK88YihcfzxAotPhWWncOffVCzF5pCGwYA322Dpp0F9Pbr9irW/85SQ4xheGZQNtIyfPfmG5aEGBw8LXIdOt0O0ERCbZxcqf3l425lFMdkfEA1QUOE8SonBt2ihAelqtqg2Rneidcd/1b6b15r5EsyyBmsANvpWyhJtbrBXOYTeXnWXgbTjrMaTkGmyiPgnWGm4fNm+/WK8zFMahi7nnONCwJc6nv4pxr7lqg05eIvy4JpE/0nParSqyylZcefWXcXPSnqyq80iyVcxGAWM/aKbTIElnT2CVCbTEyI/sW+nRXRrlGmKDvuHoA5HUAKS5n0Zf+1X8H+7nWBhBOxMbnzoWuLtEg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cc6715-86d2-4af9-b7ac-08d87039715d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 12:05:28.8550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKjdSttjL16t5wtoTWc15efqoYdFy0zZjdgF7lrUoqhbMdtCcRgCgkZpPQ/Xb15Uw//l73HSqFOPmI51mvQhD2Ko0H3u7/ccZ0xgUIlHLJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3805
Return-Path: gabriele.paoloni@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Lukas

> -----Original Message-----
> From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Sent: Wednesday, October 14, 2020 7:53 AM
> To: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> Cc: linux-safety@lists.elisa.tech
> Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not
> decrement oops_in_progress unconditionally
> =

> =

> =

> On Tue, 13 Oct 2020, Paoloni, Gabriele wrote:
> =

> > In the current implementation if the input flag is 0
> > oops_in_progress is unconditionally decremented, thus allowing
> > to become a negative number. Since right now oops_in_progress
> > is a global variable used in the kernel as a conditional flag
> > to check if oops, panic(), BUG() or die() is in progress the
> > current unconditional decrement may lead to unexpected behavior
> > in the Kernel paths conditionally executing over this flag.
> >
> > This patch only decrement oops_in_progress if it is non zero
> >
> > Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> > ---
> >  lib/bust_spinlocks.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> > index 594b270161d9..842633ac9130 100644
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
> >  		unblank_screen();
> >  #endif
> >  		console_unblank();
> > -		if (--oops_in_progress =3D=3D 0)
> > +		if (oops_in_progress)
> > +			oops_in_progress--;
> > +		if (!oops_in_progress)
> >  			wake_up_klogd();
> =

> I did not get the original motivation stated above.
> =

> But I believe you meant:
> =

> 'I think there is race condition here (before this patch).'
> =

> So do something in this patch: 'And now the race condition is gone?'
> =

> =

> I think:
> =

> 'The could be a race condition before, and probably the race condition is
> still there after this patch.'
> =

> But maybe I did even get the intent of this patch in the first place...

What I meant is the following scenario:
Let's assume oops_in_progress =3D 0, then we have

func_a()
{
	bust_spinlocks(0);
}

In this case after the call, with the current implementation oops_in_progre=
ss =3D -1; that is not acceptable...

Thanks
Gab =


> =

> Lukas
---------------------------------------------------------------------
INTEL CORPORATION ITALIA S.p.A. con unico socio
Sede: Milanofiori Palazzo E 4 =

CAP 20094 Assago (MI)
Capitale Sociale Euro 104.000,00 interamente versato
Partita I.V.A. e Codice Fiscale  04236760155
Repertorio Economico Amministrativo n. 997124 =

Registro delle Imprese di Milano nr. 183983/5281/33
Soggetta ad attivita' di direzione e coordinamento di =

INTEL CORPORATION, USA

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
