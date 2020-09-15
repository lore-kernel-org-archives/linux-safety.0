Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.15621.1600182435598400312
 for <linux-safety@lists.elisa.tech>;
 Tue, 15 Sep 2020 08:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vxo7IblT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.179, mailfrom: skhan@linuxfoundation.org)
Received: by mail-oi1-f179.google.com with SMTP id a3so4239464oib.4
        for <linux-safety@lists.elisa.tech>; Tue, 15 Sep 2020 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hZNcNHBMwl+EOKfWq6ylS48+nFPVP9mUhvBMT6ehx68=;
        b=Vxo7IblTBrgp6QYw30U9g23IXiRX4Ern1WoY3Q5IBK69BknNUaRrt0z8GacaFmrFOl
         pCsd5LgyI3nH+SHz1s2Hr4fL4AFd2jmIAKoCwxgULx0BJ4W/laW98GCliwwtND3neKma
         OkX3s7apHUFEVJiLLyWKwEMBPwpZ+BGyIlttE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hZNcNHBMwl+EOKfWq6ylS48+nFPVP9mUhvBMT6ehx68=;
        b=gp8VpfovX3jeuULXOnvPUOlKZdtYbmd1nx+RS2autZ9gJhWa2gK843hs+8YS10WVJ3
         rxRxrXvX6jhPXrO4mVD7Cdtc7QJR1EKvSt96KqwM8HwpN946rFLRKOuwDcsHc1do851r
         9yKzQ4jdKAiuJhh6pEZEqDvX7AsVeuWnB1TwJ1QmsvUmn4WduZlaSQsuHtjfHiEIZHh5
         BL4xS6FP2bJtvi9E4U7xWvafaMI5ONYC+vUPk+nPUljrFUqcSRylclKnW2r7Ku6sgu9f
         RhjMHUB1fqIwvHBxJ/O4Ht62YeLXGhgYY8bb36rizH0AeF4N9N2bF1pfFT8ZdPTOReTI
         GxkQ==
X-Gm-Message-State: AOAM531du7d4Zv0S1wHto2JN831p58STJyPIQcCiQIwBen7QZXRv3v3R
	DzuSWM/yggSPYEnwbFVeyCRwduuMQHmpmA==
X-Google-Smtp-Source: ABdhPJzP3rkuche0aqnpnYfTVYos2kPkoUntrVbqfBR87h0aH7qNcu6msrtT9dQuTyvdbdN2bdLZ1Q==
X-Received: by 2002:a05:6808:aa7:: with SMTP id r7mr3883826oij.174.1600182434683;
        Tue, 15 Sep 2020 08:07:14 -0700 (PDT)
Return-Path: <skhan@linuxfoundation.org>
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id m3sm5837505otc.72.2020.09.15.08.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 08:07:14 -0700 (PDT)
Subject: Re: Kernel branch link?
To: Mohammed Billoo <mab@mab-labs.com>
Cc: linux-safety@lists.elisa.tech
References: <CALkjhPrjj1ZZ3wbuf6fuUKTCMq1Y_hLXwhi4B_nLx_AD6Enx5Q@mail.gmail.com>
From: "Shuah Khan" <skhan@linuxfoundation.org>
Message-ID: <df6e97df-381b-25b0-cb15-eb2705187e1c@linuxfoundation.org>
Date: Tue, 15 Sep 2020 09:07:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALkjhPrjj1ZZ3wbuf6fuUKTCMq1Y_hLXwhi4B_nLx_AD6Enx5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/15/20 8:14 AM, Mohammed Billoo wrote:
> Shuah,
> 
> Can you send the link to your linux kernel branch (or a branch you
> think makes sense for us to base our work off of)? I will use that as
> the basis/reference for the Docker container.
> 
> Thanks
> 

Hi Mohammed,

I will create one and send the info. later on today.

thanks,
-- Shuah
