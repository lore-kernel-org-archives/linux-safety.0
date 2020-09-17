Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.3087.1600359849583060835
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 09:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=qgyz1LUg;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: gabriele.paoloni@intel.com)
IronPort-SDR: 9xKCJdr9iusLIZ4wrF3jvPQLCAYdZPgY5FfylE7ie4EV1cnPxHBSyUK6PKPgs6inFqM2oNUHk7
 O4pWcqmWYvfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="244570739"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; 
   d="scan'208";a="244570739"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 09:23:42 -0700
IronPort-SDR: BD6impr6eNXPhIFsYctNScBIdMbmoKN3hZo8Fdk7fHVcgDrmjE9LGW6oOl7LpoV3X9WK7Fhcf2
 zjm0I5zX16Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; 
   d="scan'208";a="346680626"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga007.jf.intel.com with ESMTP; 17 Sep 2020 09:23:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 09:23:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Sep 2020 09:23:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 17 Sep 2020 09:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrSwXkGgzt6/Ny629ExjWo9PrB5yeRkd9NN+M9pFpnkeoQaNO8NSgMjKBMgIgXSJydXC/tXSuqas2gi/qw9EgHH1d2LjxHYJ8WzarmPm/3RcgnPl2gVLPkuxT8uOzN3kUZcv19jlw8BG7z4RbEuyipMuzpCw0XoDVqeVqOzhqbFLCBnwJSdjai5Ua4UNn6zRme1jBDH6lXPNRaWdJEB41hLaQQBU7p7viHxQfci9RQBrCLw19vrg2bEZfsMPDjyYz6wIsN+3XdcnCNthzOVajxjPtLA2ZT5EN/t/C6aNn6IkUNETIByQ/h5O8bnnrB7zfCo2XH0Us6aD9r3dS42Gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgiK14QH223exdXx6fJxsU89ffVw0FOKA33+gZwvekU=;
 b=PekuMDePs/q62PtDsLJC/MMwLr90VbVHfG/W6xwXzS/KsdtevQtzQBMjnqEdFgwqcbrYiju84P+HqRjywhVWs0vwj71xpiA2GcuDj8O9E3fT0yQ15hiTyx00ZMBshDqie08bY+jqhauABBWum74f2Rtwy3LFfZdOmwulJh2b2MgvrOETyCRSxW/JJM68ZRypSq34h5t47xFhUQpsO/np1c/hCMpBJf1mHr4gzU2Z8G9vfsNhm5bT9Ef3B75wYKfwr+8cEclh+iUi+GTvIvthJd94GbWAK62VEbd7BpoNBKnPSXGmo/jrXX8vI5oCTP2lPoCJ1OjajG7J8KsO/wYymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgiK14QH223exdXx6fJxsU89ffVw0FOKA33+gZwvekU=;
 b=qgyz1LUg/bZ8HWCXiywvs3d8kWq8fiQloupbz2Mg7XarQnV5I6Nvu8eWTQ+PAtddezEB5EizeR7pf40W/WmQYUA9dKZ3EC7Soq4d+iqSOeZ2bvvs2ApFJP/KnWyvvYPpnIulsyW3lWCXz0fsByNz8VkJ8OS/qtNPHxgqcRozz5E=
