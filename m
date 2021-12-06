Return-Path: <milan.lakhani@codethink.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0D0C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:09:44 +0000 (UTC)
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk
 [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web12.53578.1638806981933980174
 for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 08:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: milan.lakhani@codethink.co.uk)
Received: from [90.200.202.165] (helo=[192.168.0.15])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1muGYc-0002tK-O2; Mon, 06 Dec 2021 16:09:38 +0000
Subject: Re: [linux-safety] [PATCH] fs/ext4: Remove unecessary deadstores
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech, Nghia Le <nghialm78@gmail.com>
References: <20211206150139.5463-1-milan.lakhani@codethink.co.uk>
 <CAKXUXMxHScEHRhQCrz2zoeh4ju=v3RyLSaDXqWUTheFF9XE6RA@mail.gmail.com>
From: Milan Lakhani <milan.lakhani@codethink.co.uk>
Message-ID: <9285640c-042f-478a-46ab-42b5280426c1@codethink.co.uk>
Date: Mon, 6 Dec 2021 16:09:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAKXUXMxHScEHRhQCrz2zoeh4ju=v3RyLSaDXqWUTheFF9XE6RA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <linux-safety.lists.elisa.tech>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <linux-safety@lists.elisa.tech>; Mon, 06 Dec 2021 16:09:44 -0000
X-Groupsio-URL: https://lists.elisa.tech/g/linux-safety/message/268

Thanks, got it, it should still be assigned to entries2.

On 06/12/2021 15:36, Lukas Bulwahn wrote:
> On Mon, Dec 6, 2021 at 4:01 PM Milan Lakhani
> <milan.lakhani@codethink.co.uk> wrote:
> I think you do need to provide a commit message. The change looks
> reasonable, except dropping the assignment to frame->entries.
>
> The commit message should explain why this should be dropped.
>
>> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
>> ---
>>   fs/ext4/namei.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
>> index 52c9bd154122..f341478e9740 100644
>> --- a/fs/ext4/namei.c
>> +++ b/fs/ext4/namei.c
>> @@ -2432,7 +2432,6 @@ static int ext4_dx_add_entry(handle_t *handle, struct ext4_filename *fname,
>>          if (err != -ENOSPC)
>>                  goto cleanup;
>>
>> -       err = 0;
>>          /* Block full, should compress but for now just split */
>>          dxtrace(printk(KERN_DEBUG "using %u of %u node entries\n",
>>                         dx_get_count(entries), dx_get_limit(entries)));
>> @@ -2507,7 +2506,7 @@ static int ext4_dx_add_entry(handle_t *handle, struct ext4_filename *fname,
>>                          /* Which index block gets the new entry? */
>>                          if (at - entries >= icount1) {
>>                                  frame->at = at - entries - icount1 + entries2;
>> -                               frame->entries = entries = entries2;
>> +                               frame->entries;
> This looks strange: you still want to assign frame->entries = entries2, right?
>
>>                                  swap(frame->bh, bh2);
>>                          }
>>                          dx_insert_block((frame - 1), hash2, newblock);
>> @@ -3183,8 +3182,6 @@ int __ext4_unlink(handle_t *handle, struct inode *dir, const struct qstr *d_name
>>                  retval = ext4_mark_inode_dirty(handle, dir);
>>                  if (retval)
>>                          goto out;
>> -       } else {
>> -               retval = 0;
>>          }
>>          if (inode->i_nlink == 0)
>>                  ext4_warning_inode(inode, "Deleting file '%.*s' with no links",
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#266): https://lists.elisa.tech/g/linux-safety/message/266
> Mute This Topic: https://lists.elisa.tech/mt/87541425/4617862
> Group Owner: linux-safety+owner@lists.elisa.tech
> Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [milan.lakhani@codethink.co.uk]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
-- 
Milan Lakhani
Codethink Ltd.
3rd Floor Dale House,
35 Dale Street,
Manchester, M1 2HF
United Kingdom


