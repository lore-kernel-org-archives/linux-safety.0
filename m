Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web12.11231.1597329565858250855
 for <linux-safety@lists.elisa.tech>;
 Thu, 13 Aug 2020 07:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EZQtuIFP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.196, mailfrom: skhan@linuxfoundation.org)
Received: by mail-oi1-f196.google.com with SMTP id v13so5200726oiv.13
        for <linux-safety@lists.elisa.tech>; Thu, 13 Aug 2020 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8vfuFrKXTzbVD9ohRW1enGoLfgWfUnuOjSSkNyh1/gA=;
        b=EZQtuIFPPSql5anccpiYc1rEkNe1FlViUxkRpLu89fgtLjAtaO8PtAYEd0Ht5R6PuE
         70nLUmXvZ9FKgQ2NH7+c1haXLj4s6jcWbTXhfyRFvQQqq39XsM3bhNRhNLOL6QPSDmpd
         Tzjg8rApBU7DVwb9W0NOhLT0hORaQI6kCup5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8vfuFrKXTzbVD9ohRW1enGoLfgWfUnuOjSSkNyh1/gA=;
        b=HWa9+M4jYuYUxEoBCvVjAPrg0ToVC5guoQ4Yret2prqdHKoA5d9slg1JqM6sYhhJeC
         9bhxZRgnR2IK3UXq8O52EHxiVrSrQJm3xNVdggNkykQWfyTCna8AsOIoI9DoqJL9/pMe
         3pWCv7HBTUm+zYAK1zP+JStsjSh+DCBKFockXkY75iEBTpjyqd4KL40vKKwa3XRG3zIp
         9PhNfO2mh0MI8UeqFNHCTgq86I+5uOjCPwrd2ml3qkDgLA9NkhitW0APPqr3K0ohv111
         /PYCaFk/QxheuW+ofsK2DaK4uYBwfMFDztjSLak4CzhvLcKJ6sVqq2v4TO5/SazH23Mb
         kORQ==
X-Gm-Message-State: AOAM531vUzlxvMcgTo5cPJPYXYGH6a9YHte5l11jjnnUQudnmht/fhkX
	GpZJd0QDnxOxo6eL79CQrcz21WN1t0w=
X-Google-Smtp-Source: ABdhPJze59hnFRBGBCsuDMCil/7fHcu2tRyP3BcYlD6vAWyylN5BwtGgs3C6p2mO68oDH8qNQLTFMw==
X-Received: by 2002:aca:b286:: with SMTP id b128mr3705488oif.89.1597329564650;
        Thu, 13 Aug 2020 07:39:24 -0700 (PDT)
Return-Path: <skhan@linuxfoundation.org>
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l17sm1156397otn.2.2020.08.13.07.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 07:39:23 -0700 (PDT)
Subject: Re: [linux-safety] [PATCH] coccinelle: misc: Check for hard-coded constants
To: Mohammed Billoo <mab@mab-labs.com>, linux-safety@lists.elisa.tech
References: <20200812234322.32355-1-mab@mab-labs.com>
From: "Shuah Khan" <skhan@linuxfoundation.org>
Message-ID: <9e9c2f28-b4e4-698d-f424-6973c486576f@linuxfoundation.org>
Date: Thu, 13 Aug 2020 08:39:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812234322.32355-1-mab@mab-labs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Mohammed,

Thanks for your patch.

On 8/12/20 5:43 PM, Mohammed Billoo wrote:
> This semantic patch looks for variables that are initialized to
> constants, arrays that are both declared and indexed with constants.
> A false positive will occur  when a variable is initialized to 0, which
> must happen for auto variables. This will be resolved in a future patch.
> 
> The patch was tested against the following snippet:
> 
> int main()
> {
>      int iarr[54]; /* instance 1 */
>      int j = 0;    /* instance 2 */
>      int i = 1;    /* instance 3 */
>      iarr[0] = 3;  /* instance 4 */
>      return 0;
> }
> 
> and it correctly identified instances 1, 3, and 4. It incorrectly
> identified instance 2, which will be addressed in a future patch.

Please include the output from the tool that corresponds to your
changes to the script in the commit log on a kernel file.

Also I see 3 patches with incremental changes to the script. Please
make this a patch series which will make it easier for reviewers.

thanks,
-- Shuah
