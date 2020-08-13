Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web12.12836.1597333541913598688
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 08:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=DDmU+K1S;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=487670575=lukas.bulwahn@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1597333542; x=1628869542;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=DlpT8yojfccSsyxVFlSstw4eaxtTQgAHZ8o39amBzCo=;
  b=DDmU+K1S0cPhfQV6JkkN1RaNAPxFKJwNIaPqF2gKjtZVcSLQu+v5Rm5j
   Hb3i6wdTOEQI853blaHIe0dVSHPC5A55XNzbaNgLowe4TE0ZYvIebW1WW
   ha+9VaRxGAZQcScXiPAek1sFhXc8NNkBvLXau2HapVpWej/hrYGYq+gfy
   w=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 13 Aug 2020 17:45:39 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
 13 Aug 2020 17:45:39 +0200
Received: from smucm07m.bmwgroup.net (HELO smucm07m.europe.bmw.corp) ([160.48.96.37])
 by esabb2.muc with ESMTP/TLS; 13 Aug 2020 17:45:39 +0200
Received: from smucm07j.europe.bmw.corp (160.48.96.34) by smucm07m.europe.bmw.corp
 (160.48.96.37) with Microsoft SMTP Server (TLS;
 Thu, 13 Aug 2020 17:45:39 +0200
Received: from smucm07j.europe.bmw.corp ([160.48.96.34]) by
 smucm07j.europe.bmw.corp ([160.48.96.34]) with mapi id 15.00.1497.006; Thu,
 13 Aug 2020 17:45:39 +0200
From: "Lukas Bulwahn" <Lukas.Bulwahn@bmw.de>
To: <sudip.mukherjee@codethink.co.uk>, <mab@mab-labs.com>
CC: <skhan@linuxfoundation.org>, <linux-safety@lists.elisa.tech>
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
Thread-Topic: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded
 constants
Thread-Index: AdZxiMnKv4Z+i7bzQmqDgMESHp0FyA==
Date: Thu, 13 Aug 2020 15:45:39 +0000
Message-ID: <eccbf850cc5549bb89102aaa1a5e6a24@smucm07j.europe.bmw.corp>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBpbWhvLCBtaXNjIGlzIG9rIGZvciB0aGlzIG9uZSwgYnV0IHdoZW4geW91IGFjdHVhbGx5IG1h
a2UgYSBjb2NjaSBzY3JpcHQgZm9yDQo+IENXRS00MTQgKCJNaXNzaW5nIExvY2sgQ2hlY2siKSwg
dGhhdCBzaG91bGQgYmUgZ29pbmcgdG8NCj4gc2NyaXB0cy9jb2NjaW5lbGxlL2xvY2tzLw0KPiAN
Cg0KQWdyZWUuIExvY2tpbmcgY2hlY2tzIGdvIHRvIGxvY2tzLg0KDQpUaGUgZXhhbXBsZSBvZiBD
V0UtNDE0IHdhcyBqdXN0IHRvIHNob3cgYSBzdWl0YWJsZSBmb3JtYXQgZm9yIGFkZGluZyB0aGUg
Q1dFIG1hcHBpbmcgaW50byB0aGUgdG9vbHMvcnVsZXMgYXMgY29tbWVudHMgYW5kIG1haW50YWlu
IHRoZSBtYXBwaW5nIHRoZXJlLg0KDQoNCkx1a2FzDQo=
