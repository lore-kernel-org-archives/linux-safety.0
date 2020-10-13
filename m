Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com [67.219.250.112])
 by mx.groups.io with SMTP id smtpd.web11.11606.1602594716535294515
 for <linux-safety@lists.elisa.tech>;
 Tue, 13 Oct 2020 06:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: aisin-aw.co.jp, ip: 67.219.250.112, mailfrom: i33399_yamaguchi@aisin-aw.co.jp)
Return-Path: <I33399_YAMAGUCHI@aisin-aw.co.jp>
Received: from [100.112.135.1] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.us-west-2.aws.symcld.net id 1B/D9-45035-B97A58F5; Tue, 13 Oct 2020 13:11:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRWlGSWpSXmKPExsXC6xeTo3ttWWu
  8QdcyEYvtP8Qs9s/5wmpx4s9UFgdmj8V7XjJ5nF74kC2AKYo1My8pvyKBNWPD8c/sBVfUKjpv
  X2VuYFyn2MXIwSEkUCexrcGri5ELyJzHKNHV3ckI4bQwSTzdtJAFwtnDKNG36xxQhpODTUBd4
  unrdnYQW0TAUeLRuRMsIDazgJbEjc4HYDXCAr2MEmc/W4A0iwj0MUqsf/OaBaLBSuLRnqtsIK
  tZBFQlPk1iAwnzCsRIHN18hQnEFhLYyyjRdqQUxOYUiJW41dLFCmIzCshKTN7VyASxS1zi0uR
  FYL0SAgISS/acZ4awRSVePv7HCmErSax53QpVry+xZ+IpqDu1JZYtfM0MsVdQ4uTMJywTGMVm
  IRk7C0nLLCQts5C0LGBkWcVokVSUmZ5RkpuYmaNraGCga2hopGtobKpraG6kl1ilm6RXWqxbn
  lpcogvklhfrFVfmJuek6OWllmxiBEZhSkH7mh2MO9580DvEKMnBpCTK29neGi/El5SfUpmRWJ
  wRX1Sak1p8iFGGg0NJgjd5KVBOsCg1PbUiLTMHmBBg0hIcPEoivPeXAKV5iwsSc4sz0yFSpxh
  dOa6uWrKImePmexC55i+IPNn1Aki29OxfyizEkpeflyolzusIMlsApDmjNA9uNCyZXWKUlRLm
  ZWRgYBDiKUgtys0sQZV/xSjOwagkzHsDZApPZl4J3AWvgI5jAjrOfkkLyHEliQgpqQamRRKhh
  RUP3Rbd+X36mtQzl2XnRNJMjs5iTfNPaPdsKJ8+t23ZFQ7pZ6uFj/0S/dbD2xf3+KGSlOjiyI
  hPSe9Kmdl/nBKWLfaY2n0ir5Tr/EeWG9PrV21pzJ3vKrj+7A8Zzandd9dLflncI/fowcbNFxZ
  d5FcK3x1SN2/vdi934XuZZqbiWcnyGR7bmcySC4NkCy5cXLDmZkef2WOpXX6zZn46mvAgwaww
  KSfeffXhTOvvpreTLy3c5qiUv1NAiLPe5Udx58vqr5f+C91JPTX9sfqFSSsSM73iC2bu5DnY8
  GXThueVp4J/6xXeVV+Wc9T3/Gn2eZpNhsJmDzY0yHdcOBO45bEX70q/m54ecdW8SizFGYmGWs
  xFxYkAj04r2eEDAAA=
X-Env-Sender: I33399_YAMAGUCHI@AISIN-AW.CO.JP
X-Msg-Ref: server-23.tower-340.messagelabs.com!1602594515!2889!1
X-Originating-IP: [13.78.92.108]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30909 invoked from network); 13 Oct 2020 13:08:37 -0000
Received: from aigcc-gw-gw.japaneast.cloudapp.azure.com (HELO aigcc-gw02.aisin.co.jp) (13.78.92.108)
  by server-23.tower-340.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Oct 2020 13:08:37 -0000
Received: (from root@localhost)
	by aigcc-gw02.aisin.co.jp (8.14.7/8.14.7) id 09DD7P5t075511;
	Tue, 13 Oct 2020 22:07:25 +0900
Received: from aigcc-gw-mta.japaneast.cloudapp.azure.com [13.78.87.215] 
	 by aigcc-gw02.aisin.co.jp with ESMTP id YAA75509;
	 Tue, 13 Oct 2020 22:07:25 +0900
Received: from SMAIL-JP-HC03.intra.aisin-aw.co.jp (red.aisin-aw.co.jp [203.180.223.130])
	by aigcc-gw-mta01.aisin.co.jp (8.14.7/8.14.7) with ESMTP id 09DD7OwH123891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Oct 2020 22:07:24 +0900
Received: from SMAIL-JP-MBX02.intra.aisin-aw.co.jp ([172.16.135.52]) by
 SMAIL-JP-HC03.intra.aisin-aw.co.jp ([172.16.136.154]) with mapi id
 14.03.0210.002; Tue, 13 Oct 2020 22:07:24 +0900
