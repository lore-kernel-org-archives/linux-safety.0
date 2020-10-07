Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web11.2808.1602109134387560117
 for <linux-safety@lists.elisa.tech>;
 Wed, 07 Oct 2020 15:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kQHlr-0008Hu-VW
	for <linux-safety@lists.elisa.tech> ; Wed, 07 Oct 2020 23:18:52 +0100
Subject: Re: [linux-safety] ci pipeline for clang-analyzer
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
To: linux-safety@lists.elisa.tech
References: <163BD2875A09B377.24414@lists.elisa.tech>
Message-ID: <059a1633-85f4-3422-64ab-0b8519a5d2cf@codethink.co.uk>
Date: Wed, 7 Oct 2020 23:18:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <163BD2875A09B377.24414@lists.elisa.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/10/2020 22:19, Sudip Mukherjee wrote:
> Hi All,
> 
> I tried to setup a pipeline for clang-analyzer so that all of us
> interested can get the test result from latest linux-next. The build
> with "defconfig" timedout but "tinyconfig" does work. You can see the
> one from next-20201007 at [1].
> 
> Next, I will try to:
> 1) set up a cron job so that the pipeline starts as soon as linux-next
> is published
> 2) set a pipeline for arm64. looks like travis supports arm64.
> 3) Add the report-generator to the image.
> 4) Check if I can push the generated report to a github page.

Little bit of manual run, but the report from clang-analyzer for
next-20201007 is now available at https://sudipm-mukherjee.github.io


> 
> 
> [1].
> https://travis-ci.org/github/sudipm-mukherjee/linux-test/builds/733790131
> 
> 

-- 
Regards
Sudip
