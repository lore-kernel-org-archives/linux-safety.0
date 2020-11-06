Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web12.10538.1604664297835487667
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 04:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kb0U9-0000Ln-TC; Fri, 06 Nov 2020 12:04:53 +0000
Subject: Re: [linux-safety] [PATCH] taskstats: remove unneeded dead assignment
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, Tom Rix <trix@redhat.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
 linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
References: <20201106062210.27920-1-lukas.bulwahn@gmail.com>
 <6ab2415b-0642-16ee-4be0-c909e07e7565@codethink.co.uk>
 <alpine.DEB.2.21.2011061126130.20338@felia>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <aea9d12d-88ee-f262-4328-03993521668f@codethink.co.uk>
Date: Fri, 6 Nov 2020 12:04:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011061126130.20338@felia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Lukas,

On 06/11/2020 10:31, Lukas Bulwahn wrote:
> 
> 
> On Fri, 6 Nov 2020, Sudip Mukherjee wrote:
> 
>> Hi Lukas,
>>

<snip>

> 
> I did not try but I bet (a beverage of your choice) that the object code
> remains the same also for your suggested patch. Try to disprove my claim 
> and possibly earn yourself a beverage when we meet...

Lets decide which beverage.. ;-)

Using gcc-7.2.0 for MIPS:

original:- ab81d3305d578c2568fbc73aad2f9e61  kernel/taskstats.o
After your change:- ab81d3305d578c2568fbc73aad2f9e61  kernel/taskstats.o
After my change:- 0acae2c8d72abd3e15bf805fccdca711  kernel/taskstats.o



-- 
Regards
Sudip
