Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web11.242.1600290528298104472
 for <linux-safety@lists.elisa.tech>;
 Wed, 16 Sep 2020 14:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-2-98-43-106.as13285.net ([2.98.43.106] helo=[192.168.1.13])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kIefS-0007w1-GP; Wed, 16 Sep 2020 22:08:42 +0100
Subject: Re: [linux-safety] Kernel branch link?
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mohammed Billoo <mab@mab-labs.com>, linux-safety@lists.elisa.tech
References: <CALkjhPrjj1ZZ3wbuf6fuUKTCMq1Y_hLXwhi4B_nLx_AD6Enx5Q@mail.gmail.com>
 <1634FD7281D7C1A4.20317@lists.elisa.tech>
 <7bff04a4-84b5-0737-69cf-68e72c881d02@linuxfoundation.org>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <9895f6ea-267f-80fa-11f1-571a2705d342@codethink.co.uk>
Date: Wed, 16 Sep 2020 22:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7bff04a4-84b5-0737-69cf-68e72c881d02@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Shuah,

On 15/09/2020 20:22, Shuah Khan wrote:
> On 9/15/20 9:07 AM, Shuah Khan via lists.elisa.tech wrote:
>> On 9/15/20 8:14 AM, Mohammed Billoo wrote:
>>> Shuah,
>>>

<snip>

>>
> 
> Please use the
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git
> linux-safety branch.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=linux-safety
> 
> 
> It is based on Linux 5.9-rc5 at the moment and I can keep rebasing
> it to track Linus's master.

Will it not be better to rebase on linux-next ?


-- 
Regards
Sudip
