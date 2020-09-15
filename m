Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.14370.1600179263058218781
 for <linux-safety@lists.elisa.tech>;
 Tue, 15 Sep 2020 07:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=GuR0sB3T;
 spf=softfail (domain: mab-labs.com, ip: 209.85.161.42, mailfrom: mab@mab-labs.com)
Received: by mail-oo1-f42.google.com with SMTP id r4so784197ooq.7
        for <linux-safety@lists.elisa.tech>; Tue, 15 Sep 2020 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4akvzICOvVCYeXoGV08jGSvGDKcf4dGWOQEbkxa+AQI=;
        b=GuR0sB3TrR43W7k+9KyB5kGnh++MrqIqte6/C8p/RsGg473NUMWCamHLZ7sI4mEQ9r
         AKL59EdnCk7f+lPFkKgDhB//Ve4nyIjoTj70j5yGUVKzUsUteQZl8vCeZItw/M2oq9mK
         nGJ7jqnFSnnGQRp2ydfjeuJQ26fqeOnp43SdIYjImqI3v63qNUGF4Cx+NKi1jboZfVdn
         UADXDuM+oJSFpytZk5JcDXb8zENSNgbwrYfBi0MdfHgUmL7WwY5GdsaA9dOfO9Fm8ly3
         QGU2qGOWi7jRgmqX1havQ6cmJYE7dso7S53LdDQuh4VUW5RpeD+7b+ouRUrQTJC5dxtd
         OI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4akvzICOvVCYeXoGV08jGSvGDKcf4dGWOQEbkxa+AQI=;
        b=VY621sBUZwX2+YJNfGapzWCHSsE7UEp60yjwnX26x4jO0qM16hHVEL3OD3KDLCoKYU
         sEvzgO41s93Yz//w4QVOdFueeVJ1dCM8RWFplPV+9HfZgER/yIOuX+JxCKyo6MN6oWwh
         Sud2+Chm8fAt1ZajIBg6I9iJn/IxOqDGdNOYWcQSwn74thCYT/ooreMdRG34tWqcTTEZ
         aQsAdgUaxnwYjzWBnaAwaXIOUEWqAJbTeE0ETWDqQwwbTBc2h4p6l9J68Ze9EO62m4ZN
         UEOj1f/Y9Z3DOTctnrhvsTvsktl/OJwWyY6GVZn1b7krh+EK6CUVeWPE7TjJpq1Xs9Qy
         XsgQ==
X-Gm-Message-State: AOAM5317f/kjonaNJFgDH1of+yjfFAhRKR9kk4DkZv7+mJxVjqbY9x47
	39NdLtoXSs+ioyJrAZsc3VniiOYmU6/HfNc6lPXWSg==
X-Google-Smtp-Source: ABdhPJxiSa/o5F++S9KYhaypuoLZsMkBKt79F9Nxw37PPajxR1CZ6MtwacDirOkVRbNYrU8jobvHf2TR0Py1XUxxQWY=
X-Received: by 2002:a4a:ea99:: with SMTP id r25mr14512822ooh.15.1600179262285;
 Tue, 15 Sep 2020 07:14:22 -0700 (PDT)
MIME-Version: 1.0
From: "Mohammed Billoo" <mab@mab-labs.com>
Date: Tue, 15 Sep 2020 10:14:11 -0400
Message-ID: <CALkjhPrjj1ZZ3wbuf6fuUKTCMq1Y_hLXwhi4B_nLx_AD6Enx5Q@mail.gmail.com>
Subject: Kernel branch link?
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"

Shuah,

Can you send the link to your linux kernel branch (or a branch you
think makes sense for us to base our work off of)? I will use that as
the basis/reference for the Docker container.

Thanks
-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022
