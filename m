Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web08.11650.1603793295247596108
 for <linux-safety@lists.elisa.tech>;
 Tue, 27 Oct 2020 03:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kXLtk-0002x9-Lx; Tue, 27 Oct 2020 10:08:12 +0000
Subject: Re: [linux-safety] [PATCH] misc: hisi_hikey_usb: use PTR_ERR_OR_ZERO
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech
References: <20201026180026.3350-1-sudipm.mukherjee@gmail.com>
 <alpine.DEB.2.21.2010270625520.7937@felia>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <7796cec8-e9e5-6c9b-176e-f2c30a845f0b@codethink.co.uk>
Date: Tue, 27 Oct 2020 10:08:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010270625520.7937@felia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Lukas,

On 27/10/2020 05:36, Lukas Bulwahn wrote:
> 
> 
> On Mon, 26 Oct 2020, Sudip Mukherjee wrote:
> 
>> Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
>> we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
>> doing 'return 0'.
>>
>> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>> ---

<snip>

> 
> I think in the very long-term future, it would be nice if we can somehow 
> link a finding from a specific tool (with some kind of URI) in the commit 
> message or so.

I was thinking something almost similar, and was wondering if I can add
the tool name with some tags and then it will be possible to generate
some stats later about which tool fixed more things. I will send out a
mail later today to lkml proposing that we use such a tag.

I think adding URI is not possible until we have a persistent link to
these reports. The report that I generate can only have last 4 days
report, so the URI will not be valid after 4th day.



-- 
Regards
Sudip
