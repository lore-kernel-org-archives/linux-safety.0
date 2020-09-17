Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web10.2181.1600357626604452126
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 08:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kIw7h-0000bM-Vr; Thu, 17 Sep 2020 16:47:02 +0100
Subject: Re: [ELISA Development Process WG] [linux-safety] [PATCH] mm: vmscan: provide a change to the development-process group
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech, development-process@lists.elisa.tech
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com>
 <bca08c66-cad5-aac5-865c-f9b319142af0@codethink.co.uk>
 <alpine.DEB.2.21.2009171718090.9985@felia>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <37746704-f127-1f4c-4856-9f510826bb92@codethink.co.uk>
Date: Thu, 17 Sep 2020 16:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009171718090.9985@felia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 17/09/2020 16:29, Lukas Bulwahn wrote:
> 
> 
> On Thu, 17 Sep 2020, Sudip Mukherjee wrote:
> 
>>
>>
>> On 17/09/2020 09:44, Lukas Bulwahn wrote:
>>> I think this change is needed for safety, whatever that might mean to you.
>>>
>>> I am unqualified to really make a change here, as I have no clue what this
>>> code does, nor what my change does, but sure, the testing and verification
>>> reference process can now point out the required next steps in the
>>> reference process to test this code and code change.
>>>
>>> Good luck :)
>>>
>>> Not intended for distribution to the general kernel mailing lists.
>>>
>>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>> ---
>>> I would like to submit such a patch, what do I need to do according to
>>> the expected testing and verification recommendations for safety-related
>>> systems?
>>>
>>> Please help me. What do I need to compile, what test do I need to run,
>>> which verification tool do I need to employ for this change?
>>
>> The change looks valid, 'reclaim_order' has not been used anywhere after
>> READ_ONCE(), and its  So, it looks like a harmless change, you will only
>> need a good commit message detailing why its harmless.
>>
> 
> Thanks, Sudip. Yes, I also conclude it is harmless but I really cannot say 
> as I did not even compile it :) and I guess you did not either :)
> 
> I would actually want to argue that I compiled it for all available (and 
> relevant) kernel configurations and the binary is identical before and 
> after the change.

That, I dont think is possible. The maintainers will receive thousands
of patch in a day. If they have to compile each for all available
configuration (and arch), then they might spend the full day just
checking patches. Also, many upstream contributors contribute in their
personal spare time, so if building in all possible configuration
becomes a requirement then I think that is going to discourage many
contributors from contributing.

> 
> It is a Dead Store, so I expect the compiler to detect that and just 
> optimize that away...

Which is also something I always think, we are relying on the compiler
to produce the code that is actually executed on the hardware. There are
different compilers and each compiler has different versions, so that
means the generated code is going to be different. Even though we say
Linus Kernel meets the safety requirement, can we say that the kernel
that is executing on the hardware meets the safety requirement? This, I
think is completely off-topic for this WG, but just a thought.

> 
>> So, from a safety pov, is it a requirement that every submitted patch
>> will need to be tested based on the safety tests and all the other
>> defined tests?
>>
> 
> Well, I do not know what Roberto thinks his reference process is good for, 
> but I would like to know if Roberto thinks it can guide anyone on such a 
> question or not?
> 
> It is really just some fun for the discussion in this group... there are 
> thousands of commits travelling into the kernel... if we cannot provide 
> an answer for a single one, how to do it for thousands?

Lets have another example of a change.

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
index b78101afc93d..2b539335206a 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.c
@@ -367,7 +367,6 @@ uint oid_rt_get_scan_in_progress_hdl(struct
oid_par_priv *poid_par_priv)
        return RNDIS_STATUS_SUCCESS;
 }

-
 uint oid_rt_forced_data_rate_hdl(struct oid_par_priv *poid_par_priv)
 {
        return RNDIS_STATUS_SUCCESS;



Not a formal patch, just pasted the git diff. This fixes the checkpatch
warning of "Please don't use multiple blank lines". What tests are
needed on this patch to say that the kernel development meets the safety
requirement?



-- 
Regards
Sudip
