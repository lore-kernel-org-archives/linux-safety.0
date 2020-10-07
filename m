Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.3825.1602084256286392143
 for <linux-safety@lists.elisa.tech>;
 Wed, 07 Oct 2020 08:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vK7q1RY3;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id e17so2648692wru.12
        for <linux-safety@lists.elisa.tech>; Wed, 07 Oct 2020 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9fZtNueIKa1HonbojTUuFEHA3Qjc+wNXpiWwCGdSRok=;
        b=vK7q1RY3f0TWa5MN6WxRKfIlZGN25DpQ5+088RPNAZbjbYhGezt/0RWRtW+0/Fg49a
         +tOdjU+9QgwsoDG5dgzQqVAfIJTO61hiBoVNw1PJXYr6DJ8zYRknWXI6jqmdvNTBQr/Q
         KUNST5SqMdBYYpcHRj1mH14BROSTD/HxappTUVaEbPgXTdMeqcJ4hNMphB+EUINIhXOL
         O955hN9/O3KJowrq2KG2YUSMVHgkZOhoVnzxzFgp97vf+UB5ugI379g0ntuB3THVI3Fo
         7XIt8BwSZPaHwCDjczD2vT2J50j4pd7jJfL6MQytVELw4TJVAhjif0ohavtCfc+4ZydV
         qffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9fZtNueIKa1HonbojTUuFEHA3Qjc+wNXpiWwCGdSRok=;
        b=o3kDbJsbziEyxa/U9D2nl8FGv0vAOXZqvulR2sW/WlQtOFfjqyJEJje4qoKJ2kN3Sq
         Ul/rgkmmePpk7UZ5mRHSYgOk3KZPFOa6JAnxHhCSkAMYiYbqKOVQGjPjxVPa2rzrYKyo
         qFVI7qhaU/4+dUQCVVnBJ6NBSiZZpzTbyYfy4TExBfjEA93zHTsO6PC3+f8oCdMIuUPT
         6twdz5iLW+s2P3AsUwN9s3Mthv+bRX/YZEjsdE+gs9nv+zv6aA3XBnqCOWtn3pAr7U1I
         Tzf8sHl8oIeVB6mQ78hNuRj8BVR+zpkqc+BI+PusR8vf5UHQUUIxl8V2FAO0tHwt6os8
         bwqA==
X-Gm-Message-State: AOAM531plQ9JCvyprdfKDHeyZOmn72mCzo44cdez5TJndMmyXOqEk0qk
	Z5erx8Mc+yiRhNd4k0OsUsM=
X-Google-Smtp-Source: ABdhPJwUld/XygEX1hTNO+qWq9Mc1WE1opsxETj+NlwHC3C1dbCijY44BsjTyuOzuBVPl4aH9Q/1mw==
X-Received: by 2002:adf:de11:: with SMTP id b17mr4129147wrm.82.1602084254649;
        Wed, 07 Oct 2020 08:24:14 -0700 (PDT)
Return-Path: <sudipm.mukherjee@gmail.com>
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id d30sm3562742wrc.19.2020.10.07.08.24.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2020 08:24:13 -0700 (PDT)
From: sudipm.mukherjee@gmail.com
To: Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>
Cc: linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	linux-fsdevel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2] kernel/sysctl.c: drop unneeded assignment in proc_do_large_bitmap()
Date: Wed,  7 Oct 2020 16:19:04 +0100
Message-Id: <20201007151904.20415-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0

The variable 'first' is assigned 0 inside the while loop in the if block
but it is not used in the if block and is only used in the else block.
So, remove the unneeded assignment and move the variable in the else block.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

v1: only had the removal of assignment

The resultant binary stayed same after this change. Verified with
md5sum which remained same with and without this change.

$ md5sum kernel/sysctl.o 
77e8b8f3cd9da4446e7f117115c8ba84  kernel/sysctl.o

 kernel/sysctl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index ce75c67572b9..cc274a431d91 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1423,7 +1423,6 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
 			 void *buffer, size_t *lenp, loff_t *ppos)
 {
 	int err = 0;
-	bool first = 1;
 	size_t left = *lenp;
 	unsigned long bitmap_len = table->maxlen;
 	unsigned long *bitmap = *(unsigned long **) table->data;
@@ -1508,12 +1507,12 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
 			}
 
 			bitmap_set(tmp_bitmap, val_a, val_b - val_a + 1);
-			first = 0;
 			proc_skip_char(&p, &left, '\n');
 		}
 		left += skipped;
 	} else {
 		unsigned long bit_a, bit_b = 0;
+		bool first = 1;
 
 		while (left) {
 			bit_a = find_next_bit(bitmap, bitmap_len, bit_b);
-- 
2.11.0
