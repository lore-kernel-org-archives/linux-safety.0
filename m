Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.6730.1602744287131153360
 for <linux-safety@lists.elisa.tech>;
 Wed, 14 Oct 2020 23:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J9ov0pWC;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id q25so2995351ioh.4
        for <linux-safety@lists.elisa.tech>; Wed, 14 Oct 2020 23:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zDxHSw7rj6gp8XDMau4yPKwc3CfsNbmZV23spzUJJb4=;
        b=J9ov0pWCdoTNGZddUDt/EmHBi+L7hwKytmYOF6PDrtRsv9cW4Wpo4CSPVEaUSz/Mi0
         U5YOzLedzj1yEEA6EwG+GNoT87gbNHtDv9y6W6AEqPZMwtyjmDjadd6VepY+1W3TIh0g
         x+OZP5gJ3fvlcD02S1RQmnFM1L5TFEsl1vc7QpFcnxyEVS0THhPtmWFA38gsg+RkM4no
         J5sniwiOZPqwByuDrJvhOP9hNhvacjZIZlWj3x+f+3jmWdVh+luiUpL78kitHsz1rMJ5
         fpmusD3IyuDYyLNbSMbNdfvaS6xzqT6jofAtgRhdikWXT+ukfedsBhLFuGUyBePt3Wt7
         a4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zDxHSw7rj6gp8XDMau4yPKwc3CfsNbmZV23spzUJJb4=;
        b=WpagidPnyWrjWElkFiOPVvhco8c7/GEU9dOhwco7R+nMCO42TcRFFEwdwbGYPKOJGK
         9o8TOxTi5FiidOa7Pg6s51ulEtM8s1r6pmXs/Hwj5E9Mu7d4OSRsA+B/Ee6l7gSfPS9l
         GEgDbCjOlop13ctrnzg7hqnchf5DpHfHmZq15vcSkZK0oAL61cbDiopBDQdwTiWEohs2
         bDYey790ayWwcTVflXTEEnJ7Y518Z9QQJkpJbqnOmuFaI9jiDIVYQTs5McXcX1dCHj6U
         DJenMy37SM0pwnftdXX7VLUwCr6CH+8Csz9s6bYQP68ADeODeQDCK0X9GfmCd4Qy4MBo
         CxXg==
X-Gm-Message-State: AOAM532P25nXuRLTbklCUDgipZmPrJsTHh/KcylKAIdVG9DoJ09OlxOf
	xM64nrM5TfLcPY4PtzSaTcktsH01Hp/1wU8uB4Q=
X-Google-Smtp-Source: ABdhPJz8AWMmgy7h8T8GhFvyQ7uZ3IabZhbzgXysT9zbCpQgYd/ue7P1bzsH7JfMH1MuC7/UX3aFA/vHREjMQ9Fv6Zs=
X-Received: by 2002:a5d:8e12:: with SMTP id e18mr1946097iod.99.1602744286453;
 Wed, 14 Oct 2020 23:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <20201013094938.356837-3-gabriele.paoloni@intel.com> <alpine.DEB.2.21.2010140748000.6186@felia>
 <MN2PR11MB4158AB45198CAE0BD2EBFA0188050@MN2PR11MB4158.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB4158AB45198CAE0BD2EBFA0188050@MN2PR11MB4158.namprd11.prod.outlook.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Thu, 15 Oct 2020 08:44:35 +0200
Message-ID: <CAKXUXMwb3c58Qc1vYQe6WsddUAnKgQmV2vhM1TuiQpEZtWmpSQ@mail.gmail.com>
Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
Cc: "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 2:05 PM Paoloni, Gabriele
<gabriele.paoloni@intel.com> wrote:
>
> Hi Lukas
>
> > -----Original Message-----
> > From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Sent: Wednesday, October 14, 2020 7:53 AM
> > To: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> > Cc: linux-safety@lists.elisa.tech
> > Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not
> > decrement oops_in_progress unconditionally
> >
> >
> >
> > On Tue, 13 Oct 2020, Paoloni, Gabriele wrote:
> >
> > > In the current implementation if the input flag is 0
> > > oops_in_progress is unconditionally decremented, thus allowing
> > > to become a negative number. Since right now oops_in_progress
> > > is a global variable used in the kernel as a conditional flag
> > > to check if oops, panic(), BUG() or die() is in progress the
> > > current unconditional decrement may lead to unexpected behavior
> > > in the Kernel paths conditionally executing over this flag.
> > >
> > > This patch only decrement oops_in_progress if it is non zero
> > >
> > > Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> > > ---
> > >  lib/bust_spinlocks.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> > > index 594b270161d9..842633ac9130 100644
> > > --- a/lib/bust_spinlocks.c
> > > +++ b/lib/bust_spinlocks.c
> > > @@ -23,6 +23,9 @@
> > >   * @yes: input flag; if zero decreases oops_in_progress,
> > >   * otherwise increases it.
> > >   *
> > > + * Note: if oops_in_progress is already 0 it will not
> > > + * be decreased
> > > + *
> > >   */
> > >  void bust_spinlocks(int yes)
> > >  {
> > > @@ -33,7 +36,9 @@ void bust_spinlocks(int yes)
> > >             unblank_screen();
> > >  #endif
> > >             console_unblank();
> > > -           if (--oops_in_progress == 0)
> > > +           if (oops_in_progress)
> > > +                   oops_in_progress--;
> > > +           if (!oops_in_progress)
> > >                     wake_up_klogd();
> >
> > I did not get the original motivation stated above.
> >
> > But I believe you meant:
> >
> > 'I think there is race condition here (before this patch).'
> >
> > So do something in this patch: 'And now the race condition is gone?'
> >
> >
> > I think:
> >
> > 'The could be a race condition before, and probably the race condition is
> > still there after this patch.'
> >
> > But maybe I did even get the intent of this patch in the first place...
>
> What I meant is the following scenario:
> Let's assume oops_in_progress = 0, then we have
>
> func_a()
> {
>         bust_spinlocks(0);
> }
>
> In this case after the call, with the current implementation oops_in_progress = -1; that is not acceptable...
>

Okay, but that is just the contract of this bust_spinlocks() function, right?

As you wrote every caller must call bust_spinlocks(1) and ONLY then
when they are done bust_spinlocks(0) [if the machine has not
halted...].

Maybe if the functions would be bust_spinlocks_{en,dis}able() or
bust_spinlocks_{start,stop}() the contract is more clear. But in the
end, there are only a few users as far as see, in fault, panic, etc.

Of course, if you call bust_spinlocks_stop() before start() bad things
happen... use a static analyzer/model checker to see that that pattern
never appears :)

As I said, the patch looks good; I am looking forward to the feedback.

Lukas
