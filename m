Return-Path: <SRS0=Jkjf=E2=lists.elisa.tech=bounce+72012+181+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0D8C56201
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:35:09 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C17082225B
	for <linux-safety@archiver.kernel.org>; Fri, 20 Nov 2020 17:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="vIzd8NyE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C17082225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+181+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id D1uTYY5279335xUqwfQSpLjK; Fri, 20 Nov 2020 09:35:08 -0800
X-Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.727.1605893707893944953
 for <linux-safety@lists.elisa.tech>;
 Fri, 20 Nov 2020 09:35:08 -0800
IronPort-SDR: Houz5A+zBT+l9rxo5FJZeCawv54FyJKgdFU8DyVsuvbbktumGUxoMuIxzZPTiSYLTeGHnCrXHs
 WTIQLJQTuGJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="171675290"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
   d="scan'208";a="171675290"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2020 09:35:06 -0800
IronPort-SDR: 4CSURNqtvZjjJYIH0nnyVB3O/KC0uJFnWquSbNIzZB1Rcd2T3U+gJDz4t+M/gf+ABjwHjQqQg+
 PyqEf6heCK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
   d="scan'208";a="533631946"
X-Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 20 Nov 2020 09:35:05 -0800
X-Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 09:35:05 -0800
X-Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 09:35:05 -0800
X-Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Nov 2020 09:35:05 -0800
X-Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 20 Nov 2020 09:35:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUnnHfDNs74CPaRZJ+wcqMZkx9czKP83FZ5AOZENbiG0j0erVU8QsY8lPC7vEMYFIhjYwFPagwijjRCBoTLp1H+gX/kNJEE7HqmgoYAr2cOo0zFVbBmkYBTEuCquvXuporsxnBj8zeSpuzure0EV9QtTcfPjJYo3CFpRfLBp9cCB+amTP7xYwBJ6oopmhS8FN2MehQkit7H39qaAApWWuHFUGJpkj/Hd9CkjqW5sMx+iH0sMQ8qsutW6xkPFi6jWl3+vM8ZCA9A5L4F1b2NSDEktDWOWH2eh/H8iicT+j79nc8g+BjBs74UMlEi6eBvauUV3rqCBdobbbJyH1kB2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qS96ac70TdSRCnwkjbJuiPGTX+vHUOGd2JTO358fWes=;
 b=TWWBB5oJQ/3iiGebEUiDgty9AxzZfCIhZv8I1sb7AE+8+ffnDm2QbvMzxdlLfsK8xGH/a0aeNui+wbC4kCnTOE0XSVDWClilCcS1xy3++RpM01sur+xaiJ8VI4xt6BXDUdg/pwBMe7nsCMQeuENz8Gn3hlNF6pcpzPKqZskd2ltwdvjNeT6Y1U9zDx+fbGeYed8cAB60xN7IVrUbHRqKlxoPt/yzbFigwChtxj30n6Wusyal8WjZHHuEVxVLQDFAluJMBncRW2+02Y0LGlB23pZtrZIgMNmlhmSB3tgroAWPiOGnc9m6mMEPnK+v3yh0B43YNBtpVkJsv/3fvESSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
X-Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB3821.namprd11.prod.outlook.com (2603:10b6:208:f7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 17:35:03 +0000
X-Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::7c1f:8c42:4ed6:240e]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::7c1f:8c42:4ed6:240e%3]) with mapi id 15.20.3589.025; Fri, 20 Nov 2020
 17:35:03 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Luck, Tony" <tony.luck@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [PATCH 1/4] x86/mce: do not overwrite no_way_out if mce_end() fails
Thread-Topic: [PATCH 1/4] x86/mce: do not overwrite no_way_out if mce_end()
 fails
Thread-Index: AQHWvb2/GqMi8MuYvESX6RxO6efbtqnRSrOAgAAAl/A=
Date: Fri, 20 Nov 2020 17:35:03 +0000
Message-ID: <MN2PR11MB4158662CEA416C6B482D77B988FF0@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-2-gabriele.paoloni@intel.com>
 <20201120173217.GE712@zn.tnic>