Received: from BY5PR11MB4195.namprd11.prod.outlook.com (2603:10b6:a03:1be::26)
 by BY5PR11MB4054.namprd11.prod.outlook.com (2603:10b6:a03:189::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 16:23:35 +0000
Received: from BY5PR11MB4195.namprd11.prod.outlook.com
 ([fe80::b879:fdbe:e87b:6806]) by BY5PR11MB4195.namprd11.prod.outlook.com
 ([fe80::b879:fdbe:e87b:6806%7]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 16:23:35 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC: "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>,
	"development-process@lists.elisa.tech" <development-process@lists.elisa.tech>
Subject: Re: [linux-safety] [ELISA Development Process WG] [PATCH] mm: vmscan: provide a change to the development-process group
Thread-Topic: [linux-safety] [ELISA Development Process WG] [PATCH] mm:
 vmscan: provide a change to the development-process group
Thread-Index: AQHWjM7CoqVw7yoSUUGyBqwThwnJmalsxbrQgAAzZ4CAAAnWEA==
Date: Thu, 17 Sep 2020 16:23:35 +0000
Message-ID: <BY5PR11MB41954AB0A7968933F7DA6314883E0@BY5PR11MB4195.namprd11.prod.outlook.com>
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com>
 <BY5PR11MB419520C95C248EFDB49A3DEA883E0@BY5PR11MB4195.namprd11.prod.outlook.com>
 <alpine.DEB.2.21.2009171729190.9985@felia>
In-Reply-To: <alpine.DEB.2.21.2009171729190.9985@felia>
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
x-ms-office365-filtering-correlation-id: 265bd28c-d6e8-4f5b-444a-08d85b2606e4
x-ms-traffictypediagnostic: BY5PR11MB4054:
x-microsoft-antispam-prvs: <BY5PR11MB4054F250CCA4944E1E98C211883E0@BY5PR11MB4054.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LkwJ9u7EH60BzGSeq1e2EyMoNaFUPjTfQvs7N+YnAZtv73BCsF6FMq/7/oh9Ut5f9XoDGd+gt9Fc+aMCTIA5pJKYEhNa6SypsNCrg3AWR8dAwAiaCr2A511gz8sF0Sx4Ht2G9sVqLMraVE9IbMB4tkORcpQOqa9czYPg66yV7h7RX9rXG8xjMuNCKztJVll+Zx/LozTCd1scHxenM19LZXkViaEZLXAK6uo4xn5GRzuzSdbOghI74/1+M7rjRqDYpTyp9+WCvzRt3jOfhB1/EyQ0qngghos9U7EDf9I34e7X9rIpzyfW+QVufgCLHC+sgUO5YV1T0OVy/wUmxjryp24Xd57Xqm1/JeAnVtdZMS1bp2KqgB/fiJP3xi/yxDCTHTfVdybDatI9a87p/WeBNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4195.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(8676002)(83380400001)(6506007)(5660300002)(52536014)(26005)(53546011)(2906002)(7696005)(86362001)(54906003)(55016002)(9686003)(64756008)(6916009)(478600001)(76116006)(33656002)(966005)(66476007)(316002)(8936002)(186003)(4326008)(66946007)(66446008)(66556008)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: m2vTMBOx1GEU2EVCrkpUZU/gQPtZkw6jsJ6XwF3osu7XK2l/VR2OPZYpiAD+h348lqYIBCcb3eOXAvO5GamlSgNGiHZpWfKuj43r1lrXOyzT1G+8qOYO9UbBGEEEY1TaUV3NTRUWaGbYg1cTLPTeqd5XRovc7mFg3iiTvHwKha9szRyrzyUhL6LRFvuYB0GOxHwqElmv/fla1TSJQQcXnlm//G4zr5VzmG2PM8M7T2wISN0QMCn3iuCDlRI1w468WfILxzQ9muZ8x3aFvrwUJwjyuJUg4/yVMTEqyr/dq6IV5rifEPKtF3RKdo23t0L4p8yTok1mtq6esqguaetLCwQxcQ/tsfumzWfc8GAICzRwy1IwZvKHWYoOWufN507N/cxuFx9GS4MA1QoJGooSxoRU3ZXp7CUDjxJOR0tx75W7dCJtAztfJj/6FFAM9Q+y/+kLGsiawvuCAN/iSVMElVHbMVpcKrHWL4tJ+H3FFkdWil4SXB6WMoa8BdEQdrykSj0QrFagvUe/jeNdP4bZXuy9eEsfspR/fsooNIP9EsdrmoztZGfUKNuGCDZShv+kSCofaV5qz6UL2uzdafnu7QOBeizLsIV0pbEMusJzWBYdLBMmJMMzC02B5D5VumTGVPB+NUq4EvI46PTHIwZRhg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265bd28c-d6e8-4f5b-444a-08d85b2606e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 16:23:35.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L819LUBgVb8s/3tmNoVroncmVVIKjkIeEyFQ6z5Wov7/65zgm70GG/Gq6H3+ZkgjVsJtr2zkdQCeT2QjrtATTUvfyBoSAY/X35pkMLDyihY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4054
Return-Path: gabriele.paoloni@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: development-process@lists.elisa.tech <development-
> process@lists.elisa.tech> On Behalf Of Lukas Bulwahn
> Sent: Thursday, September 17, 2020 5:44 PM
> To: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>; linux-
> safety@lists.elisa.tech; development-process@lists.elisa.tech
> Subject: Re: [linux-safety] [ELISA Development Process WG] [PATCH] mm:
> vmscan: provide a change to the development-process group
>=20
>=20
>=20
> On Thu, 17 Sep 2020, Paoloni, Gabriele wrote:
>=20
> > > -----Original Message-----
> > > From: development-process@lists.elisa.tech <development-
> > > process@lists.elisa.tech> On Behalf Of Lukas Bulwahn
> > > Sent: Thursday, September 17, 2020 10:44 AM
> > > To: linux-safety@lists.elisa.tech
> > > Cc: development-process@lists.elisa.tech; Lukas Bulwahn
> > > <lukas.bulwahn@gmail.com>
> > > Subject: [ELISA Development Process WG] [PATCH] mm: vmscan: provide
> a
> > > change to the development-process group
> > >
> > > I think this change is needed for safety, whatever that might mean t=
o
> you.
> > >
> > > I am unqualified to really make a change here, as I have no clue wha=
t this
> > > code does, nor what my change does, but sure, the testing and
> verification
> > > reference process can now point out the required next steps in the
> > > reference process to test this code and code change.
> > >
> > > Good luck :)
> > >
> > > Not intended for distribution to the general kernel mailing lists.
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > ---
> > > I would like to submit such a patch, what do I need to do according =
to
> > > the expected testing and verification recommendations for safety-
> related
> > > systems?
> >
> > Probably the problem is not just limited to submitting patches, but I =
think it
> > is a good starting point.
> >
> > >
> > > Please help me. What do I need to compile, what test do I need to ru=
n,
> > > which verification tool do I need to employ for this change?
> >
> > Right. I have tried to reformulate the problem as "ok I am looking at =
or I am
> > trying to change one or more code lines, so I would like to understand=
 if
> such
> > code lines are tested today and how".
> > Right now if we had a s maintained structural coverage report we could=
 tell
> > if the impacted code lines are covered and by which tests...I could no=
t find
> it
> > so I guess that so far we are missing it....am I wrong?
> >
> > As next step I went to look at the function wrapping the impacted code=
 line
> > that in this case is kswapd. I could not find it tested in the Kunit f=
ramework.
> >
> > As next steps then I would run the available tests in
> > https://elixir.bootlin.com/linux/latest/source/tools/testing/selftests
> > in conjunction with GCOV trying to figure out if that line is covered =
already
> > somehow.
> >
> > There are probably smarter, better, faster ways to elaborate on this..=
.so
> > here I just put down what I would do in order to figure this out...
> >
>=20
> Gab, these are GREAT ideas and approaches. So, do we intend to provide
> methods, tools and documentation to really do these things you suggest?
>=20
> That makes the intensions more tangible to me; if we try to find out
> how we and anyone else can get that information in some 'easy' way.
>=20
> You can imagine that for a single-line change, you are suggesting probab=
ly
> quite some few days of work of investigation to get this information,
> right?

Unless together with the test frameworks in Linux we start maintaining a
corresponding structural coverage report that would instantly map the
affected code lines against the corresponding test.

Then reading the corresponding test we can figure out if the tests are sti=
ll
valid (i.e. - black box - have I changed any behavior with my patch compar=
ed
to the expected result of the tests? or - white box - am I able to reach m=
y
new change using the current test suites?)

My feeling is that we just need to get started putting together a more
structured test framework and report and them the problem as presented
by this patch would be very straightforward

Thanks
Gab

>=20
>=20
> Lukas
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
