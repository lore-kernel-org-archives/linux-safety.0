Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web12.7639.1602146696712933143
 for <linux-safety@lists.elisa.tech>;
 Thu, 08 Oct 2020 01:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kQRXh-0001gI-Px; Thu, 08 Oct 2020 09:44:53 +0100
Subject: Re: [linux-safety] ci pipeline for clang-analyzer
To: Paul Albertella <paul.albertella@codethink.co.uk>,
 linux-safety@lists.elisa.tech
References: <163BD2875A09B377.24414@lists.elisa.tech>
 <059a1633-85f4-3422-64ab-0b8519a5d2cf@codethink.co.uk>
 <9bb53fa2-0f87-c80d-8d11-bbb4caed9400@codethink.co.uk>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <295e221e-215e-6237-3887-238deb63f419@codethink.co.uk>
Date: Thu, 8 Oct 2020 09:44:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9bb53fa2-0f87-c80d-8d11-bbb4caed9400@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Paul,

On 08/10/2020 09:15, Paul Albertella wrote:
> This is great Sudip!
> 
> I see that Travis CI has a max duration of 120 minutes for jobs. If we
> continue tinyconfig, then I'm guessing that should be enough, but we
> will want to explore other options for when we work on more
> representative configs, which I think Elana is planning to define as
> part of the Dev Process WG's work this quarter.
Travis actually has 50 minutes timeout. I have an extended 120 minutes
because of something else I used to do earlier. Actually, going through
my old mails I can see that I should have 180 minutes. Need to check
with them today.
I have also tried with gitlab shared runners which had a 180 minutes
timeout but that has also failed.
https://gitlab.com/sudipm/linux-next/-/jobs/777289423

> 
> Another alternative would be to use Github Actions, which doesn't seem
> to have a maximum job duration, but does limit job runtime to 2000 hours
> per month for a free account.

I will have a look at it today after adding the report generator to my
scripts. If it is 2000 hours per month then we get around 100 hours per
day, which should be more than enough.


-- 
Regards
Sudip
