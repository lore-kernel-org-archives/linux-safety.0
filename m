Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web12.12121.1597331777376979728
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 08:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=C0YZM1Nr;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=487670575=lukas.bulwahn@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1597331777; x=1628867777;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=qt4iyUMGVcUKnxNZYyBU6V8iKwDryG0oMreuD9ys3Vc=;
  b=C0YZM1NrUYngJaOIKw4pFgr7L6bDg7Gdxj6sGWe/UvNGxu1gKBVAdJzP
   1Qzet8On/Uin4PYSknHwIh9JMbPEAyD5MagHiPV1/u+wmv0y1KFtctktv
   37XOoWf81lVRkG3n2T274IRwOs0wdvNK8oetxbt/wc7XdscwRgMtdLW0x
   w=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 13 Aug 2020 17:16:14 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
 13 Aug 2020 17:16:14 +0200
Received: from smucm07m.bmwgroup.net (HELO smucm07m.europe.bmw.corp) ([160.48.96.37])
 by esabb2.muc with ESMTP/TLS; 13 Aug 2020 17:16:12 +0200
Received: from smucm07j.europe.bmw.corp (160.48.96.34) by smucm07m.europe.bmw.corp
 (160.48.96.37) with Microsoft SMTP Server (TLS;
 Thu, 13 Aug 2020 17:16:14 +0200
Received: from smucm07j.europe.bmw.corp ([160.48.96.34]) by
 smucm07j.europe.bmw.corp ([160.48.96.34]) with mapi id 15.00.1497.006; Thu,
 13 Aug 2020 17:16:14 +0200
From: "Lukas Bulwahn" <Lukas.Bulwahn@bmw.de>
To: <mab@mab-labs.com>
CC: <skhan@linuxfoundation.org>, <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
Thread-Topic: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded
 constants
Thread-Index: AdZxhDnVEZS6+pJdRv6iZ1VA1zGRhg==
Date: Thu, 13 Aug 2020 15:16:14 +0000
Message-ID: <1e3cf82b34e2413bb0b438ef1adfa04b@smucm07j.europe.bmw.corp>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VG8geW91ciBxdWVzdGlvbnMsIGhlcmUgaXMgbXkgb3Bpbmlvbi4uLg0KDQoxLiBJcyB0aGUgaGVh
ZGVyIGZvcm1hdCBpbiB0aGUgc2VtYW50aWMgcGF0Y2ggYWNjZXB0YWJsZSAoaS5lLiByZWZlcmVu
Y2luZyB0aGUgQ1dFIHRoYXQgdGhpcyBwYXJ0aWN1bGFyIHNlbWFudGljIHBhdGNoIGFpbXMgdG8g
YWRkcmVzcyk/DQoNCkFjdHVhbGx5LCBJIHRoaW5rIHdlIHNob3VsZCB0aGF0IGZvciB0aGUgZXhp
c3RpbmcgcnVsZXMgYXMgd2VsbC4NCg0KSSB3YXMgdGhpbmtpbmcgb2YgdGhlIGZvbGxvd2luZyBm
b3JtYXQ6DQoNCiMgQWRkcmVzc2VzOiBDV0UtNDE0ICgiTWlzc2luZyBMb2NrIENoZWNrIikNCg0K
b3INCg0KIyBDb250cmlidXRlcy10bzogTWlzc2luZyBMb2NrIENoZWNrIFtDV0UtNDE0XQ0KDQpJ
IHRoaW5rIGl0IGlzIGdvb2QgZGlzY3Vzc2lvbiB0byBoYXZlIHdpdGggSnVsaWEgTGF3YWxsLCBE
YW4gQ2FycGVudGVyLCBMdWMgVmFuIE9vc3RlbnJ5Y2ssIEpvZSBQZXJjaGVzLCBldGMuIHRvIHNl
ZSBob3cgdGhleSB3b3VsZCB3YW50IHRvIG1haW50YWluIHN1Y2ggaW5mb3JtYXRpb24gd2l0aGlu
IHRoZWlyIHRvb2xzLg0KDQoNCjIuIFNob3VsZCB3ZSBjcmVhdGUgYSBzZXBhcmF0ZSBkaXJlY3Rv
cnkgZm9yIEVMSVNBIHdpdGhpbiBjb2NjaW5lbGxlPw0KDQpObywgd2UgZG8gbm90IHN0cnVjdHVy
ZSBhY2NvcmRpbmcgdG8gdGhlIGNvbnRyaWJ1dG9yLCB0aGVuIHRoZSBrZXJuZWwgYXJjaGl0ZWN0
dXJlIHdvdWxkIGJlICJsaW51cyBkaXJlY3RvcnkiLCAiYW5kcmV3IGRpcmVjdG9yeSIsICJzaHVh
aCBkaXJlY3RvcnkiLCBldGMuDQoNCkkgd291bGQgc3VnZ2VzdCB0aGF0IHdlIGNvdWxkIHJvdWdo
bHkgc3RydWN0dXJlIGFjY29yZGluZyB0aGUgZXhpc3Rpbmcgc3RydWN0dXJlIGZvciBjb2NjaW5l
bGxlIGFuZCB0aGUgQ1dFIHN0cnVjdHVyZS4NCg0KDQpMdWthcw0KDQpQLlMuOiBXZSBuZWVkIHRv
IHNldCBncm91cHMuaW8gbm90IHRvIGdlbmVyYXRlIEhUTUwgZW1haWxzIG9uIHJlc3BvbnNlcyBl
dGMuIHdoZW4gd2Ugd2FudCB0byBlbmdhZ2Ugd2l0aCB0aGUga2VybmVsIGNvbW11bml0eS4gTGV0
IHVzIGNoZWNrIGlmIHdlIGdldCB0aGF0IHNldCB1cC4NCiANCg==
