Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.10077.1600211034134331688
 for <linux-safety@lists.elisa.tech>;
 Tue, 15 Sep 2020 16:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mab-labs.com header.s=google header.b=UvNmOV+s;
 spf=softfail (domain: mab-labs.com, ip: 209.85.210.45, mailfrom: mab@mab-labs.com)
Received: by mail-ot1-f45.google.com with SMTP id o6so4931477ota.2
        for <linux-safety@lists.elisa.tech>; Tue, 15 Sep 2020 16:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=EDd8HnCID1wbQbzVVPaJfggo7o8VL95+Se/qeGIN3rY=;
        b=UvNmOV+sRtdqQ/9n3dsUdIvJeGoaAkhC5LuqBsBJGPT6j+Qh5cv+J1MTBaK39RJiWP
         MfZTlBrQDr6mts4pDfLRVoMye+0rf+1Jv5VxfbQMCjtxvCPpWnDZCpietwPKV9hmOJTj
         8+++X3aH1TzJ0zBU6K8ons6eS2/4YPB12C2967fe2t3Luv6F1V+aa7YIS66KqIgQS5uJ
         Khqb1nXiwrSU5AMllcS75kT10alagdCWh1ErUkHl53nDPBAFcZZUA3b/IqS3qR+I9fTH
         3btSxwms8e4ehTiVvS6Y5Kg5jp9x8W1B0u47yVwLB0knkgPZT5BcyajD/wo1PVOHbsti
         ox9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=EDd8HnCID1wbQbzVVPaJfggo7o8VL95+Se/qeGIN3rY=;
        b=XTueu8YFkyCxk5Fy1CiVcyQvL6Ij3ACtvDe7SLX9FFcRfSuBqRjFqW+YR41TRc6cTx
         nlLFu5c8iLK5yoB1pHVpsEcsFXeb0iD/Sb7P4EFa2vYJVNTM4qCBIrcFO2/bLRwUZrXW
         jdGXCjPIn7lP2AP/a2ooZsHLysJ9hj1RCo8I3KUVXKuIqu0HOmhNwxOyFbaY58LApQV0
         8RcR2yrn7ukgF2WESPsCCe5O03BieDq1LWIRRVUAU5GS04/FOLrzxxcX4XA5Hqhq+L6x
         uEjdKHcsRvf/xvnzK198mlX3nREkZG2apdSjSAodx+oHKkNPF01msNwmKpLClwlVlSdy
         r0YQ==
X-Gm-Message-State: AOAM533OBU5rCfJ4Sbr/dCcol8UvVFGDG5ZwefyzmXqVKsij/lTr/CIj
	iYzIv1YGC2V6Pqfpp4tdhOaep6uaAN7M8LnmXrHK3VkuXrnLLw==
X-Google-Smtp-Source: ABdhPJwxd9b8To5/dS635qicFjhqc5f2MmYiW5IfxA+I0Rnw47DHvDSSAjceFrZ9Z34C1cYTY3O7iv97FjzvydqMN14=
X-Received: by 2002:a05:6830:4b7:: with SMTP id l23mr15117086otd.296.1600211033099;
 Tue, 15 Sep 2020 16:03:53 -0700 (PDT)
MIME-Version: 1.0
From: "Mohammed Billoo" <mab@mab-labs.com>
Date: Tue, 15 Sep 2020 19:03:42 -0400
Message-ID: <CALkjhPoHqB330YO6uFOO3SnHShvF83xMkzzTp5HGnW-XVyJ3GA@mail.gmail.com>
Subject: Docker container for ELISA
To: linux-safety@lists.elisa.tech
X-Groupsio-MsgNum: 24
Content-Type: multipart/mixed; boundary="000000000000320df605af622add"

--000000000000320df605af622add
Content-Type: text/plain; charset="UTF-8"

All,

Attached are the files needed to build a Docker container to support
the following tested operations against the latest-ish master (I need
to test it against Shuah's branch):

- checkpatch
- coccicheck
- sparse
- make menuconfig
- make (against the default x86 config)

To build the container, download the attached files to a location on
your local machine and run:
docker build -t elisa-kernel-builder . (the dot at the end is important)

Then checkout  Shuah's kernel to your local machine, cd to that
directory, and do the following:
$> docker run --rm -it -v $PWD:/opt/elisa/kernel -w /opt/elisa/kernel
elisa-kernel-builder <command>

where <command> can be any of the available commands to operate on the
kernel. For example, if I wanted to configure my checkout using the
docker container, I would do:
$> docker run --rm -it -v $PWD:/opt/elisa/kernel -w /opt/elisa/kernel
elisa-kernel-builder make menuconfig

To pass environment variables specify "-e VARNAME=VARVAL". For
example, if I wanted to run just my cocci script:
$> docker run --rm -it -v $PWD:/opt/elisa/kernel -w /opt/elisa/kernel
-e COCCI=scripts/coccinelle/misc/magic_numbers.cocci
elisa-kernel-builder make coccicheck MODE=report

Please continue to hammer away and test the container with other
workflows and find bugs/issues, since I banged this out in a few hours
and didn't thoroughly test this (I wanted to get this out before I
leave for the day).

We still need to figure out how to source control this.
-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022

--000000000000320df605af622add
Content-Type: application/octet-stream; name=Dockerfile
Content-Disposition: attachment; filename=Dockerfile
Content-Transfer-Encoding: base64
Content-ID: <f_kf4kbf1g0>
X-Attachment-Id: f_kf4kbf1g0

