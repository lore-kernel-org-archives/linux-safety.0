Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.5249.1602654791394691442
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 22:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MwdDlAH7;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id n6so2176682wrm.13
        for <linux-safety@lists.elisa.tech>; Tue, 13 Oct 2020 22:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=wuyxCGamUFvmw7YOi9trNnJISoiZ38j4XJL2auT9/v4=;
        b=MwdDlAH77uY++sH3wMTjL5pWcWU1PVKBz8i76vGuzcrng0TgBvwshofJomJvr9EOxO
         Odc9/benC8t/jkYSoyBxwbaIDycaTUxK8WQveGy1L+YYtWNvUmFhUJ+UNRf6eTTYMUFK
         dQo6M51cuadZ8AUt3dLaao9XotEl/c+sV1i3lI96vF9DtjqbS9AeLqxIvf4y4xpUKkYx
         jrR81mjxQOO1+1JB8CSNqJ8gi9915JOCRkoVJnjSzoLukJDVAXpbjAZyG/52Nw17zgNV
         e8/+9yIxgrGs5hBQLhX190+/GA1UTFWJEUAolThmqqj5NkTrlHBdQMc3X3H5EcQjJlHE
         Solg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=wuyxCGamUFvmw7YOi9trNnJISoiZ38j4XJL2auT9/v4=;
        b=VHpebMtlnHg2Moyciq2iW1oogtUQLEc4cwFaNFflJ2Z4ACiD073y7pgKFSqHrEJRGg
         /FyswLUKbGitftz5KBD/a6tqMm57tu2N0Kymn1i6U1ofoBy9QGQdKpqXj0cdRkGm1Yyq
         m02Oatzrx0vjDJeUNhmDHf6j55fGsEwebiUhTiAjTHKce0YqcTe6KpekCmoQqwtDz/j9
         +quLo1OuBub2xzLgTOhzs1B93c51Kd4lhyEChjJ33aIyy2Pxyj8yaqxCMu7ThFMeQtCv
         Kpon77f4bzgYJqWAj9fMLUCzvzlrusdVRixHLXQ4abyKJZ45ueTQ9/L+KP2ZilVhWLLc
         969Q==
X-Gm-Message-State: AOAM5301Mlc/oQzbuf8LIilVWe3+j+qYSCMhTv4ipE0nT7/HsqVSSqZK
	yFzdmvTlr6d//YCztAAVkDs=
X-Google-Smtp-Source: ABdhPJw01tWOEU1TFqe1Wjy2lphkmvJQGxbbXDcZxtgJZ4CR4yjT/fvrpN0gnWnI36Xh9nCzGB48iA==
X-Received: by 2002:adf:9027:: with SMTP id h36mr3311993wrh.163.1602654789811;
        Tue, 13 Oct 2020 22:53:09 -0700 (PDT)
Return-Path: <lukas.bulwahn@gmail.com>
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
        by smtp.gmail.com with ESMTPSA id y14sm1841113wma.48.2020.10.13.22.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 22:53:09 -0700 (PDT)
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 07:53:08 +0200 (CEST)
X-X-Sender: lukas@felia
To: "Paoloni, Gabriele" <gabriele.paoloni@intel.com>
cc: linux-safety@lists.elisa.tech
Subject: Re: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
In-Reply-To: <20201013094938.356837-3-gabriele.paoloni@intel.com>
Message-ID: <alpine.DEB.2.21.2010140748000.6186@felia>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com> <20201013094938.356837-3-gabriele.paoloni@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 13 Oct 2020, Paoloni, Gabriele wrote:

> In the current implementation if the input flag is 0
> oops_in_progress is unconditionally decremented, thus allowing
> to become a negative number. Since right now oops_in_progress
> is a global variable used in the kernel as a conditional flag
> to check if oops, panic(), BUG() or die() is in progress the
> current unconditional decrement may lead to unexpected behavior
> in the Kernel paths conditionally executing over this flag.
> 
> This patch only decrement oops_in_progress if it is non zero
> 
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> ---
>  lib/bust_spinlocks.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> index 594b270161d9..842633ac9130 100644
> --- a/lib/bust_spinlocks.c
> +++ b/lib/bust_spinlocks.c
> @@ -23,6 +23,9 @@
>   * @yes: input flag; if zero decreases oops_in_progress,
>   * otherwise increases it.
>   *
> + * Note: if oops_in_progress is already 0 it will not
> + * be decreased
> + *
>   */
>  void bust_spinlocks(int yes)
>  {
> @@ -33,7 +36,9 @@ void bust_spinlocks(int yes)
>  		unblank_screen();
>  #endif
>  		console_unblank();
> -		if (--oops_in_progress == 0)
> +		if (oops_in_progress)
> +			oops_in_progress--;
> +		if (!oops_in_progress)
>  			wake_up_klogd();

I did not get the original motivation stated above.

But I believe you meant:

'I think there is race condition here (before this patch).'

So do something in this patch: 'And now the race condition is gone?'


I think:

'The could be a race condition before, and probably the race condition is 
still there after this patch.'

But maybe I did even get the intent of this patch in the first place...

Lukas
