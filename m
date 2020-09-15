Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.5018.1600197770173533391
 for <linux-safety@lists.elisa.tech>;
 Tue, 15 Sep 2020 12:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BYDENQUo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.210.52, mailfrom: skhan@linuxfoundation.org)
Received: by mail-ot1-f52.google.com with SMTP id h17so4384781otr.1
        for <linux-safety@lists.elisa.tech>; Tue, 15 Sep 2020 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x1jl/ZkAkPbSo/mAKBPRmRUHfCgCCy4maZ4WdgCI61U=;
        b=BYDENQUoEtyehpidNzlaTWno3dD1JdOFgNkGf+/AwFGr7sXn5I/0yQruTIYPOa9Apu
         2apJ04PjCzt+K9zvhAsmnyCoRHXhCA6FzOuFuoqCRDxiWOChTWMiWAel9U9qaK7whZ1M
         NnvjbDFdIahxflzMGWdXOQhiUpyau928xb0lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x1jl/ZkAkPbSo/mAKBPRmRUHfCgCCy4maZ4WdgCI61U=;
        b=GqzVmvyE5dBmbRK3lZaOxUhYCA5zxrBOzpR3FPIO4ZMqfXsIi1PARQBvKadjWoPU+p
         Mr/PipwPdfyOyhZdxXwJ3AxDrJ2glc2DB3uSiAHf+Xwn4A53zJ5ye+Sedm12GZ63Xnga
         L4CjzqGusJlmDdlk4qnLlovIkBcz24Jd+/iZOg+Pc9mtioL24Lne81pNbFeXR47aTS8q
         aXSuvSwvd34FIbRauilBuFKt5386T1QQNLlCNOPnAdZfbRedXA90Sz6PFRi4pNSp3NUf
         mF/CuEH05TZCDBic5OPUoIkLm2nqqMB/cyK6SVZ4zGQLwEzi2Vc7QEYJ00wIccFaV+1d
         ekFw==
X-Gm-Message-State: AOAM531QCOuahhMrQyLGF4iWiSBBb8XiF+unVsHrrzYb3PLRvM7J/AK2
	vtTHwWpovDVbE9GXUA3PZywC2Q==
X-Google-Smtp-Source: ABdhPJx48tdjhZ4LYyvhEDu18U20UejGTMS1nu7IxyzaDZHbApbHd1lXD4tU6Dh6dGA2jxR4RHDPZA==
X-Received: by 2002:a05:6830:48:: with SMTP id d8mr13338373otp.272.1600197768981;
        Tue, 15 Sep 2020 12:22:48 -0700 (PDT)
Return-Path: <skhan@linuxfoundation.org>
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b16sm6228680otq.31.2020.09.15.12.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 12:22:48 -0700 (PDT)
Subject: Re: [linux-safety] Kernel branch link?
To: Mohammed Billoo <mab@mab-labs.com>
Cc: linux-safety@lists.elisa.tech, Shuah Khan <skhan@linuxfoundation.org>
References: <CALkjhPrjj1ZZ3wbuf6fuUKTCMq1Y_hLXwhi4B_nLx_AD6Enx5Q@mail.gmail.com>
 <1634FD7281D7C1A4.20317@lists.elisa.tech>
From: "Shuah Khan" <skhan@linuxfoundation.org>
Message-ID: <7bff04a4-84b5-0737-69cf-68e72c881d02@linuxfoundation.org>
Date: Tue, 15 Sep 2020 13:22:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1634FD7281D7C1A4.20317@lists.elisa.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/15/20 9:07 AM, Shuah Khan via lists.elisa.tech wrote:
> On 9/15/20 8:14 AM, Mohammed Billoo wrote:
>> Shuah,
>>
>> Can you send the link to your linux kernel branch (or a branch you
>> think makes sense for us to base our work off of)? I will use that as
>> the basis/reference for the Docker container.
>>
>> Thanks
>>
> 
> Hi Mohammed,
> 
> I will create one and send the info. later on today.
> 

Please use the

git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git
linux-safety branch.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=linux-safety

It is based on Linux 5.9-rc5 at the moment and I can keep rebasing
it to track Linus's master.

thanks,
-- Shuah
