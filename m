Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web11.10025.1604658335275807186
 for <linux-safety@lists.elisa.tech>;
 Fri, 06 Nov 2020 02:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: sudip.mukherjee@codethink.co.uk)
Received: from host-92-5-241-147.as43234.net ([92.5.241.147] helo=[192.168.1.13])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1kayvz-00071a-Sl; Fri, 06 Nov 2020 10:25:31 +0000
Subject: Re: [linux-safety] [PATCH] taskstats: remove unneeded dead assignment
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Balbir Singh <bsingharora@gmail.com>
Cc: Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
 linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org
References: <20201106062210.27920-1-lukas.bulwahn@gmail.com>
From: "Sudip Mukherjee" <sudip.mukherjee@codethink.co.uk>
Message-ID: <6ab2415b-0642-16ee-4be0-c909e07e7565@codethink.co.uk>
Date: Fri, 6 Nov 2020 10:25:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106062210.27920-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Lukas,

On 06/11/2020 06:22, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
> 
>   kernel/taskstats.c:120:2: warning: Value stored to 'rc' is never read \
>   [clang-analyzer-deadcode.DeadStores]
>           rc = 0;
>           ^
> 
> Commit d94a041519f3 ("taskstats: free skb, avoid returns in
> send_cpu_listeners") made send_cpu_listeners() not return a value and
> hence, the rc variable remained only to be used within the loop where
> it is always assigned before read and it does not need any other
> initialisation.
> 
> So, simply remove this unneeded dead initializing assignment.

Might be better to remove 'rc' completely as it is only used for the if
condition now.

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index a2802b6ff4bb..63541f1ae04a 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -113,11 +113,10 @@ static void send_cpu_listeners(struct sk_buff *skb,
        struct listener *s, *tmp;
        struct sk_buff *skb_next, *skb_cur = skb;
        void *reply = genlmsg_data(genlhdr);
-       int rc, delcount = 0;
+       int delcount = 0;

        genlmsg_end(skb, reply);

-       rc = 0;
        down_read(&listeners->sem);
        list_for_each_entry(s, &listeners->list, list) {
                skb_next = NULL;
@@ -126,8 +125,8 @@ static void send_cpu_listeners(struct sk_buff *skb,
                        if (!skb_next)
                                break;
                }
-               rc = genlmsg_unicast(&init_net, skb_cur, s->pid);
-               if (rc == -ECONNREFUSED) {
+               if (genlmsg_unicast(&init_net, skb_cur, s->pid) ==
+                   -ECONNREFUSED) {
                        s->valid = 0;
                        delcount++;
                }




-- 
Regards
Sudip