In-Reply-To: <20201120173217.GE712@zn.tnic>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [93.57.250.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c23c578a-ae78-4ff7-5773-08d88d7a9d21
x-ms-traffictypediagnostic: MN2PR11MB3821:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3821088261C7E7E4DC205F3988FF0@MN2PR11MB3821.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lw0Q8V9ML+GVmrbzxmNcxiRH2aDD/+3hXU4tbq7rxPVvQXNWdYOBXskmL+BsX8aBTc0rKTUqJS7vJdLKnirooQkQJsZeJ1z+VW33JbUt2LG783Yjn7RQmhD/aCysIq/f3Zj52ELNN0e6rWJ5acfy1LgrP780UuNIxiib/c8jg1emfhnghPEGnbm8caSUTEBF3TUweqa0OplJ514ROXJFN9efCe51/rmX84QawDOw/GTYmJoq+AshL01x7ByqjFb9NgG3/zjbCCLYFKzAKlYHV2p7Zq0fHsN/21PiyXf+Wqv9BuEx03uzLtwxLxFQCDE3oKPcXlPFDBDgypXoEY0oYdEl+HVPGsy+TS7oYAvAVste0GRLGpwAAHaAphMLi2AR4ui6Ikqu8T75FW1ANz0xBw==
x-ms-exchange-antispam-messagedata: /mQXikNHHINfbqB/SsLHKHBqd7WMakRzQT1aRZxbwkvpyM0EfzhWEfDtq8sPG0l7utGCQkWIAb+HRu+v7SJRJaMn6IAPYOG8bZ3RvxqRG30hIO2278EB6EhM5ksjKcTh5KpTZ3fb96EcHdwYjCVeymv+z1rbTmLVqWFs6ULuCCHMR9tMlGv6s8FBd7fiZ4mKBoJOCMV9Ixdcy22XKM7fKIY+4O16dKmxwuZQJcQ8yL59oJnxdJtYZ41w6gZSiXKKATXRpiyyCbZU0PQVFPnssN/TN1vwWLzNHmSZMWEBG021E2v7vEfyk2fPL8IjWgBmrYE7PzYilxPYM2IMpdgf6Jw7a9qvUCotscIzbzoZwLzgw53xMueMtNTFicGGUtdL3LOKGqu2rSjGqq802HGz/iu7zWWVDR3EnU5TMNyl9sDT2oyp8vAtjOl0LF2D/oCXkZIgLqeUPXIXI2yWjskHH7wMrSwAWZ/EjMUzBuUas946fkTMYVPHgmuXjo77/fUEjK9kfDXQX59o9cQEDqEA7sIajLOB9fCIa4YoCm3+JzTYV4TfaJElTZsfoX9Htze3tKNwZsBT7SrPVkgkdHzvsYkH67gBHFnORqDRzWcwkNQ7l+Ejvx8Tew4DJYZ3UadCtOihowscr/xkETiu2W9WSKbHMk11/GuLwvMJmFOA/MlViEiHR2ul+cGzR00Pcs4lv8X6pFabq815u3JDTO52O5FxFGvOUdVi+m4J6S+mnnJFOdnlPi8qFawztLeCORCBonvWvSJGSixPgz7+KpvsiKBbzIgFKrGJ7gUuukbTExlCuizj6uxnbALNF0W1RfokAjAhwtJ2H5fn1izIUw/3LxpPrH7YCKZFqWoPjEzL7pgKa7Zo7LRuG5MFDhbRAeZNEijx+0FcoZfH/J2JPEkwZQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23c578a-ae78-4ff7-5773-08d88d7a9d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 17:35:03.3520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R54GXpU6RrJBWGCVBKz5kil0FiDhxemFtuwUb8bWfGQU2PoouTKtfeeU+iEH7VTsnZ7ay+fWSfcN7cCGif9zku+sIFF6p9Z/69DuT/JT81w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3821
X-OriginatorOrg: intel.com
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: o71Qrelb1KHuJkicEICFMpHAx5278000AA=
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1605893708;
 bh=QCD5ILpkNE11fw9DGoVv0WutA9yhOtUufvWGhbYpdgw=;
 h=CC:Content-Type:Date:From:Subject:To;
 b=vIzd8NyEY4KcmclMky7sM8niK/K6Mb8o5dNgi9NR2L0lvunlwprYz7xhk0twyD3Y1Fp
 9qSIOgnTJU7qKjcvDzdONPnny+KxBAQUiASeGs2EgUM1aoRJGtBEP8nmKDRYYjwwG37AN
 elRzZ0NlMLg5D9NahOfZIkv4Ikno3ta+mgw=

Wy4uLl0NCg0KPiBBbHNvLCB0aGlzIHZlcnkgbGlrZWx5IHdhbnRzIENjOiBzdGFibGUsIEknZCBz
YXksIGNvbnNpZGVyaW5nIHRoZQ0KPiBzZXZlcml0eS4NCg0KU3VyZSwgd2lsbCBhZGQgc3RhYmxl
IGluIHYyLg0KDQpUaGFua3MNCkdhYg0KDQo+IA0KPiBUaHguDQo+IA0KPiAtLQ0KPiBSZWdhcmRz
L0dydXNzLA0KPiAgICAgQm9yaXMuDQo+IA0KPiBodHRwczovL3Blb3BsZS5rZXJuZWwub3JnL3Rn
bHgvbm90ZXMtYWJvdXQtbmV0aXF1ZXR0ZQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCklOVEVMIENPUlBPUkFUSU9O
IElUQUxJQSBTLnAuQS4gY29uIHVuaWNvIHNvY2lvClNlZGU6IE1pbGFub2Zpb3JpIFBhbGF6em8g
RSA0IApDQVAgMjAwOTQgQXNzYWdvIChNSSkKQ2FwaXRhbGUgU29jaWFsZSBFdXJvIDEwNC4wMDAs
MDAgaW50ZXJhbWVudGUgdmVyc2F0bwpQYXJ0aXRhIEkuVi5BLiBlIENvZGljZSBGaXNjYWxlICAw
NDIzNjc2MDE1NQpSZXBlcnRvcmlvIEVjb25vbWljbyBBbW1pbmlzdHJhdGl2byBuLiA5OTcxMjQg
ClJlZ2lzdHJvIGRlbGxlIEltcHJlc2UgZGkgTWlsYW5vIG5yLiAxODM5ODMvNTI4MS8zMwpTb2dn
ZXR0YSBhZCBhdHRpdml0YScgZGkgZGlyZXppb25lIGUgY29vcmRpbmFtZW50byBkaSAKSU5URUwg
Q09SUE9SQVRJT04sIFVTQQoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29u
dGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVu
dCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg0KCi09
LT0tPS09LT0tPS09LT0tPS09LT0tCkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLgpWaWV3L1JlcGx5IE9ubGluZSAoIzE4MSk6IGh0dHBzOi8vbGlzdHMu
ZWxpc2EudGVjaC9nL2xpbnV4LXNhZmV0eS9tZXNzYWdlLzE4MQpNdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMuZWxpc2EudGVjaC9tdC83ODM0MjUwMS81Mjc4MDAwCkdyb3VwIE93bmVyOiBs
aW51eC1zYWZldHkrb3duZXJAbGlzdHMuZWxpc2EudGVjaApVbnN1YnNjcmliZTogaHR0cHM6Ly9s
aXN0cy5lbGlzYS50ZWNoL2cvbGludXgtc2FmZXR5L3Vuc3ViIFtsaW51eC1zYWZldHlAYXJjaGl2
ZXIua2VybmVsLm9yZ10KLT0tPS09LT0tPS09LT0tPS09LT0tPS0KCg0K
