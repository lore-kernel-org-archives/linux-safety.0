Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web11.12895.1597333278720711464
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 08:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-2-98-43-106.as13285.net ([2.98.43.106] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1k6FLw-0000HL-12; Thu, 13 Aug 2020 16:41:16 +0100
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
To: mab@mab-labs.com
Cc: Lukas Bulwahn <Lukas.Bulwahn@bmw.de>, skhan@linuxfoundation.org,
 linux-safety@lists.elisa.tech
References: <1e3cf82b34e2413bb0b438ef1adfa04b@smucm07j.europe.bmw.corp>
 <CALkjhPogfjCx69uQ3GDzA_ei062ktrLh+S5gC_9b0ESK_Dsv=A@mail.gmail.com>
 <e4cb161b629748cc84523c06956c60cb@smucm07j.europe.bmw.corp>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <a63becea-5374-2f73-c9ef-3bc6301b80dd@codethink.co.uk>
Date: Thu, 13 Aug 2020 16:41:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e4cb161b629748cc84523c06956c60cb@smucm07j.europe.bmw.corp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 13/08/2020 16:33, Lukas Bulwahn wrote:
> Sorry for top posting.
> 
>  
> 
> No, safety is CERTAINLY NOT a category. Security maybe, but even better
> would be a category like “information leaks” and a subset
> “kernel-internal information leaks” for your specific coccinelle rule
> addressing CWE-547.
> 
>  
> 
> For me, for now, misc is okay, but if we want to restructure and
> clean-up, we should come up with a complete picture that fits for all.

imho, misc is ok for this one, but when you actually make a cocci script
for CWE-414 ("Missing Lock Check"), that should be going to
scripts/coccinelle/locks/



-- 
Regards
Sudip
