Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.1969.1603178550861443700
 for <linux-safety@lists.elisa.tech>;
 Tue, 20 Oct 2020 00:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mWISbwIM;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: lukas.bulwahn@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id l16so984212ilj.9
        for <linux-safety@lists.elisa.tech>; Tue, 20 Oct 2020 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=JBzsHTfVPGpoI4rxyRDcv+FuB1OjcaPyDZ9LUIT3nRQ=;
        b=mWISbwIMq49k7l9ndlO0bRXENk8b9KUXnYVIEQ0mAMMixFi7JaLAkbzQCK+QTQk//U
         LlkbrabGPPZ0p/4JVkrQUX3d4DCLwKuZs2OijH4q/FvZ95hYOSugfwqjcCjhju3RY9SA
         JExPjbWlhwt60t1sPtqA1/8xJ7IkgZBnVp7O3vx342p+dveoHOfUtFPlyRaS0XL4mIG5
         nEoV+QXSAEa7YxLhRvLqO9y8UO0s8nj5wx7DSsZt1xlZ2EKp3LypEz3BTw9ww2hCUceE
         40B8Gq4XcBxpJrIwIe9avZZxK9vh5azZcEsHbZWWweInjf0ob7B18PmfvVRyC/wIvOC3
         2KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=JBzsHTfVPGpoI4rxyRDcv+FuB1OjcaPyDZ9LUIT3nRQ=;
        b=pcQCkylyDADHDvr6fDiqXhJ9AK+j5xKtCb/criu4pFDxEBp7EnmcAiwagun5gPwDRv
         3NwNBrPigt/gQy9hDpptnVk2mAoGcug4vd2+tBItjKWFMU3IasqZoMFjwJmYHLxe+oXT
         OzHvVGKNUZnHCTxck/AMM8nqT2i9c+bUS66Kj9Dfjcvp5y6F3/apYdhFhF0j3XuwT8ta
         wmP8LBhl1H/IfJJHEQaAhIfgyr2oHLY2X0HAs8sxzikhw8gxaAB6fMpHO9cWB+DqPqfM
         CNWVLxEIwj8SCbemqkQN8XP3jFH/eITYbQRuFfQs+mBwKN8hsEcESW0/yhcOfLaMPNlt
         ubyQ==
X-Gm-Message-State: AOAM530Vxqf5PZbF+WiZl8uJFxh0dgwoM/DaT+8XvaJlgAKDNgIhggpZ
	qC7AwDHvI6MrjH/Oj6SVgbyxkMqrqeG2Gnhcqtlt47Pr4ZY=
X-Google-Smtp-Source: ABdhPJycrB8UiPBFXZGBJohidWZPS4kH1bocBqTZaYrK6G7Ugc2UnjyVYhbY2B0k0b05cG5AeksjNC8bBK0NTGmVqFo=
X-Received: by 2002:a92:c946:: with SMTP id i6mr994311ilq.199.1603178550000;
 Tue, 20 Oct 2020 00:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201020071952.23794-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201020071952.23794-1-lukas.bulwahn@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Tue, 20 Oct 2020 09:22:19 +0200
Message-ID: <CAKXUXMwKn=cP_1DBjnQP8V+8XcHAx+HgEouwqtvHQs1RW2EvSA@mail.gmail.com>
Subject: Re: [PATCH] x86/unwind: remove unneeded initialization
To: linux-safety@lists.elisa.tech
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 9:20 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> make clang-analyzer on x86_64 defconfig caught my attention with:
>
>   arch/x86/kernel/unwind_orc.c:38:7: warning: Value stored to 'mid' during
>   its initialization is never read [clang-analyzer-deadcode.DeadStores]
>           int *mid = first, *found = first;
>                ^
>
> Commit ee9f8fce9964 ("x86/unwind: Add the ORC unwinder") introduced
> __orc_find() with this unneeded dead-store initialization.
>
> Put the variable in local scope and initialize only once the value is
> needed to make clang-analyzer happy.
>
> As compilers will detect these unneeded assignments and optimize this
> anyway, the resulting object code is effectively identical before and
> after this change.
>
> No functional change. Effectively, no change to object code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---


Please help me with your review.

Also help by compiling and comparing the disassembly before and after
with your compiler.


>  arch/x86/kernel/unwind_orc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index 6a339ce328e0..5c64eed08257 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -35,7 +35,7 @@ static struct orc_entry *__orc_find(int *ip_table, struct orc_entry *u_table,
>  {
>         int *first = ip_table;
>         int *last = ip_table + num_entries - 1;
> -       int *mid = first, *found = first;
> +       int *found = first;
>
>         if (!num_entries)
>                 return NULL;
> @@ -47,7 +47,7 @@ static struct orc_entry *__orc_find(int *ip_table, struct orc_entry *u_table,
>          * ignored when they conflict with a real entry.
>          */
>         while (first <= last) {
> -               mid = first + ((last - first) / 2);
> +               int *mid = first + ((last - first) / 2);
>
>                 if (orc_ip(mid) <= ip) {
>                         found = mid;
> --
> 2.17.1
>
