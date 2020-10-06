Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web11.9754.1601973098081939640
 for <linux-safety@lists.elisa.tech>;
 Tue, 06 Oct 2020 01:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kPiNi-0002av-Nu; Tue, 06 Oct 2020 09:31:34 +0100
Subject: Re: [linux-safety] [PATCH] usb: host: ehci-sched: avoid possible NULL dereference
To: "development-process@lists.elisa.tech"
 <development-process@lists.elisa.tech>, linux-safety@lists.elisa.tech
References: <20201005213149.12332-1-sudipm.mukherjee@gmail.com>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <3052d0a3-f482-ca91-3ad6-950c5296a92c@codethink.co.uk>
Date: Tue, 6 Oct 2020 09:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201005213149.12332-1-sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi All,

I sent out this patch yesterday which I think is an obvious safety issue
as the error was not handled. This is a change in code and the resultant
binary will not be same. I know we are moving to pcie now, but have we
decided yet how to validate these kinds of changes?


-- 
Regards
Sudip


On 05/10/2020 22:31, Sudip Mukherjee wrote:
> find_tt() can return NULL or the error value in ERR_PTR() and
> dereferencing the return value without checking for the error can
> lead to a possible dereference of NULL pointer or ERR_PTR().
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  drivers/usb/host/ehci-sched.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
> index 6dfb242f9a4b..f3fd7e9fe6b2 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -245,6 +245,8 @@ static void reserve_release_intr_bandwidth(struct ehci_hcd *ehci,
>  	/* FS/LS bus bandwidth */
>  	if (tt_usecs) {
>  		tt = find_tt(qh->ps.udev);
> +		if (IS_ERR_OR_NULL(tt))
> +			return;
>  		if (sign > 0)
>  			list_add_tail(&qh->ps.ps_list, &tt->ps_list);
>  		else
> @@ -1338,6 +1340,8 @@ static void reserve_release_iso_bandwidth(struct ehci_hcd *ehci,
>  		}
>  
>  		tt = find_tt(stream->ps.udev);
> +		if (IS_ERR_OR_NULL(tt))
> +			return;
>  		if (sign > 0)
>  			list_add_tail(&stream->ps.ps_list, &tt->ps_list);
>  		else
> 
