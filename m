Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.3246.1597347841922637952
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 12:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FubrV3kK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.210.66, mailfrom: skhan@linuxfoundation.org)
Received: by mail-ot1-f66.google.com with SMTP id 93so5798511otx.2
        for <linux-safety@lists.elisa.tech>; Thu, 13 Aug 2020 12:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O7qcxBRgf9Pbe8M3EnwW9KCpWQ39Kb5fXV1PMdU88ZY=;
        b=FubrV3kKSsa9ayERbiv/ZP9UKS0M6ApgJ1vcWjAkNQenTYqmHa3+jxVSkmEVQ3a4tw
         Tjl6JsEynAAcYCXCPbLjX0sBRMoqETYob+UmuEoXyqb3fdHgLmMhG3My0H1x20Zc3EPs
         4Gz8Lxwbbh4/TVAA7Ay6hMwbOXJbAULHF9Spg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O7qcxBRgf9Pbe8M3EnwW9KCpWQ39Kb5fXV1PMdU88ZY=;
        b=S10tEFmpePZu8olfgjdk6QVxrPK1ynl2JFpbdfaLEzBGZU8fgIKoZAYr9BKLzvgznZ
         5kcfj7IcuG6rSKV8UZuQ0mJpbPWZ0QQCck1ZftuKx3Nqu8bLAcT0sZOTnhq+cjJo8nFe
         qWCoNEY+EUc9ipg8EwTz7vNjHZUDE9be/FGzvbzKvfUBMeZvHmDqWZwagu5IuYDGI9lD
         IWap+VXaC0t7qnQHvOr1LCAoVKU4Tlw7N5u+w3+S3N1mvFDxmbk1AU+PczsVXe3LIPF8
         LvJn65ZvOVy5RCEICa4wNbgHfCZB4+zdzsFfeTeGW1vMKv11pFb08SoP7yceBvCjHb13
         46ig==
X-Gm-Message-State: AOAM533fOe8noEB8E4Zbc+AvE7i4z4mzgPAuaFZji87OiSG9sGmyRuz1
	PMenEGpu/aTjA8iixIY/iCWEOY1lycA=
X-Google-Smtp-Source: ABdhPJzHMl+BHCVs18l8mxtoNXxMSCzPJRMJC4yyeaLbMlJlEivTtEb+uhWT/tVMvATEO6xBlaB4gg==
X-Received: by 2002:a9d:1ca6:: with SMTP id l38mr5765146ota.58.1597347840960;
        Thu, 13 Aug 2020 12:44:00 -0700 (PDT)
Return-Path: <skhan@linuxfoundation.org>
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d7sm1286790oop.34.2020.08.13.12.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 12:44:00 -0700 (PDT)
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, mab@mab-labs.com
Cc: Lukas Bulwahn <Lukas.Bulwahn@bmw.de>, linux-safety@lists.elisa.tech
References: <1e3cf82b34e2413bb0b438ef1adfa04b@smucm07j.europe.bmw.corp>
 <CALkjhPogfjCx69uQ3GDzA_ei062ktrLh+S5gC_9b0ESK_Dsv=A@mail.gmail.com>
 <e4cb161b629748cc84523c06956c60cb@smucm07j.europe.bmw.corp>
 <a63becea-5374-2f73-c9ef-3bc6301b80dd@codethink.co.uk>
 <162AE2925F9D984B.16363@lists.elisa.tech>
From: "Shuah Khan" <skhan@linuxfoundation.org>
Message-ID: <37992277-0af2-4a6e-ba20-78a7d956f617@linuxfoundation.org>
Date: Thu, 13 Aug 2020 13:43:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <162AE2925F9D984B.16363@lists.elisa.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/13/20 11:02 AM, Shuah Khan via lists.elisa.tech wrote:
> On 8/13/20 9:41 AM, Sudip Mukherjee wrote:
>>
>>
>> On 13/08/2020 16:33, Lukas Bulwahn wrote:
>>> Sorry for top posting.
>>>
>>>
>>> No, safety is CERTAINLY NOT a category. Security maybe, but even better
>>> would be a category like “information leaks” and a subset
>>> “kernel-internal information leaks” for your specific coccinelle rule
>>> addressing CWE-547.
>>>
> 
> +1
> 
>>>
>>> For me, for now, misc is okay, but if we want to restructure and
>>> clean-up, we should come up with a complete picture that fits for all.
>>
>> imho, misc is ok for this one, but when you actually make a cocci script
>> for CWE-414 ("Missing Lock Check"), that should be going to
>> scripts/coccinelle/locks/
>>
> 
> +1
> Agree with Lukas and Sudip on directory - safety isn't appropriate here.
> 
> You can find a suitable place: current coverage areas under
> scripts/coccinelle are
> 
> api  free  iterators  locks  misc  null  tests
> 
> Let's try to map new scripts to these categories or create a new
> category when one doesn't exist.
> 

One more thing. Also look into if these issues can be found by compiler.
If so, is there a need to come up with coccinelle script.

Somehow this sounds like a basic error compiler should be able to flag
and might already have a method in the kernel.

thanks,
-- Shuah