RlJPTSB1YnVudHU6MTguMDQKCkFSRyBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUKClJV
TiBhcHQtZ2V0IHVwZGF0ZSAmJiBhcHQtZ2V0IGluc3RhbGwgLXkgXAogICAgYXB0LXV0aWxzIFwK
ICAgIGF1dG9tYWtlIFwKICAgIGF1dG9jb25mIFwKICAgIGJjIFwKICAgIGJpc29uIFwKICAgIGJ1
aWxkLWVzc2VudGlhbCBcCiAgICBjYS1jZXJ0aWZpY2F0ZXMgXAogICAgY2xhbmctNyBcCiAgICBj
dXJsIFwKICAgIGZsZXggXAogICAgZ2l0IFwKICAgIGdwZXJmIFwKICAgIGxjb3YgXAogICAgbGx2
bSBcCiAgICBsaWJlbGYtZGV2IFwKICAgIGxpYmd0ay0zLWRldiBcCiAgICBsaWJuY3Vyc2VzLWRl
diBcCiAgICBsaWJzc2wtZGV2IFwKICAgIGxpYnNxbGl0ZTMtZGV2IFwKICAgIGxpYnRvb2wgXAog
ICAgbGlidXNiLTEuMC0wLWRldiBcCiAgICBsaWJ4bWwyLWRldiBcCiAgICBtNCBcCiAgICBtYWtl
IFwKICAgIG5pbmphLWJ1aWxkIFwKICAgIG9jYW1sIFwKICAgIHBlcmwgXAogICAgcHl0aG9uMyBc
CiAgICBweXRob24zLXBpcCBcCiAgICBzcWxpdGUzIFwKICAgIHVuemlwIFwKICAgIHdnZXQgXAog
ICAgeHotdXRpbHMgXAogICAgemlwIFwKICAgJiYgYXB0LWdldCBhdXRvcmVtb3ZlIC15IFwKICAg
JiYgcm0gLXJmIC92YXIvbGliL2FwdC9saXN0cy8qIFwKICAgJiYgdXBkYXRlLWFsdGVybmF0aXZl
cyAtLWluc3RhbGwgL3Vzci9iaW4vcHl0aG9uIHB5dGhvbiAvdXNyL2Jpbi9weXRob24zIDEwCgpS
VU4gcHl0aG9uIC1tIHBpcCBpbnN0YWxsIC0tdXBncmFkZSBwaXAgdmlydHVhbGVudgoKIyBUbyBi
dWlsZCB0aGUgaW1hZ2UgZm9yIGEgYnJhbmNoIG9yIGEgdGFnIG9mIElERiwgcGFzcyAtLWJ1aWxk
LWFyZyBJREZfQ0xPTkVfQlJBTkNIX09SX1RBRz1uYW1lLgojIFRvIGJ1aWxkIHRoZSBpbWFnZSB3
aXRoIGEgc3BlY2lmaWMgY29tbWl0IElEIG9mIElERiwgcGFzcyAtLWJ1aWxkLWFyZyBJREZfQ0hF
Q0tPVVRfUkVGPWNvbW1pdC1pZC4KIyBJdCBpcyBwb3NzaWJlIHRvIGNvbWJpbmUgYm90aCwgZS5n
LjoKIyAgIElERl9DTE9ORV9CUkFOQ0hfT1JfVEFHPXJlbGVhc2UvdlguWQojICAgSURGX0NIRUNL
T1VUX1JFRj08c29tZSBjb21taXQgb24gcmVsZWFzZS92WC5ZIGJyYW5jaD4uClJVTiBnaXQgY2xv
bmUgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RldmVsL3NwYXJzZS9zcGFyc2UuZ2l0
IC9vcHQvZWxpc2Evc3BhcnNlICYmIGNkIC9vcHQvZWxpc2Evc3BhcnNlICYmIG1ha2UgJiYgbWFr
ZSBpbnN0YWxsIFBSRUZJWD0vdXNyClJVTiBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2Nv
Y2NpbmVsbGUvY29jY2luZWxsZS5naXQgL29wdC9lbGlzYS9jb2NjaW5lbGxlICYmIGNkIC9vcHQv
ZWxpc2EvY29jY2luZWxsZSAmJiAuL2F1dG9nZW4gJiYgLi9jb25maWd1cmUgJiYgbWFrZSAmJiBt
YWtlIGluc3RhbGwKCgpDT1BZIGVudHJ5cG9pbnQuc2ggL29wdC9lbGlzYS9lbnRyeXBvaW50LnNo
ClJVTiBjaG1vZCAreCAvb3B0L2VsaXNhL2VudHJ5cG9pbnQuc2gKCkVOVFJZUE9JTlQgWyAiL29w
dC9lbGlzYS9lbnRyeXBvaW50LnNoIiBdCkNNRCBbICIvYmluL2Jhc2giIF0K

--000000000000320df605af622add
Content-Type: application/x-shellscript; name="entrypoint.sh"
Content-Disposition: attachment; filename="entrypoint.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_kf4kbf2g1>
X-Attachment-Id: f_kf4kbf2g1

IyEvdXNyL2Jpbi9lbnYgYmFzaApzZXQgLWUKCmVjaG8gIiRAIgpleGVjICIkQCIK

--000000000000320df605af622add--
