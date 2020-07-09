Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.4897.1594328297104652068
 for <linux-safety@lists.elisa.tech>;
 Thu, 09 Jul 2020 13:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bBHUN6Or;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.179, mailfrom: skhan@linuxfoundation.org)
Received: by mail-oi1-f179.google.com with SMTP id y22so3002674oie.8
        for <linux-safety@lists.elisa.tech>; Thu, 09 Jul 2020 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=EDWW8ZPjyoebchhz2GeXwkSC4GQIj8hrZuuqox3N7vI=;
        b=bBHUN6OrbVFW8ceOMeAHbEHtBJUcTipUpBqltr2dVz+TlhHHs5pB+MtFBe4Gpm2SMH
         np9N0u/xz0XqMfDOwx4i4gYWv4ZXNlnsLKLZknNaLuxns3QKjEo4D9Px25Ev1HTSyNJv
         1w6uG33jIB2kPxfk+Zu16fXFpvxJkTXJz8euA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=EDWW8ZPjyoebchhz2GeXwkSC4GQIj8hrZuuqox3N7vI=;
        b=eLf2wgbcZyCefeU8ihB7QfcEM2wrsSSYK3DuVxuv4io6sGpjkrV931162CVAwRdfWY
         b0BEnCF06pYi2SleJ2ZE0cq02EO337ZhDQFjeNf57pYFCQBhAjCsAlfel9+IoY/li2wd
         QWJgl1uu6UrXtSqsEwo3ZrEngr1of/D38NcikBZyZKUazz36ilj6L9qDCeASlW6OHSoO
         SBLP+MZ8lQfSPo2TC4rdgruhdbW4hsAf1ENMQx3EM0ctQf/Rt/1h2JCSy1B7kL+sdFg6
         N3D1GhacfoVNBV2IBC0BVtA5jIojXCZUaheQb5YIFRYxGPxzrPSAxN109So7iQzSIa2k
         fO4Q==
X-Gm-Message-State: AOAM532BZHjCqHtSlYN/YxN3f0kvrqdMEpRczE1Gon6gYnPAU+LO0juv
	1cIy1I6mvzNZaWJ0z/YO3F+ucw==
X-Google-Smtp-Source: ABdhPJytgSEh45RvMZKy1z5ZYTrYSnGPT/HMB+mqjdUMUGmtsq60LuL3wXhvh7+HhOi76fn4nN2I0g==
X-Received: by 2002:aca:5c03:: with SMTP id q3mr1769738oib.132.1594328296417;
        Thu, 09 Jul 2020 13:58:16 -0700 (PDT)
Return-Path: <skhan@linuxfoundation.org>
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d193sm704681oib.53.2020.07.09.13.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 13:58:15 -0700 (PDT)
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-safety@lists.elisa.tech
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "lukas.bulwahn@bmw.de" <lukas.bulwahn@bmw.de>, skhan@linuxfoundation.org
From: "Shuah Khan" <skhan@linuxfoundation.org>
Subject: [ANNOUNCE][CFP] Kernel Dependability & Assurance Micro Conference - LPC 2020
Message-ID: <675ed25a-3fa8-e288-1be4-41710a807d1f@linuxfoundation.org>
Date: Thu, 9 Jul 2020 14:58:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is the call for proposals for the Kernel Dependability & Assurance
Micro Conference at the Linux Plumbers Conference 2020. It will take
place online during the Linux Plumbers Conference on August 24th-28th,
2020.

The Kernel Dependability & Assurance Micro Conference is intended to
bring the safety-critical systems community and the kernel community
together to start a dialogue and collaboration on making sure that the
kernel is fit to be used in safety-critical systems and that questions
from the safety community and other wrt. software quality can be
answered adequately.

The goal for this conference is to explore kernel dependability as it
relates to safety-critical applications in the areas of uptime, tooling,
and processes. The focus is going to be on the following topics.

- Kernel Quality Assurance beyond Testing and CI?

- Understanding the User's Expectations on Software Quality for
   business-critical systems

- Define safety requirements for overall kernel: features, tests etc.

- Define run-time characteristics and requirements

- Identify missing features necessary to operate in safety critical
   environments.

- Discuss safety features

- Regression Testing for safety: Identify configurations and tests
   critical and important for safety quality and dependability

- Discuss and identify gaps in tests.

- Add tests and add configurations to existing test rings.

- Understanding the Kernel Development Organization and Management

- Assessing, Measuring and Evaluating the Development Process

We encourage submissions that do not present a final solution. Instead,
that serves to get feedback from the community, to point to action items
for future development, and that can result in patches for the Linux
Kernel and Linux ecosystem in the future.

Please submit your proposals on the LPC website at:

https://www.linuxplumbersconf.org/event/7/abstracts/#submit-abstract

And be sure to select "Kernel Dependability & Assurance MC" in the Track
pulldown menu.

Proposals must be submitted by August 2nd, and submitters will be
notified of acceptance by August 9th.

thanks,
-- Shuah
