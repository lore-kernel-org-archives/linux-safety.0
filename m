Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web12.1520.1602105570595305671
 for <linux-safety@lists.elisa.tech>;
 Wed, 07 Oct 2020 14:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kQGqN-0007Oa-7y
	for <linux-safety@lists.elisa.tech> ; Wed, 07 Oct 2020 22:19:27 +0100
To: linux-safety@lists.elisa.tech
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Subject: ci pipeline for clang-analyzer
Message-ID: <943a5d89-2862-d8d3-e25d-89f241a5c245@codethink.co.uk>
Date: Wed, 7 Oct 2020 22:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi All,

I tried to setup a pipeline for clang-analyzer so that all of us
interested can get the test result from latest linux-next. The build
with "defconfig" timedout but "tinyconfig" does work. You can see the
one from next-20201007 at [1].

Next, I will try to:
1) set up a cron job so that the pipeline starts as soon as linux-next
is published
2) set a pipeline for arm64. looks like travis supports arm64.
3) Add the report-generator to the image.
4) Check if I can push the generated report to a github page.


[1].
https://travis-ci.org/github/sudipm-mukherjee/linux-test/builds/733790131


-- 
Regards
Sudip
