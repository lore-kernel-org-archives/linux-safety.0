Return-Path: <bounce+72012+268+5278000+9232812@lists.elisa.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6231C433F5
	for <linux-safety@archiver.kernel.org>; Mon,  6 Dec 2021 16:09:43 +0000 (UTC)
X-Received: by 127.0.0.2 with SMTP id oTfbYY5279335xt8xPuaOBco; Mon, 06 Dec 2021 08:09:43 -0800
X-Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web12.53578.1638806981933980174
 for <linux-safety@lists.elisa.tech>;
 Mon, 06 Dec 2021 08:09:42 -0800
X-Received: from [90.200.202.165] (helo=[192.168.0.15])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1muGYc-0002tK-O2; Mon, 06 Dec 2021 16:09:38 +0000
Subject: Re: [linux-safety] [PATCH] fs/ext4: Remove unecessary deadstores
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-safety@lists.elisa.tech, Nghia Le <nghialm78@gmail.com>
References: <20211206150139.5463-1-milan.lakhani@codethink.co.uk>
 <CAKXUXMxHScEHRhQCrz2zoeh4ju=v3RyLSaDXqWUTheFF9XE6RA@mail.gmail.com>
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
Message-ID: <9285640c-042f-478a-46ab-42b5280426c1@codethink.co.uk>
Date: Mon, 6 Dec 2021 16:09:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxHScEHRhQCrz2zoeh4ju=v3RyLSaDXqWUTheFF9XE6RA@mail.gmail.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-safety+unsubscribe@lists.elisa.tech>
List-Subscribe: <mailto:linux-safety+subscribe@lists.elisa.tech>
List-Help: <mailto:linux-safety+help@lists.elisa.tech>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: Ps4ZOrWcgtY4ITOHY2qRBHR2x5278000AA=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1638806983;
 bh=IN/CkGnk3VOOjm9ggvPfHFM9jPaqYJfZU32xFcjE/zU=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=mCT9GdjxlY9YAe/uNQuSEKsHgi7tMk+xkmnderzs9pDsqF6Mpo17dqNbWBFMx/xmFlE
 Di8XKzMtAB6mcfDiFL9z67n7n4rUxbY/Ht80qmSmliU6C4J8hMy8tGrl3IyzFk38N2SJk
 9Xz6gDpKFwqlnhXeR4wuXRIS6PKTohfbEts=
Message-ID: <20211206160938.qLxpwS8GKY56FJAARTm2LsdGocr9MrtXw8AhcFuAeSg@z>

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
>> @@ -2432,7 +2432,6 @@ static int ext4_dx_add_entry(handle_t *handle, str=
uct ext4_filename *fname,
>>          if (err !=3D -ENOSPC)
>>                  goto cleanup;
>>
>> -       err =3D 0;
>>          /* Block full, should compress but for now just split */
>>          dxtrace(printk(KERN_DEBUG "using %u of %u node entries\n",
>>                         dx_get_count(entries), dx_get_limit(entries)));
>> @@ -2507,7 +2506,7 @@ static int ext4_dx_add_entry(handle_t *handle, str=
uct ext4_filename *fname,
>>                          /* Which index block gets the new entry? */
>>                          if (at - entries >=3D icount1) {
>>                                  frame->at =3D at - entries - icount1 + =
entries2;
>> -                               frame->entries =3D entries =3D entries2;
>> +                               frame->entries;
> This looks strange: you still want to assign frame->entries =3D entries2,=
 right?
>
>>                                  swap(frame->bh, bh2);
>>                          }
>>                          dx_insert_block((frame - 1), hash2, newblock);
>> @@ -3183,8 +3182,6 @@ int __ext4_unlink(handle_t *handle, struct inode *=
dir, const struct qstr *d_name
>>                  retval =3D ext4_mark_inode_dirty(handle, dir);
>>                  if (retval)
>>                          goto out;
>> -       } else {
>> -               retval =3D 0;
>>          }
>>          if (inode->i_nlink =3D=3D 0)
>>                  ext4_warning_inode(inode, "Deleting file '%.*s' with no=
 links",
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>>
>
>=20
>
>
>
--=20
Milan Lakhani
Codethink Ltd.
3rd Floor Dale House,
35 Dale Street,
Manchester, M1 2HF
United Kingdom



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#268): https://lists.elisa.tech/g/linux-safety/message/2=
68
Mute This Topic: https://lists.elisa.tech/mt/87541425/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@ar=
chiver.kernel.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


