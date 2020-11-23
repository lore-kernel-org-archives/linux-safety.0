Return-Path: <SRS0=rbyR=E5=lists.elisa.tech=bounce+72012+191+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81233C63697
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 17:06:41 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0447208B8
	for <linux-safety@archiver.kernel.org>; Mon, 23 Nov 2020 17:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="Qcv45XCO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0447208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+191+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id VZkuYY5279335xTcL1F4KybS; Mon, 23 Nov 2020 09:06:39 -0800
X-Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.38057.1606151199133495083
 for <linux-safety@lists.elisa.tech>;
 Mon, 23 Nov 2020 09:06:39 -0800
IronPort-SDR: lulYzonJNrpWv0npfJktDzG/Vd5Gvw6N1PNUPon1VufiilIbGt0SKwGhWLCvZM62UKSdqtJ/+7
 xnohBUZM2/8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="256512614"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="256512614"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 09:06:37 -0800
IronPort-SDR: UsocRBy7rAEfmNFEUUjH4GgvQgtS0I920NM72QHBnZS0P3gCNhHVyiGZ54Znl4UXUOrNBuUWTi
 p/ChnW3/7s8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="342871995"
X-Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2020 09:06:36 -0800
X-Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 09:06:36 -0800
X-Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Nov 2020 09:06:36 -0800
X-Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.51) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 23 Nov 2020 09:06:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVEZ+gIKdbm1BIoWxXn4IBtLcTsaWP0mWneKs6/8HmvXcGeeXL2BNyAkTkr1NK7NsXyKghfd3dR3JwKrbzGQvBpw5ovWv3wLErLLdOkwdFfJecyAy71BOnwIcCsZrSxEphltxi2Xkr5JK4KbwQiTNvoKoTl2130EmHY4LIcbuRT6aSWpwbfwRpfOd38JLx2lk7ebgPY/ROPJpp4m01AOttfXH/5OtWRI1WTyhNyCLzxkrT9lx/1rXXdtqFcPL3gLzqd1E3iuAhS8s3wNczA6O2r0CwODtm4jKO6QI9143s4dKVT1wPSE+IUu2SbHDJFuadY2YBfYebF6W5OnxjjIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tnlJEtwJ23g7taAxRA18aetn39d1EYwwaLyBv6EFlY=;
 b=myx3+fwY+pvEui9F7MCQacSgME7wsNONfZCz0GWUyOEPVq07PKGrp/pwwDX9DpmwI8xlk3blHVU5XQYSYUrITn8oyFrqzpsRIH1SRnJRhPjFwxmVooMG+p4/qIF9byLqOeQU4AOrccyNByR7SIguseONV/vIU3MRiVvoMJ6fpehVhWwSXb0+M/jMDNYFMYOKgMz+SQjMBddsnBg4La1M+uTWdBKRHu3itwsKdYRNm6TAoFxqSje/gQFhJd6rwNER8kpo78id1RRXhxVWv/M7prnRVV/HQTePfkwS26VY9962rRSC42snKpVvh0RAaDJtoiwW1t1UTnGFo5dE9Ngo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
X-Received: from MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14)
 by MN2PR11MB3872.namprd11.prod.outlook.com (2603:10b6:208:13f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 17:06:31 +0000
X-Received: from MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::7c1f:8c42:4ed6:240e]) by MN2PR11MB4158.namprd11.prod.outlook.com
 ([fe80::7c1f:8c42:4ed6:240e%3]) with mapi id 15.20.3589.025; Mon, 23 Nov 2020
 17:06:31 +0000
From: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Luck, Tony" <tony.luck@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [PATCH 2/4] x86/mce: move the mce_panic() call and kill_it assignments at the right places
Thread-Topic: [PATCH 2/4] x86/mce: move the mce_panic() call and kill_it
 assignments at the right places
