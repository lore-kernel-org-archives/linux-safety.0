Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.14732.1597338135866885857
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 10:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XV0pyif/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.193, mailfrom: skhan@linuxfoundation.org)
Received: by mail-oi1-f193.google.com with SMTP id o21so5637735oie.12
        for <linux-safety@lists.elisa.tech>; Thu, 13 Aug 2020 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JQ6jtlZxA2x+3o68J/Vhi2r4Ru8KIp3Y6Ync2JrAzwc=;
        b=XV0pyif/7KFNWUCWfkHYdOmKvxApPhTWwoVzCAFCh2sT0uX2BaNOr85kiWvpcj54KQ
         DIm1rQAgyib2ApTIuVTx9cz2jRI6JxutRcA8UoENGcxgq55q7XyZcH7f+XDUqVkjqMMh
         VFrSlgXye+uouac2kFgRNmNRFXt/x04/NxobI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JQ6jtlZxA2x+3o68J/Vhi2r4Ru8KIp3Y6Ync2JrAzwc=;
        b=UKKsfNDRVRMXnrI3OxDuXHJbumJ10CPPUq43ICsAhIZ6Sjk2jg2vcPEC8GRfH0s7qQ
         UfQ5HeprcDWN9r9klQrYEVs3GlxzLJKRe5Q6wOBU34+LR4oEax2mCyxyy95eqS1JBRNb
         Py1s9WVbFzLH+pJGpW3cfLdxkebA5FM1ESF0oU46iFxDvE3F2qOIUQBmB0VYx71bDFpN
         ejvsTpITOuj7a2pjL1aj6XGoPOOjorrNzQhyLSn0e610k5vDfS/G3+FZiUHKPE9rRNfw
         1ru/UnLi7jF0bLkYOGo3dfUx84S5ylwHJYWH3uq/WVoiE+oBLwKkhz1FdfJ4iTj20JM/
         NWxg==
X-Gm-Message-State: AOAM532GiwZz7lB3OuOCyqxxDov0plHn97k9nI8PVG0kXPLahpwnkRdN
	tgKx2/Y98+a8lp8+2M+313Q+bwAvIkM=
X-Google-Smtp-Source: ABdhPJz6UlX3thTvlkS7hny1HAEBUr0tVWhiBfH4YM45CO33sz1K/ZSfsGUVkduRwT0cBWivOkBnUg==
X-Received: by 2002:a05:6808:683:: with SMTP id k3mr4070668oig.50.1597338134897;
        Thu, 13 Aug 2020 10:02:14 -0700 (PDT)
Return-Path: <skhan@linuxfoundation.org>
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b188sm1294783oif.19.2020.08.13.10.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 10:02:13 -0700 (PDT)
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, mab@mab-labs.com
Cc: Lukas Bulwahn <Lukas.Bulwahn@bmw.de>, linux-safety@lists.elisa.tech
References: <1e3cf82b34e2413bb0b438ef1adfa04b@smucm07j.europe.bmw.corp>
 <CALkjhPogfjCx69uQ3GDzA_ei062ktrLh+S5gC_9b0ESK_Dsv=A@mail.gmail.com>
 <e4cb161b629748cc84523c06956c60cb@smucm07j.europe.bmw.corp>
 <a63becea-5374-2f73-c9ef-3bc6301b80dd@codethink.co.uk>
From: "Shuah Khan" <skhan@linuxfoundation.org>
Message-ID: <5d3b890a-acab-50f7-ecf2-b61d53d232eb@linuxfoundation.org>
Date: Thu, 13 Aug 2020 11:02:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a63becea-5374-2f73-c9ef-3bc6301b80dd@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/13/20 9:41 AM, Sudip Mukherjee wrote:
> 
> 
> On 13/08/2020 16:33, Lukas Bulwahn wrote:
>> Sorry for top posting.
>>
>>   
>>
>> No, safety is CERTAINLY NOT a category. Security maybe, but even better
>> would be a category like “information leaks” and a subset
>> “kernel-internal information leaks” for your specific coccinelle rule
>> addressing CWE-547.
>>

+1

>>   
>>
>> For me, for now, misc is okay, but if we want to restructure and
>> clean-up, we should come up with a complete picture that fits for all.
> 
> imho, misc is ok for this one, but when you actually make a cocci script
> for CWE-414 ("Missing Lock Check"), that should be going to
> scripts/coccinelle/locks/
> 

+1
Agree with Lukas and Sudip on directory - safety isn't appropriate here.

You can find a suitable place: current coverage areas under
scripts/coccinelle are

api  free  iterators  locks  misc  null  tests

Let's try to map new scripts to these categories or create a new
category when one doesn't exist.

thanks,
-- Shuah
