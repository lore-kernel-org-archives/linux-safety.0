Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.12153.1594392130328755129
 for <linux-safety@lists.elisa.tech>;
 Fri, 10 Jul 2020 07:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OaICqlmH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.176, mailfrom: skhan@linuxfoundation.org)
Received: by mail-oi1-f176.google.com with SMTP id j11so4939357oiw.12
        for <linux-safety@lists.elisa.tech>; Fri, 10 Jul 2020 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ExMs+y6Mw4TrsX6EmWrdA2mMgSpw5cS9CeNTmOH0Bz8=;
        b=OaICqlmH0BTTjIIyurx2hc5a8IBY0BOoeWNypqGAnRAY5QkqCCxrbtKvlkhaSkv04I
         LyzAiApi4ovNyDawJ/Fape8eWAq6cEdNS1Jx7BGqNGe/liC3rJa15aOlOY/T+iQ7flZm
         G8AG22zr6Fc/uRfx0nThD8IXGw5BjQce/eVno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ExMs+y6Mw4TrsX6EmWrdA2mMgSpw5cS9CeNTmOH0Bz8=;
        b=pCTv2C5gaIc8PNaNMWcetxC/Vwdp9SaYaugk/YJPXJZr94J2IcUobUCsCtZ2/tSgiG
         Y0uEHIWVb3Fh1y+sxDWiAJeeo1y5pihFt7JFYs1a4rP1Hf8OpY4jMMsAJKFQ/i3yYH2T
         0HcOv+d7BKLkx0rpDSeWS96ws1AAXbN09Ntdlz6PVLpZf+5EM7S3D6dHu3H1vcOuHbtB
         5G/7YBw42tR1Cs1A2cTVx/qyK3BmDFKyBrknhHPHp6J/AxNHl5qEw4Wn2FNVcXqGfIy9
         9R3cUlMvcm+6dwhltpVfNvqXLMir6nS6I/rntnstX5msQqgSGDFGuWPenb39JmlY/qxQ
         dl3A==
X-Gm-Message-State: AOAM531oL+pX+ZU2+hYail8Q6OgrawXDc/3VDveLW5SN0s7mX1Kan03M
	/7qGk2Aut0diFoOoPfzQ1iVXhA==
X-Google-Smtp-Source: ABdhPJzwI4IBtamvcpLgm7tNl3maUTvJW8Y5ZglEgX0qJoA8Armz+wMIgmMx+8Rl5rZKZbE7Umu15A==
X-Received: by 2002:a54:4884:: with SMTP id r4mr4444065oic.74.1594392129607;
        Fri, 10 Jul 2020 07:42:09 -0700 (PDT)
Return-Path: <skhan@linuxfoundation.org>
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id z2sm1123720otq.17.2020.07.10.07.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 07:42:08 -0700 (PDT)
Subject: Re: [ANNOUNCE][CFP] Kernel Dependability & Assurance Micro Conference - LPC 2020
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-safety@lists.elisa.tech
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "lukas.bulwahn@bmw.de" <lukas.bulwahn@bmw.de>,
 "devel@lists.elisa.tech" <devel@lists.elisa.tech>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <675ed25a-3fa8-e288-1be4-41710a807d1f@linuxfoundation.org>
From: "Shuah Khan" <skhan@linuxfoundation.org>
Message-ID: <34aa3ed4-7405-d1b2-f884-30ee5ad279aa@linuxfoundation.org>
Date: Fri, 10 Jul 2020 08:42:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <675ed25a-3fa8-e288-1be4-41710a807d1f@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/9/20 2:58 PM, Shuah Khan wrote:

+ devel@lists.elisa.tech <devel@lists.elisa.tech>

> This is the call for proposals for the Kernel Dependability & Assurance
> Micro Conference at the Linux Plumbers Conference 2020. It will take
> place online during the Linux Plumbers Conference on August 24th-28th,
> 2020.
> 
> The Kernel Dependability & Assurance Micro Conference is intended to
> bring the safety-critical systems community and the kernel community
> together to start a dialogue and collaboration on making sure that the
> kernel is fit to be used in safety-critical systems and that questions
> from the safety community and other wrt. software quality can be
> answered adequately.
> 
> The goal for this conference is to explore kernel dependability as it
> relates to safety-critical applications in the areas of uptime, tooling,
> and processes. The focus is going to be on the following topics.
> 
> - Kernel Quality Assurance beyond Testing and CI?
> 
> - Understanding the User's Expectations on Software Quality for
>    business-critical systems
> 
> - Define safety requirements for overall kernel: features, tests etc.
> 
> - Define run-time characteristics and requirements
> 
> - Identify missing features necessary to operate in safety critical
>    environments.
> 
> - Discuss safety features
> 
> - Regression Testing for safety: Identify configurations and tests
>    critical and important for safety quality and dependability
> 
> - Discuss and identify gaps in tests.
> 
> - Add tests and add configurations to existing test rings.
> 
> - Understanding the Kernel Development Organization and Management
> 
> - Assessing, Measuring and Evaluating the Development Process
> 
> We encourage submissions that do not present a final solution. Instead,
> that serves to get feedback from the community, to point to action items
> for future development, and that can result in patches for the Linux
> Kernel and Linux ecosystem in the future.
> 
> Please submit your proposals on the LPC website at:
> 
> https://www.linuxplumbersconf.org/event/7/abstracts/#submit-abstract
> 
> And be sure to select "Kernel Dependability & Assurance MC" in the Track
> pulldown menu.
> 
> Proposals must be submitted by August 2nd, and submitters will be
> notified of acceptance by August 9th.
> 
> thanks,
> -- Shuah