Thread-Index: AQHWvb3H/nsuzmxiaU6OIZYJNsFeCKnVziQAgAAmnPA=
Date: Mon, 23 Nov 2020 17:06:31 +0000
Message-ID: <MN2PR11MB4158162EBECE1AEA80D5EC0288FC0@MN2PR11MB4158.namprd11.prod.outlook.com>
References: <20201118151552.1412-1-gabriele.paoloni@intel.com>
 <20201118151552.1412-3-gabriele.paoloni@intel.com>
 <20201123142746.GC15044@zn.tnic>
In-Reply-To: <20201123142746.GC15044@zn.tnic>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [93.57.250.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51ff21df-d999-437f-4422-08d88fd22017
x-ms-traffictypediagnostic: MN2PR11MB3872:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3872C0E4E36DBD01D922307E88FC0@MN2PR11MB3872.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FzcD9wKWjHlnxmxto347HRk92IQqkfUg3tUVz6KzqvM1XxXWgNBXgj3yy+kN4ikbxy4l5iF1dv3ebuBoHN2D5R5A1GTQVovdc5Tt+/P83AkCOimwbUkrX6FDDJfPwxxRZtip3aSgTiPbaS9QZML7AOrmcbfQN9mMXNPDqT335LPndWzXa8qDuSz7v1/kbhE2gI9IrsgSlnBpVmui9PvJw0sDkzHn26cmd0sJUr89cHK/KRsYO3n/symD0FOf6OjhR33MkL57TNG+Qj3Vzunz947rd/sKMKIxrU8iKq5KDrsLkDjCq8psiEc9J4XFNYRq+Lmix7G66KBUonTiLb6kYfMhTc3eMhU5R1TwVx3/dzchM4/wx9VQoMmJtV2E/+5i+d3Bg3fPpJblzT/Z8DGM2A==
x-ms-exchange-antispam-messagedata: =?utf-8?B?SjVScnVSa2NFT3NNKzdUcDFiZXM1UVNpejZtazd6YWRrN3d3UHk1dnBqclBs?=
 =?utf-8?B?SDFIK2g2RXdMRUUwcGZiM3cwdDUzaFVhMDZ2VFlNQTlYc3Bzc0dpTWd4aFB5?=
 =?utf-8?B?L3lBbHlsajd0aWhTckxwOU1KazNtVHE1TTdBOTdxdk5yM3RKb3lxVFBCdCtu?=
 =?utf-8?B?Q1hYMnNHdENkcTZQVCtyUG9nQm9FQ3MyV3pVWTZBb0FiYi95VlBKRThOQktw?=
 =?utf-8?B?SEIvYm1wb2xUOWMwUXZUUmNEV2tuVnlSS0VtWUR4YUh1bG5scjZWMDN1QWdF?=
 =?utf-8?B?MEVnSlpiRFlyVnF2bEV1UlRzYlQ0ajNoSVQ2S2xmcW9wT2V0eWo3Q3B0OW9l?=
 =?utf-8?B?UXhaT0JQVnR3eVhDS2JqR3hqSjAyR0xWeXlkSTlQRVJBakVnNWNHZlZhV2VS?=
 =?utf-8?B?MzBKV3JXbGJpN3hVVUMxWTNCME1tTlE5QlZZWmJWelNyVytKeFVnKy9aN1pO?=
 =?utf-8?B?aWVEVXhYZlkxVjBqYXhrVGxPNE90YUFLSFRZT3A2MG1VVGNaYld2QXBveFYx?=
 =?utf-8?B?TExEblFlZHdxWTF3RUlvTkJCaVBNU1BoTXNhWkRmbVRDOStoK0hMRG93RlNp?=
 =?utf-8?B?T1I0MXlQSjFOTVBKeUZwNGdNQnNlMmdVaUdVeEVraVg5Ynk3ZVNORnBrU2tP?=
 =?utf-8?B?NHpRNDJFaU1VVXdpOVlvdTVjWWMvM3VJWkhyUVRpdVA4dXVZSk9lR29LaVQv?=
 =?utf-8?B?VE5ITGhYZE5mbCtKM1gzKzlyWkoxY0d4TytaSzRKblU1M2dtRldTL0NVa0JY?=
 =?utf-8?B?TmpLWlpJL1FuZ2IxU3BYdUNEYmU3dDFIM3Q4bDdoZkZ4QVdDNDlzdUxvdmZm?=
 =?utf-8?B?Q0V2ZWJySHlzQUl3Z2JibHlvcS84dkJWb1MvMEwxTDdPTnNIZnJCSGhDQjhn?=
 =?utf-8?B?c1BBTlk2dzU1eTMzVWN0M2lBM3BQM25zRFVUZWd0dUpKc3Vzcitvb2hIOUND?=
 =?utf-8?B?b0FsU05mY3d5K255UkpFQklBTjhxZ2o1RW1MSkNlWnRSaElhbEU0ZDJDUjEz?=
 =?utf-8?B?UENDcm9jZHBaeStaWDAwU0RHcWxPQktlUlhqQUk5NGtaUWhtejNpbjdBM1pj?=
 =?utf-8?B?dXBmcy8vV3N6WndRWXpUNEpzRTlpT0RzNmRJVzNnM2xkOGRqWlIrLzNKK1pQ?=
 =?utf-8?B?eGdtRURybjZsaWVCcXd2a0I3NDdUWktUc2NuUGozL29NTTFZR1h3STJVV294?=
 =?utf-8?B?NmVVN3JzUzNieGRXVWYvVldkUFRMNy9kSEpnVm8rbXNhcDRzMGZHRmgwZXlB?=
 =?utf-8?B?ckh2RVladHZkS09QVCszUTYvcW5aZnpuT0UzYnh3bFBJV3ZGQ0lXME1zV0Qw?=
 =?utf-8?Q?zpCXK9WaSLKvE=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4158.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ff21df-d999-437f-4422-08d88fd22017
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 17:06:31.6345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XIiPKrTd/EINV+mHcTgHhU//jlspyYSRtYPpG6R0R6ymcs/R1TdOaA4Ml9G2piHFHrrYXolTIYLBwAbiLc5FeW9WVghW15e1yYJZIAp9+1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3872
X-OriginatorOrg: intel.com
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: NTEq8vXovL5rK63Voz4NZznrx5278000AA=
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606151199;
 bh=Y+e0N28MO9JVxmSBzPQx6PTKK3vF1qEkwswYgyOgOvs=;
 h=CC:Content-Type:Date:From:Subject:To;
 b=Qcv45XCOnYi86BhcWwimre2hrXyMtQ0DVXTXEhQ+VMPAaivLe6VWvmP/ezPzPLpixkx
 gJb3pumDtYGjDn29OjG9j95xZckX4YmpZ/J4s5a8/hmv/0ILDwAPCI8QNoNtk1B46J4tj
 ipX7EvQw2XeuJWOPnlfz3XBrYIhBsidDgfo=

SGkgQm9yaXMNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xh
diBQZXRrb3YgPGJwQGFsaWVuOC5kZT4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyMywgMjAy
MCAzOjI4IFBNDQo+IFRvOiBQYW9sb25pLCBHYWJyaWVsZSA8Z2FicmllbGUucGFvbG9uaUBpbnRl
bC5jb20+DQo+IENjOiBMdWNrLCBUb255IDx0b255Lmx1Y2tAaW50ZWwuY29tPjsgdGdseEBsaW51
dHJvbml4LmRlOw0KPiBtaW5nb0ByZWRoYXQuY29tOyB4ODZAa2VybmVsLm9yZzsgaHBhQHp5dG9y
LmNvbTsgbGludXgtDQo+IGVkYWNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC0NCj4gc2FmZXR5QGxpc3RzLmVsaXNhLnRlY2gNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAyLzRdIHg4Ni9tY2U6IG1vdmUgdGhlIG1jZV9wYW5pYygpIGNhbGwgYW5kIGtp
bGxfaXQNCj4gYXNzaWdubWVudHMgYXQgdGhlIHJpZ2h0IHBsYWNlcw0KPiANCj4gT24gV2VkLCBO
b3YgMTgsIDIwMjAgYXQgMDM6MTU6NTBQTSArMDAwMCwgR2FicmllbGUgUGFvbG9uaSB3cm90ZToN
Cj4gPiBSaWdodCBub3cgZm9yIGxvY2FsIE1DRXMgd2UgcGFuaWMoKSxpZiBuZWVkZWQsIHJpZ2h0
IGFmdGVyIGxtY2UgaXMNCj4gPiBzZXQuIEZvciBnbG9iYWwgTUNFcyBtY2VfcmVpZ24oKSB0YWtl
cyBjYXJlIG9mIGNhbGxpbmcgbWNlX3BhbmljKCkuDQo+ID4gSGVuY2UgdGhpcyBwYXRjaDoNCj4g
PiAtIGltcHJvdmVzIHJlYWRpYmlsaXR5IGJ5IG1vdmluZyB0aGUgY29uZGl0aW9uYWwgZXZhbHVh
dGlvbiBvZg0KPiA+IHRvbGVyYW50IHVwIHRvIHdoZW4ga2lsbF9pdCBpcyBzZXQgZmlyc3QNCj4g
PiAtIG1vdmVzIHRoZSBtY2VfcGFuaWMoKSBjYWxsIHVwIGludG8gdGhlIHN0YXRlbWVudCB3aGVy
ZSBtY2VfZW5kKCkNCj4gPiBmYWlscw0KPiANCj4gUGxzIGF2b2lkIHVzaW5nICJ0aGlzIHBhdGNo
IGRvZXMgdGhpcyBhbmQgdGhhdCIgaW4gdGhlIGNvbW1pdCBtZXNzYWdlDQo+IGJ1dCBzYXkgZGly
ZWN0bHkgd2hhdCBpdCBkb2VzOg0KPiANCj4gLSBJbXByb3ZlIHJlYWRhYmlsaXR5IC4uLg0KPiAN
Cj4gLSBNb3ZlIG1jZV9wYW5pYygpLi4uDQo+IA0KPiBhbmQgc28gb24uDQoNClRoYW5rcywgSSds
bCBmaXggaXQgaW4gdjINCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYWJyaWVsZSBQYW9sb25p
IDxnYWJyaWVsZS5wYW9sb25pQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogVG9ueSBMdWNr
IDx0b255Lmx1Y2tAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL3g4Ni9rZXJuZWwvY3B1
L21jZS9jb3JlLmMgfCAyMSArKysrKysrKystLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva2VybmVsL2NwdS9tY2UvY29yZS5jDQo+IGIvYXJjaC94ODYva2VybmVsL2Nw
dS9tY2UvY29yZS5jDQo+ID4gaW5kZXggYjk5MDg5MmM2NzY2Li5lMDI1ZmYwNDQzOGYgMTAwNjQ0
DQo+ID4gLS0tIGEvYXJjaC94ODYva2VybmVsL2NwdS9tY2UvY29yZS5jDQo+ID4gKysrIGIvYXJj
aC94ODYva2VybmVsL2NwdS9tY2UvY29yZS5jDQo+ID4gQEAgLTEzNTAsOCArMTM1MCw3IEBAIG5v
aW5zdHIgdm9pZCBkb19tYWNoaW5lX2NoZWNrKHN0cnVjdCBwdF9yZWdzDQo+ICpyZWdzKQ0KPiA+
ICAJICogc2V2ZXJpdHkgaXMgTUNFX0FSX1NFVkVSSVRZIHdlIGhhdmUgb3RoZXIgb3B0aW9ucy4N
Cj4gPiAgCSAqLw0KPiA+ICAJaWYgKCEobS5tY2dzdGF0dXMgJiBNQ0dfU1RBVFVTX1JJUFYpKQ0K
PiA+IC0JCWtpbGxfaXQgPSAxOw0KPiA+IC0NCj4gPiArCQlraWxsX2l0ID0gKGNmZy0+dG9sZXJh
bnQgPT0gMykgPyAwIDogMTsNCj4gDQo+IFNvIHlvdSBqdXN0IHNldCBraWxsX2l0IHVzaW5nIGNm
Zy0+dG9sZXJhbnQuLi4NCg0KV2VsbCBJIGZpc3Qgc2VlIGlmIFJJUFYgaXMgbm90IHNldDsgdGhl
IEkgY2hlY2sgdGhlIHRvbGVyYW5jZSBsZXZlbCB0byBzZWUgaWYgd2UgbmVlZCB0bw0Ka2lsbCB0
aGUgdXNlciBzcGFjZSBhcHAuLi4gDQoNCj4gDQo+ID4gIAkvKg0KPiA+ICAJICogQ2hlY2sgaWYg
dGhpcyBNQ0UgaXMgc2lnbmFsZWQgdG8gb25seSB0aGlzIGxvZ2ljYWwgcHJvY2Vzc29yLA0KPiA+
ICAJICogb24gSW50ZWwsIFpoYW94aW4gb25seS4NCj4gPiBAQCAtMTM4NCw4ICsxMzgzLDE1IEBA
IG5vaW5zdHIgdm9pZCBkb19tYWNoaW5lX2NoZWNrKHN0cnVjdCBwdF9yZWdzDQo+ICpyZWdzKQ0K
PiA+ICAJICogV2hlbiB0aGVyZSdzIGFueSBwcm9ibGVtIHVzZSBvbmx5IGxvY2FsIG5vX3dheV9v
dXQgc3RhdGUuDQo+ID4gIAkgKi8NCj4gPiAgCWlmICghbG1jZSkgew0KPiA+IC0JCWlmIChtY2Vf
ZW5kKG9yZGVyKSA8IDApDQo+ID4gKwkJaWYgKG1jZV9lbmQob3JkZXIpIDwgMCkgew0KPiA+ICAJ
CQlub193YXlfb3V0ID0gbm9fd2F5X291dCA/IG5vX3dheV9vdXQgOiB3b3JzdCA+PQ0KPiBNQ0Vf
UEFOSUNfU0VWRVJJVFk7DQo+ID4gKwkJCS8qDQo+ID4gKwkJCSAqIG1jZV9yZWlnbigpIGhhcyBw
cm9iYWJseSBmYWlsZWQgaGVuY2UgZXZhbHVhdGUgaWYNCj4gd2UgbmVlZA0KPiA+ICsJCQkgKiB0
byBwYW5pYw0KPiA+ICsJCQkgKi8NCj4gPiArCQkJaWYgKG5vX3dheV9vdXQgJiYgbWNhX2NmZy50
b2xlcmFudCA8IDMpDQo+IA0KPiAuLi4gYnV0IGhlcmUgeW91J3JlIHRlc3RpbmcgY2ZnLT50b2xl
cmFudCBhZ2Fpbi4NCg0KWWVzIGJlY2F1c2UgdGhlIHRvbGVyYW50IGZsYWcgdGVsbHMgbWUgaWYg
SSBuZWVkIHRvIHRha2UgYWN0aW9uLi4uDQoNCj4gDQo+IHdoeSBub3QNCj4gDQo+IAkJCWlmIChu
b193YXlfb3V0ICYmIGtpbGxfaXQpDQo+IA0KPiA/DQoNCkZyb20gbXkgdW5kZXJzdGFuZGluZyBu
b193YXlfb3V0IGFuZCBraWxsX2l0IGFyZSBkaWZmZXJlbnQgaW4gcHJpbmNpcGxlczoNCm5vX3dh
eV9vdXQgaXMgdGVsbGluZyB0aGF0IGFuIGVycm9yIG9jY3VycmVkICdzb21ld2hlcmUnIGluIHNv
bWUgQ1BVIGJhbmsNCnRoYXQgcmVxdWlyZXMgdGhlIHN5c3RlbSB0byBwYW5pYyAoZS5nLiBQQ0M9
MSk7IGtpbGxfaXQgaXMgc2F5aW5nIHRoYXQgdGhlIGV4ZWN1dGlvbg0KY2Fubm90IGJlIHJlc3Rh
cnRlZCB3aGVyZSBpdCBsZWZ0IGZvciB0aGUgbG9jYWwgQ1BVIGFuZCBoZW5jZSB3ZSBuZWVkIHRv
IGZpbmQNCmFuIGFsdGVybmF0aXZlIHNvbHV0aW9uIGFzIHBhcnQgb2YgdGhlIHJlY292ZXJ5IGFj
dGlvbi4gSW4gcHJhY3RpY2UgaXQgc2VlbXMgdG8NCm1lIHRoYXQga2lsbF9pdCBpcyB1c2VkIHRv
IHJlcGxhY2Uga2lsbF9tZV9tYXliZSB3aXRoIGtpbGxfbWVfbm93IGluIGNhc2UNCnRoZSBleGNl
cHRpb24gaGFwcGVuZWQgaW4gdXNlciBtb2RlLg0KDQpTbyBJZiBJIHdoZXJlIHVzaW5nIHRoZSBz
dGF0ZW1lbnQgImlmIChub193YXlfb3V0ICYmIGtpbGxfaXQpIiBJIHdvdWxkIG1pc3MNCnRvIHBh
bmljLCBmb3IgZXhhbXBsZSwgaW4gY2FzZXMgd2hlcmUgbm9fd2F5X291dCBjYXB0dXJlZCBhIGZh
dGFsIGVycm9yDQpzb21ld2hlcmUgaW4gb3RoZXIgQ1BVcyBidXQgUklQViBpcyBzZXQgZm9yIHRo
ZSBsb2NhbCBDUFUuLi4NCg0KVGhhbmtzDQpHYWIgIA0KDQo+IA0KPiBUaHguDQo+IA0KPiAtLQ0K
PiBSZWdhcmRzL0dydXNzLA0KPiAgICAgQm9yaXMuDQo+IA0KPiBodHRwczovL3Blb3BsZS5rZXJu
ZWwub3JnL3RnbHgvbm90ZXMtYWJvdXQtbmV0aXF1ZXR0ZQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCklOVEVMIENP
UlBPUkFUSU9OIElUQUxJQSBTLnAuQS4gY29uIHVuaWNvIHNvY2lvClNlZGU6IE1pbGFub2Zpb3Jp
IFBhbGF6em8gRSA0IApDQVAgMjAwOTQgQXNzYWdvIChNSSkKQ2FwaXRhbGUgU29jaWFsZSBFdXJv
IDEwNC4wMDAsMDAgaW50ZXJhbWVudGUgdmVyc2F0bwpQYXJ0aXRhIEkuVi5BLiBlIENvZGljZSBG
aXNjYWxlICAwNDIzNjc2MDE1NQpSZXBlcnRvcmlvIEVjb25vbWljbyBBbW1pbmlzdHJhdGl2byBu
LiA5OTcxMjQgClJlZ2lzdHJvIGRlbGxlIEltcHJlc2UgZGkgTWlsYW5vIG5yLiAxODM5ODMvNTI4
MS8zMwpTb2dnZXR0YSBhZCBhdHRpdml0YScgZGkgZGlyZXppb25lIGUgY29vcmRpbmFtZW50byBk
aSAKSU5URUwgQ09SUE9SQVRJT04sIFVTQQoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50
cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBv
dGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVk
CnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3Bp
ZXMuCg0KCi09LT0tPS09LT0tPS09LT0tPS09LT0tCkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVz
c2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgpWaWV3L1JlcGx5IE9ubGluZSAoIzE5MSk6IGh0dHBz
Oi8vbGlzdHMuZWxpc2EudGVjaC9nL2xpbnV4LXNhZmV0eS9tZXNzYWdlLzE5MQpNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMuZWxpc2EudGVjaC9tdC83ODM0MjUwMi81Mjc4MDAwCkdyb3Vw
IE93bmVyOiBsaW51eC1zYWZldHkrb3duZXJAbGlzdHMuZWxpc2EudGVjaApVbnN1YnNjcmliZTog
aHR0cHM6Ly9saXN0cy5lbGlzYS50ZWNoL2cvbGludXgtc2FmZXR5L3Vuc3ViIFtsaW51eC1zYWZl
dHlAYXJjaGl2ZXIua2VybmVsLm9yZ10KLT0tPS09LT0tPS09LT0tPS09LT0tPS0KCg0K