From: <I33399_YAMAGUCHI@AISIN-AW.CO.JP>
To: <gabriele.paoloni@intel.com>, <linux-safety@lists.elisa.tech>
CC: <safety-architecture@lists.elisa.tech>
Subject: Re: [ELISA Safety Architecture WG] [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not decrement oops_in_progress unconditionally
Thread-Topic: [ELISA Safety Architecture WG] [linux-safety] [RFC PATCH 2/2]
 bust_spinlocks: do not decrement oops_in_progress unconditionally
Thread-Index: AQHWoUZU/WqT/Dj8t0+JYIno0AEOYKmVbZxggAANdcA=
Date: Tue, 13 Oct 2020 13:07:23 +0000
Message-ID: <B5A52225FE7FBE4EA743EA87175029980128AA18D9@SMAIL-JP-MBX02.intra.aisin-aw.co.jp>
References: <20201013094938.356837-1-gabriele.paoloni@intel.com>
 <163D8465D1668B95.25724@lists.elisa.tech>
 <MN2PR11MB41582F55CDBF50A053DF233788040@MN2PR11MB4158.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB41582F55CDBF50A053DF233788040@MN2PR11MB4158.namprd11.prod.outlook.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.29.179.155]
MIME-Version: 1.0
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Gab

I think so, this patch is good.
If you agree to my opinion, please more improve.
In a very rare case, the oops_in_progress could be a negative value.  Beca=
use this decrement/increment is a read-modified statement.  On the other ha=
nd, shouldn't take exclusions such as spin lock with this function.

if (!oops_in_progress)
change to=20
if (oops_in_progress <=3D 0)

How about?

Best,
/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
Doctor of Informatics, Specialist
Software Fundamental Technology Group
Application Development Department
Connected & Sharing Solutions Division
AISIN AW CO.,LTD.
YAMAGUCHI Naoto
E-mail=1B$B!'=1B(B i33399_YAMAGUCHI@aisin-aw.co.jp
/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
-----Original Message-----
From: safety-architecture@lists.elisa.tech <safety-architecture@lists.elis=
a.tech> On Behalf Of Paoloni, Gabriele
Sent: Tuesday, October 13, 2020 8:58 PM
To: Paoloni, Gabriele <gabriele.paoloni@intel.com>; linux-safety@lists.eli=
sa.tech
Cc: safety-architecture@lists.elisa.tech
Subject: Re: [ELISA Safety Architecture WG] [linux-safety] [RFC PATCH 2/2]=
 bust_spinlocks: do not decrement oops_in_progress unconditionally

+CC safety arch mailing list

> -----Original Message-----
> From: linux-safety@lists.elisa.tech <linux-safety@lists.elisa.tech> On=
=20
> Behalf Of Paoloni, Gabriele
> Sent: Tuesday, October 13, 2020 11:50 AM
> To: linux-safety@lists.elisa.tech
> Cc: Paoloni, Gabriele <gabriele.paoloni@intel.com>
> Subject: [linux-safety] [RFC PATCH 2/2] bust_spinlocks: do not=20
> decrement oops_in_progress unconditionally
>=20
> In the current implementation if the input flag is 0 oops_in_progress=20
> is unconditionally decremented, thus allowing to become a negative=20
> number. Since right now oops_in_progress is a global variable used in=20
> the kernel as a conditional flag to check if oops, panic(), BUG() or=20
> die() is in progress the current unconditional decrement may lead to=20
> unexpected behavior in the Kernel paths conditionally executing over=20
> this flag.
>=20
> This patch only decrement oops_in_progress if it is non zero
>=20
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@intel.com>
> ---
>  lib/bust_spinlocks.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c index=20
> 594b270161d9..842633ac9130 100644
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
>  	=09unblank_screen();
>  #endif
>  	=09console_unblank();
> -	=09if (--oops_in_progress =3D=3D 0)
> +	=09if (oops_in_progress)
> +	=09	oops_in_progress--;
> +	=09if (!oops_in_progress)
>  	=09	wake_up_klogd();
>  	}
>  }
> --
> 2.25.1
>=20
> ---------------------------------------------------------------------
> INTEL CORPORATION ITALIA S.p.A. con unico socio
> Sede: Milanofiori Palazzo E 4
> CAP 20094 Assago (MI)
> Capitale Sociale Euro 104.000,00 interamente versato Partita I.V.A. e=20
> Codice Fiscale  04236760155 Repertorio Economico Amministrativo n.=20
> 997124 Registro delle Imprese di Milano nr. 183983/5281/33 Soggetta ad=
=20
> attivita' di direzione e coordinamento di INTEL CORPORATION, USA
>=20
> This e-mail and any attachments may contain confidential material for=20
> the sole use of the intended recipient(s). Any review or distribution=20
> by others is strictly prohibited. If you are not the intended=20
> recipient, please contact the sender and delete all copies.
>=20
>=20
>=20
>=20
>=20

---------------------------------------------------------------------
INTEL CORPORATION ITALIA S.p.A. con unico socio
Sede: Milanofiori Palazzo E 4
CAP 20094 Assago (MI)
Capitale Sociale Euro 104.000,00 interamente versato Partita I.V.A. e Codi=
ce Fiscale  04236760155 Repertorio Economico Amministrativo n. 997124 Regis=
tro delle Imprese di Milano nr. 183983/5281/33 Soggetta ad attivita' di dir=
ezione e coordinamento di INTEL CORPORATION, USA

This e-mail and any attachments may contain confidential material for the =
sole use of the intended recipient(s). Any review or distribution by others=
 is strictly prohibited. If you are not the intended recipient, please cont=
act the sender and delete all copies.
