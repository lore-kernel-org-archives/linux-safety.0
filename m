Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.1983.1600357449526944449
 for <linux-safety@lists.elisa.tech>;
 Thu, 17 Sep 2020 08:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=euZQM4xv;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id k18so2524917wmj.5;
        Thu, 17 Sep 2020 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=4N8LFqPmEAIbhbAVVSje7WFF8Wyg6vikrrAsxJIwvSI=;
        b=euZQM4xvvvLPdywpnpffukX1AMNvRo5e9UN/BewcTl/MNbi8LywThXyIiYT9bn24Pz
         715/djAVAN7uI6Raji8tULkm6zFQxR9DjnhfH/g9O1JB+lcOUdQ+dBMDwrb9e7v2pxdu
         26/u72XEpcUh6cSOzTNJh42a4cxBD++eMeG/OAfdddgwzFdmiiM+BEcL/pX8GDYmnaxV
         MPTn18ZT2Xd+ReWj4/DwNmfO0eQ10ZbeVa9v30LuJYmjccgWfjNi/dO1zH22ZlMtBTAs
         FsEnqIHZaDCSMjD3IHGah+G8wWVR4rvN0Tlj16aRDVWdUpdxMA2EvRyAiL5XIquhRu6O
         MD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=4N8LFqPmEAIbhbAVVSje7WFF8Wyg6vikrrAsxJIwvSI=;
        b=Jg1w5KOYPZH71O/RaKRLFpRTVeBQUb2UjAYcivIL8pwUm7XMxhYpXObeAdl2bOjWF4
         wMyFAi3j0yHYsiBf9IUaKjPLnzBocNk1vcOcfeBwaJzRzNcE4/9nwEsLYdBWQlngkj1m
         Sn1tcbmslKg9Cyz8nF1KJcbuS9ra4MiY2az7n4m90Tu5xSTPpqZv+AZhztCrND5KYqfO
         WWPv2vAAhYi5dVWAnu3wGfnvakWOCTdiaEOaiDGqWfkB99K7OMAOeJ6pO58hPal/736z
         D3ensEyTg8eyemvoo46DYBsLDgiSSXCR9GBzs6xkvt8EkHgbMfRyYkuoWJYM2/gLgqzV
         MqKQ==
X-Gm-Message-State: AOAM533fZOHTHXazKtalavAdpxhfSq55Lwwg+y2UIuxM1y7Fd3tmxW7X
	kij+8oie1rQDoVDllwzLTcU=
X-Google-Smtp-Source: ABdhPJxBUEMwulEcxHAOtvO4tzOTeMR+VBtcGGVo1N5tvTE5Z5jE1zgDyx5oIwAzhnodzHFVuBcizA==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr10250225wmc.127.1600357447858;
        Thu, 17 Sep 2020 08:44:07 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2da3:1100:dd9f:23a1:e5f6:157])
        by smtp.gmail.com with ESMTPSA id h4sm39326782wrm.54.2020.09.17.08.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 08:44:07 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 17:44:05 +0200 (CEST)
X-X-Sender: lukas@felia
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
    "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>, 
    "development-process@lists.elisa.tech" <development-process@lists.elisa.tech>
Subject: Re: [linux-safety] [ELISA Development Process WG] [PATCH] mm: vmscan: provide a change to the development-process group
In-Reply-To: <BY5PR11MB419520C95C248EFDB49A3DEA883E0@BY5PR11MB4195.namprd11.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2009171729190.9985@felia>
References: <20200917084409.26992-1-lukas.bulwahn@gmail.com> <BY5PR11MB419520C95C248EFDB49A3DEA883E0@BY5PR11MB4195.namprd11.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 17 Sep 2020, Paoloni, Gabriele wrote:

> > -----Original Message-----
> > From: development-process@lists.elisa.tech <development-
> > process@lists.elisa.tech> On Behalf Of Lukas Bulwahn
> > Sent: Thursday, September 17, 2020 10:44 AM
> > To: linux-safety@lists.elisa.tech
> > Cc: development-process@lists.elisa.tech; Lukas Bulwahn
> > <lukas.bulwahn@gmail.com>
> > Subject: [ELISA Development Process WG] [PATCH] mm: vmscan: provide a
> > change to the development-process group
> > 
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
> 
> Probably the problem is not just limited to submitting patches, but I think it
> is a good starting point.
> 
> > 
> > Please help me. What do I need to compile, what test do I need to run,
> > which verification tool do I need to employ for this change?
> 
> Right. I have tried to reformulate the problem as "ok I am looking at or I am
> trying to change one or more code lines, so I would like to understand if such
> code lines are tested today and how".
> Right now if we had a s maintained structural coverage report we could tell
> if the impacted code lines are covered and by which tests...I could not find it
> so I guess that so far we are missing it....am I wrong?
> 
> As next step I went to look at the function wrapping the impacted code line
> that in this case is kswapd. I could not find it tested in the Kunit framework.
> 
> As next steps then I would run the available tests in
> https://elixir.bootlin.com/linux/latest/source/tools/testing/selftests
> in conjunction with GCOV trying to figure out if that line is covered already
> somehow.
> 
> There are probably smarter, better, faster ways to elaborate on this...so
> here I just put down what I would do in order to figure this out...
>

Gab, these are GREAT ideas and approaches. So, do we intend to provide 
methods, tools and documentation to really do these things you suggest?

That makes the intensions more tangible to me; if we try to find out 
how we and anyone else can get that information in some 'easy' way.

You can imagine that for a single-line change, you are suggesting probably 
quite some few days of work of investigation to get this information, 
right?


Lukas
