Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.1713.1600356544502217937
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 08:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NkOb/v8V;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id k15so2532289wrn.10;
        Thu, 17 Sep 2020 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=1wOdnXO5xWUrJNqTk4Lb8ZCXlWxc/puPG4bZgBd9T04=;
        b=NkOb/v8V6QMpLiy25tCXjpitlzt9k2Enayy7/z2ZViW93Itrm2xEQ3reZrN2WHqCxG
         aZM9yHlwdmrcc/2vHoHGqdHCamNwj8sQn8EKv5srWRLJXE03sA+kaNOaWeWvF2WWJ5lo
         J05xZiswlQ9FUnwWO9zZUKCxZ+Y4R8Xc/xnCe7+nYNot3NFsEcuHJjAhhDY0Rvu5zT0U
         DZp9AXB2eI03IIluopvBlib2aDmdOOPyoiTkAE5TeNM9aPYrFaZdA5tl9kFno9GzouPB
         FTsWlXqrLYxCaA6q0bzFGws3sD1Un8pqujVsVa7vvqh3xFpTQdsO1cbcH3a+WudAv5O/
         Jedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=1wOdnXO5xWUrJNqTk4Lb8ZCXlWxc/puPG4bZgBd9T04=;
        b=BUxVa9XiZ6h2kSgPg5euTHciFidbNvXyioxmUaVf6jVOU9cNLux5hokhWEh3VxvaGd
         Vap+gCmJcyDd+BbhI6cjXfLdif6OFQqkPfkRo5aLRPlfCJCEdZCFm1syrifpx+N09HCY
         pWNp2NRUSIetrZUe7aHOCHdjwc/zzuuTkC/elxtO4YvgWMrOhxxyGFzAoPzABrIsdUN4
         eJEU7DVF4ztiYr6xCfQPMvh1AH4thb83PlkdqsrytZADl8Yq0CBjUqvdDJJPVVeziSUY
         KXDW4Pd/8bpfqzlQJZPiFsmwL0SKFeHgOReaCy8kWgKRTdplQf99BDD9AhBuA5ABrTSx
         z78A==
X-Gm-Message-State: AOAM531w+qnAal/WPpx2fpBv+kMXYRroGiGZcgsqEu8JazKv5Yw+Zgtu
	zZTy099PoM9LVQy1Emhk7y8=
X-Google-Smtp-Source: ABdhPJxIquookDJ4l4wrbhLnXkMpLKi7Jl3VJ2rtTtKHkNF9a+V+iPnb/Fhkk72D2GdGSoDBgkezyQ==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr32703590wrs.227.1600356542794;
        Thu, 17 Sep 2020 08:29:02 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2da3:1100:b096:8628:b410:46b3])
        by smtp.gmail.com with ESMTPSA id u8sm11064096wmj.45.2020.09.17.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 08:29:02 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 17:29:00 +0200 (CEST)
X-X-Sender: lukas@felia
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-safety@lists.elisa.tech, 
    development-process@lists.elisa.tech
Subject: Re: [linux-safety] [PATCH] mm: vmscan: provide a change to the development-process group
In-Reply-To: <bca08c66-cad5-aac5-865c-f9b319142af0@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.2009171718090.9985@felia>
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com> <bca08c66-cad5-aac5-865c-f9b319142af0@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 17 Sep 2020, Sudip Mukherjee wrote:

> 
> 
> On 17/09/2020 09:44, Lukas Bulwahn wrote:
> > I think this change is needed for safety, whatever that might mean to you.
> > 
> > I am unqualified to really make a change here, as I have no clue what this
> > code does, nor what my change does, but sure, the testing and verification
> > reference process can now point out the required next steps in the
> > reference process to test this code and code change.
> > 
> > Good luck :)
> > 
> > Not intended for distribution to the general kernel mailing lists.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > I would like to submit such a patch, what do I need to do according to
> > the expected testing and verification recommendations for safety-related
> > systems?
> > 
> > Please help me. What do I need to compile, what test do I need to run,
> > which verification tool do I need to employ for this change?
> 
> The change looks valid, 'reclaim_order' has not been used anywhere after
> READ_ONCE(), and its  So, it looks like a harmless change, you will only
> need a good commit message detailing why its harmless.
> 

Thanks, Sudip. Yes, I also conclude it is harmless but I really cannot say 
as I did not even compile it :) and I guess you did not either :)

I would actually want to argue that I compiled it for all available (and 
relevant) kernel configurations and the binary is identical before and 
after the change.

It is a Dead Store, so I expect the compiler to detect that and just 
optimize that away...

> So, from a safety pov, is it a requirement that every submitted patch
> will need to be tested based on the safety tests and all the other
> defined tests?
>

Well, I do not know what Roberto thinks his reference process is good for, 
but I would like to know if Roberto thinks it can guide anyone on such a 
question or not?

It is really just some fun for the discussion in this group... there are 
thousands of commits travelling into the kernel... if we cannot provide 
an answer for a single one, how to do it for thousands?


Lukas
