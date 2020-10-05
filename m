Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
 by mx.groups.io with SMTP id smtpd.web11.2204.1601939949602407696
 for <linux-safety@lists.elisa.tech>;
 Mon, 05 Oct 2020 16:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail header.b=PIRoWzXG;
 spf=pass (domain: protonmail.com, ip: 185.70.40.135, mailfrom: hl1998@protonmail.com)
Date: Mon, 05 Oct 2020 23:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1601939947;
	bh=HaX8EWb9AzKpVCX5JpXpeCYdTLapnazuvdbKVj8g+DA=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=PIRoWzXG/J3TnUH9sop0aloO+uU7kCnDrF6wEdYm5GdkAjipX4es9fbFJyG76L1yR
	 6j3gQn1FUs/i3JVHGDwUpmT4BPvevZcxC6hCWCQZbwG1SbdAEvFVEt+TmP0j58dglX
	 dMRUU9nFkEjf1WaksX2N9BL2YSKk/OvjSrGjH9dQ=
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: "Harley A.W. Lorenzo" <hl1998@protonmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Reply-To: "Harley A.W. Lorenzo" <hl1998@protonmail.com>
Subject: Re: [PATCH] usb: host: ehci-sched: avoid possible NULL dereference
Message-ID: <brWYeL8miTAikvEPYFNe2Kpe05OBtiD6yuS6jRg1VCX-lt7ANc1B2y7AM6ECEoG9AJwZP5_5qoGO7POvK0MtruvqG8q8kHbyHiOUIZ72Klk=@protonmail.com>
In-Reply-To: <20201005213149.12332-1-sudipm.mukherjee@gmail.com>
References: <20201005213149.12332-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.7 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, October 5, 2020 5:31 PM, Sudip Mukherjee <sudipm.mukherjee@gmail=
.com> wrote:

> find_tt() can return NULL or the error value in ERR_PTR() and
> dereferencing the return value without checking for the error can
> lead to a possible dereference of NULL pointer or ERR_PTR().

Looks fine to me. There is in fact no checks of the return value
before a dereference here, and this solves that.

Reviewed-by: Harley A.W. Lorenzo <hl1998@protonmail.com
