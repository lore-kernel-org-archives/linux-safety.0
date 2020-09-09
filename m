Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.9947.1599695115960803429
 for <linux-safety@lists.elisa.tech>;
 Wed, 09 Sep 2020 16:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=EWKm0j0b;
 spf=softfail (domain: mab-labs.com, ip: 209.85.167.195, mailfrom: mab@mab-labs.com)
Received: by mail-oi1-f195.google.com with SMTP id y6so4169148oie.5
        for <linux-safety@lists.elisa.tech>; Wed, 09 Sep 2020 16:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iZy6l7I4DkNtH1HATx6FeMQkItSCaTrGYCEgzBiJUJU=;
        b=EWKm0j0bM8+VN3owCa4Nwc3iJNDaF36u7CMq9887AuQH9PLm+3dQi9sriGZY8G/kew
         pQykv0nHqscGFtBqAlnvk6koexc8DBmUas+kVf12hTjaM7+AAjf/+jt+pKfp+r+KqFf1
         gqYkmWijaBWimnmedvJZZHk+krS8SH5RNH8MXRqk89EQYAe2W08CyYFcexXw3vhqBVO4
         2pu/Ty6xXQLB8VFuo+3v/ziwn//Ke5igWDlqqW22y6GWbhfD98ZOgQvm8/3TH/y9u/b8
         +V8oU9yHYJBeUCJgZC2KcPgA+Aw/UC59WKtiQIN8UQx2jTDB3KyheeeDIjMODVaP0aR+
         +FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iZy6l7I4DkNtH1HATx6FeMQkItSCaTrGYCEgzBiJUJU=;
        b=jCKh7PdDECpWlV6Ka5a1Lyxw62IMbTMkPJFP4JcY92ARbRb3RPAWMD6/YwVDgfoZGH
         lZPU2V1EPJluw2a5pvhEXziWahqXyDd9n79mdioVAreLjtVfysC6CLIBYIYsmnBzKXx3
         NOUEBTVQ7TtzmWH/Q08N3cLQt/3sNVyqSB7CQg76m5yGKmP0DU95gxL/lSWgQFvjMFft
         YxDS8SVbXjq5feL3JzSXyA09UCCRd+DzanMHIURFz24iISLKIQZFSKZCp5tXLkvLzhhF
         wV8dpFj3iorubk5mgN1zy4+CH5PGbjP6i0r0otW4LWwkmryR2BZSgLTi3dtzKY37Kr9d
         C4JQ==
X-Gm-Message-State: AOAM533K6quabx3DP5ldHN8X63fEW0QZ5YpFnRE0jX+DNYTPa9ts+y2M
	Yb/7s+ppBUGFe1kMrozO6vQOhIQrcRf0w1rR74/T2g==
X-Google-Smtp-Source: ABdhPJwK/fSpFz5pxoVa4CrFMCB9tdDT1vLCOEDDeUuWlRcgPaFCh3wYTZlVciS2/WsXx8DD6kflBwaYbuzePWARru4=
X-Received: by 2002:aca:e144:: with SMTP id y65mr2079492oig.101.1599695115232;
 Wed, 09 Sep 2020 16:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200827151333.11591-1-mab@mab-labs.com> <alpine.DEB.2.21.2009091533570.23843@felia>
In-Reply-To: <alpine.DEB.2.21.2009091533570.23843@felia>
From: "Mohammed Billoo" <mab@mab-labs.com>
Date: Wed, 9 Sep 2020 19:45:03 -0400
Message-ID: <CALkjhPrJN-kB_UjuqZFpSaySyU6Q8mD7dCsP=ik4+itu=TWKcg@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] scripts: Report 'suspicious' comments
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

> - Second, we then need to look into true and false positives here.
> BUG appears in intended error messages, in DEBUG, in functions, such as
> BUG, BUG_ON. So we need to collect the context around BUG and see to
> improve the pattern to at least reduce the false positives.
>
I thought this was addressed in the Perl script. Did you find
instances where this isn't the case (IIRC, BUG(), BUG_ON(), and
anything else that is outside of a comment were ignored)?

> - Third, we then need have suitable ways to aggregate the findings to know
> which places are known to have many such findings and hence deserve some
> kind of special care.
>
Do you think CodeChecker would be suitable for this?

> And then, we need a lot of help to make proper evaluations what to do.
Can you elaborate on this? I don't understand what you mean here.

-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022
