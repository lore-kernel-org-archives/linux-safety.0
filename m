Return-Path: <SRS0=tsuv=PX=lists.elisa.tech=bounce+72012+262+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBB7C433F5
	for <linux-safety@archiver.kernel.org>; Thu,  4 Nov 2021 06:50:32 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F043F60232
	for <linux-safety@archiver.kernel.org>; Thu,  4 Nov 2021 06:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F043F60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id 1w08YY5279335xIQUqzZH694; Wed, 03 Nov 2021 23:50:31 -0700
X-Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web08.8146.1636008630981790956
 for <linux-safety@lists.elisa.tech>;
 Wed, 03 Nov 2021 23:50:31 -0700
X-Received: by mail-yb1-f172.google.com with SMTP id v7so12352848ybq.0
        for <linux-safety@lists.elisa.tech>; Wed, 03 Nov 2021 23:50:30 -0700 (PDT)
X-Gm-Message-State: KVq9poEoiuDbr20AmkKoZyyPx5278000AA=
X-Google-Smtp-Source: ABdhPJxfOrAbXdUpPLp9ArufFHpJ2XU++lTUHPDUJ4M25X6WX5vPmqDvtJaxt65HnOvGiv+HdqDRtW1j/ZelhDXfg2M=
X-Received: by 2002:a25:34d5:: with SMTP id b204mr41535991yba.154.1636008629986;
 Wed, 03 Nov 2021 23:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211103232722.30999-1-nghialm78@gmail.com>
In-Reply-To: <20211103232722.30999-1-nghialm78@gmail.com>
From: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Date: Thu, 4 Nov 2021 07:50:18 +0100
Message-ID: <CAKXUXMx9kvY7g8VRsNfZPZ-8=EpCoGOsK7igHqjNQfJO4UwGBA@mail.gmail.com>
Subject: Re: [linux-safety] [PATCH] ipv6: remove useless assignment to newinet in tcp_v6_syn_recv_sock()
To: Nghia Le <nghialm78@gmail.com>
Cc: linux-safety@lists.elisa.tech
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1636008631;
 bh=2KJybLn/eZgWwqJbPGiTW6uL2JCfU0KGliHY5HYSoXY=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=iUTnxRCAn+OTfvOUuS5/G8Xk/WIKO7fIT9Ej7tRAGIt1tyN4TbkiixhIWNznvi4oZCN
 Qt3NFSU3Rmi9x9fc61VMDIs1BI8OeAjuo26e2PQ/gh1FhgWccbFIP9EWITk4UxUpiOh+j
 Nhx/mGlHG4zShPPhFPsyZGKcoJEyNPjGigQ=
Message-ID: <20211104065018.tCNqGb8GZStPxpUvoMikzcPeaen3NOf1F5dB91cQhe0@z>

On Thu, Nov 4, 2021 at 12:28 AM Nghia Le <nghialm78@gmail.com> wrote:
>
> The newinet value is initialized with inet_sk() in a block code starting
> from checking condition of protocol to exiting by returning newsk
> structure. Along the code path, newinet is never read. Thus, assignment
> to newinet is wredundant and can be removed.
>

Just a bit improving your English:

s/in a block code starting from checking condition of protocol to
exiting by returning newsk structure/in a block code to handle sockets
for the ETH_P_IP protocol/

s/Along the code path/Along this code path/

s/wredundant/redundant/

I would prefer "needless" or "useless" to "redundant", but all words are okay.

Lukas

> Signed-off-by: Nghia Le <nghialm78@gmail.com>
> ---
>  net/ipv6/tcp_ipv6.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index 2cc9b0e53ad1..551fce49841d 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -1263,7 +1263,6 @@ static struct sock *tcp_v6_syn_recv_sock(const struct sock *sk, struct sk_buff *
>
>                 inet_sk(newsk)->pinet6 = tcp_inet6_sk(newsk);
>
> -               newinet = inet_sk(newsk);
>                 newnp = tcp_inet6_sk(newsk);
>                 newtp = tcp_sk(newsk);
>
> --
> 2.25.1
>


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#262): https://lists.elisa.tech/g/linux-safety/message/262
Mute This Topic: https://lists.elisa.tech/mt/86805127/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


