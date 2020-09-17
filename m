Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web10.1357.1600355674905494153
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 08:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kIvcD-0008QF-SU; Thu, 17 Sep 2020 16:14:29 +0100
Subject: Re: [linux-safety] [PATCH] mm: vmscan: provide a change to the development-process group
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-safety@lists.elisa.tech
Cc: development-process@lists.elisa.tech
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <bca08c66-cad5-aac5-865c-f9b319142af0@codethink.co.uk>
Date: Thu, 17 Sep 2020 16:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917084409.26992-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 17/09/2020 09:44, Lukas Bulwahn wrote:
> I think this change is needed for safety, whatever that might mean to you.
> 
> I am unqualified to really make a change here, as I have no clue what this
> code does, nor what my change does, but sure, the testing and verification
> reference process can now point out the required next steps in the
> reference process to test this code and code change.
> 
> Good luck :)
> 
> Not intended for distribution to the general kernel mailing lists.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> I would like to submit such a patch, what do I need to do according to
> the expected testing and verification recommendations for safety-related
> systems?
> 
> Please help me. What do I need to compile, what test do I need to run,
> which verification tool do I need to employ for this change?

The change looks valid, 'reclaim_order' has not been used anywhere after
READ_ONCE(), and its  So, it looks like a harmless change, you will only
need a good commit message detailing why its harmless.

So, from a safety pov, is it a requirement that every submitted patch
will need to be tested based on the safety tests and all the other
defined tests?



-- 
Regards
Sudip
