Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web10.7409.1602144931420471016
 for <linux-safety@lists.elisa.tech>;
 Thu, 08 Oct 2020 01:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: paul.albertella@codethink.co.uk)
Received: from bigpumpkin.force9.co.uk ([212.159.102.235] helo=[192.168.1.100])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kQR5E-00013Z-6A
	for <linux-safety@lists.elisa.tech> ; Thu, 08 Oct 2020 09:15:28 +0100
Subject: Re: [linux-safety] ci pipeline for clang-analyzer
To: linux-safety@lists.elisa.tech
References: <163BD2875A09B377.24414@lists.elisa.tech>
 <059a1633-85f4-3422-64ab-0b8519a5d2cf@codethink.co.uk>
From: "Paul Albertella" <paul.albertella@codethink.co.uk>
Message-ID: <9bb53fa2-0f87-c80d-8d11-bbb4caed9400@codethink.co.uk>
Date: Thu, 8 Oct 2020 09:15:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <059a1633-85f4-3422-64ab-0b8519a5d2cf@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

This is great Sudip!

I see that Travis CI has a max duration of 120 minutes for jobs. If we 
continue tinyconfig, then I'm guessing that should be enough, but we 
will want to explore other options for when we work on more 
representative configs, which I think Elana is planning to define as 
part of the Dev Process WG's work this quarter.

Another alternative would be to use Github Actions, which doesn't seem 
to have a maximum job duration, but does limit job runtime to 2000 hours 
per month for a free account.

Looking at Github's pricing page (https://github.com/pricing), I think 
ELISA could qualify for free 'Teams' level account, which would increase 
this to 3000 hours per month. However, this is the limit for the whole 
team, not per user, so we might be better off with individual free accounts.


Paul



On 07/10/2020 23:18, Sudip Mukherjee wrote:
> 
> 
> On 07/10/2020 22:19, Sudip Mukherjee wrote:
>> Hi All,
>>
>> I tried to setup a pipeline for clang-analyzer so that all of us
>> interested can get the test result from latest linux-next. The build
>> with "defconfig" timedout but "tinyconfig" does work. You can see the
>> one from next-20201007 at [1].
>>
>> Next, I will try to:
>> 1) set up a cron job so that the pipeline starts as soon as linux-next
>> is published
>> 2) set a pipeline for arm64. looks like travis supports arm64.
>> 3) Add the report-generator to the image.
>> 4) Check if I can push the generated report to a github page.
> 
> Little bit of manual run, but the report from clang-analyzer for
> next-20201007 is now available at https://sudipm-mukherjee.github.io
> 
> 
>>
>>
>> [1].
>> https://travis-ci.org/github/sudipm-mukherjee/linux-test/builds/733790131
>>
>>
> 
