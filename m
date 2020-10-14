Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web11.613.1602689370135390841
 for <linux-safety@lists.elisa.tech>;
 Wed, 14 Oct 2020 08:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kSiiT-0006NK-LR; Wed, 14 Oct 2020 16:29:25 +0100
Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <20201013094938.356837-3-gabriele.paoloni@intel.com>
 <alpine.DEB.2.21.2010140748000.6186@felia>
 <MN2PR11MB4158AB45198CAE0BD2EBFA0188050@MN2PR11MB4158.namprd11.prod.outlook.com>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <0abe6838-f04b-58dc-df0c-dfb97a9272f0@codethink.co.uk>
Date: Wed, 14 Oct 2020 16:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <MN2PR11MB4158AB45198CAE0BD2EBFA0188050@MN2PR11MB4158.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Gab,

On 14/10/2020 13:05, Paoloni, Gabriele wrote:
> Hi Lukas
> 
>> -----Original Message-----
>> From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> Sent: Wednesday, October 14, 2020 7:53 AM
>> To: Paoloni, Gabriele <gabriele.paoloni@intel.com>
>> Cc: linux-safety@lists.elisa.tech
>> Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not
>> decrement oops_in_progress unconditionally
>>

<snip>

>>
>> But maybe I did even get the intent of this patch in the first place...
> 
> What I meant is the following scenario:
> Let's assume oops_in_progress = 0, then we have
> 
> func_a()
> {
> 	bust_spinlocks(0);
> }
> 
> In this case after the call, with the current implementation oops_in_progress = -1; that is not acceptable...
> 

I am not able to see how this can happen. I think all calls of
bust_spinlocks(0) is always after bust_spinlocks(1) has been done. Do
you have any particular usecase or any codepath which can make this
happen? Like, if 'x' happens then bust_spinlocks(0) will called without
a preceding call to bust_spinlocks(1)..



-- 
Regards
Sudip
