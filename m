Return-Path: <SRS0=/gpt=E6=lists.elisa.tech=bounce+72012+205+5278000+9232812@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24407C63798
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 17:02:05 +0000 (UTC)
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5069320857
	for <linux-safety@archiver.kernel.org>; Tue, 24 Nov 2020 17:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=lists.elisa.tech header.i=@lists.elisa.tech header.b="pQ5WEwpc"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+72012+205+5278000+9232812@lists.elisa.tech
X-Received: by 127.0.0.2 with SMTP id w1KGYY5279335xxxoWMUdwtO; Tue, 24 Nov 2020 09:02:03 -0800
X-Received: from ubuntu.localdomain (ubuntu.localdomain [2.127.6.98])
 by mx.groups.io with SMTP id smtpd.web12.54933.1606237322862086857
 for <linux-safety@lists.elisa.tech>;
 Tue, 24 Nov 2020 09:02:03 -0800
X-Received: by ubuntu.localdomain (Postfix, from userid 0)
	id 58FB71612EC; Tue, 24 Nov 2020 17:02:01 +0000 (GMT)
From: "Milan Lakhani" <milan.lakhani@codethink.co.uk>
To: devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-safety@lists.elisa.tech,
	gregkh@linuxfoundation.org
Cc: Milan Lakhani <milan.lakhani@codethink.co.uk>
Subject: [linux-safety] [PATCH v2 2/2] staging: vt6655: Use macro in rxtx.c
Date: Tue, 24 Nov 2020 17:01:56 +0000
Message-Id: <1606237316-6247-2-git-send-email-milan.lakhani@codethink.co.uk>
In-Reply-To: <1606237316-6247-1-git-send-email-milan.lakhani@codethink.co.uk>
References: <1606237316-6247-1-git-send-email-milan.lakhani@codethink.co.uk>
Precedence: Bulk
List-Unsubscribe: <https://lists.elisa.tech/g/linux-safety/unsub>
Sender: linux-safety@lists.elisa.tech
List-Id: <linux-safety.lists.elisa.tech>
Mailing-List: list linux-safety@lists.elisa.tech; contact linux-safety+owner@lists.elisa.tech
List-Post: <mailto:linux-safety@lists.elisa.tech>
X-Gm-Message-State: 2nbT7dmBhpLbHRy9DIuNZLoEx5278000AA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.elisa.tech; q=dns/txt; s=20140610; t=1606237323;
 bh=SirMrmfiWj55PUkH4YGJeJWI1r1BTRq3GldGjMbQI24=;
 h=Cc:Date:From:Subject:To;
 b=pQ5WEwpcPSKKXux/F1XZFAzJ7C+6CX2GmCQ+KbxVL6LV01UXDPtIyydXSwlq1JvZEl1
 wJ7oZhU+SkNinVSST603sxqVM7VwmEI6QGtKrlxKzoKGiEpyeBgiiw8JUYIS4g2R7yzsR
 TMhnhKbRB6wI/6gJGBK9Hhv4qEk0o9xlv70=

Use macro for repeated function to get the data duration and timestamp,
correcting line length and alignment warnings in rxtx.c. Reported by
checkpatch.

Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
---
 drivers/staging/vt6655/rxtx.c | 51 ++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index ff45206..5ce0362 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -423,6 +423,10 @@ s_uGetRTSCTSDuration(
 	return cpu_to_le16((u16)uDurTime);
 }
 
+#define getDurationTimeStamp(byDurType, byPktType, wRate) \
+	(cpu_to_le16((u16)s_uGetDataDuration(pDevice, (byDurType), cbFrameLength, (byPktType), \
+		(wRate), bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption)))
+
 static
 __le16
 s_uFillDataHead(
@@ -467,15 +471,10 @@ s_uFillDataHead(
 			} else {
 				/* Get Duration and TimeStamp */
 				buf->duration_a =
-					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength,
-									    byPktType, wCurrentRate, bNeedAck, uFragIdx,
-									    cbLastFragmentSize, uMACfragNum,
-									    byFBOption));
+					getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
 				buf->duration_b =
-					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength,
-									    PK_TYPE_11B, pDevice->byTopCCKBasicRate,
-									    bNeedAck, uFragIdx, cbLastFragmentSize,
-									    uMACfragNum, byFBOption));
+					getDurationTimeStamp(DATADUR_B, PK_TYPE_11B,
+							     pDevice->byTopCCKBasicRate);
 			}
 
 			buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
@@ -492,14 +491,11 @@ s_uFillDataHead(
 				  pDevice->byTopCCKBasicRate,
 				  PK_TYPE_11B, &buf->b);
 		/* Get Duration and TimeStamp */
-		buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
-								      wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-		buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength, PK_TYPE_11B,
-								       pDevice->byTopCCKBasicRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-		buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
-									  wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-		buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
-									 wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
+		buf->duration_a = getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
+		buf->duration_b = getDurationTimeStamp(DATADUR_B, PK_TYPE_11B,
+						       pDevice->byTopCCKBasicRate);
+		buf->duration_a_f0 = getDurationTimeStamp(DATADUR_A_F0, byPktType, wCurrentRate);
+		buf->duration_a_f1 = getDurationTimeStamp(DATADUR_A_F1, byPktType, wCurrentRate);
 
 		buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
 		buf->time_stamp_off_b = vnt_time_stamp_off(pDevice, pDevice->byTopCCKBasicRate);
@@ -517,12 +513,11 @@ s_uFillDataHead(
 					  byPktType, &buf->a);
 
 			/* Get Duration and TimeStampOff */
-			buf->duration = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
-									    wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-			buf->duration_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
-									       wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-			buf->duration_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
-										wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
+			buf->duration = getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
+			buf->duration_f0 = getDurationTimeStamp(DATADUR_A_F0, byPktType,
+								wCurrentRate);
+			buf->duration_f1 = getDurationTimeStamp(DATADUR_A_F1, byPktType,
+								wCurrentRate);
 			buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
 			return buf->duration;
 		}
@@ -537,11 +532,7 @@ s_uFillDataHead(
 			buf->duration = dur;
 		} else {
 			/* Get Duration and TimeStampOff */
-			buf->duration =
-				cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
-								    wCurrentRate, bNeedAck, uFragIdx,
-								    cbLastFragmentSize, uMACfragNum,
-								    byFBOption));
+			buf->duration = getDurationTimeStamp(DATADUR_A, byPktType, wCurrentRate);
 		}
 
 		buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
@@ -558,11 +549,7 @@ s_uFillDataHead(
 		buf->duration = dur;
 	} else {
 		/* Get Duration and TimeStampOff */
-		buf->duration =
-			cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength, byPktType,
-							    wCurrentRate, bNeedAck, uFragIdx,
-							    cbLastFragmentSize, uMACfragNum,
-							    byFBOption));
+		buf->duration = getDurationTimeStamp(DATADUR_B, byPktType, wCurrentRate);
 	}
 
 	buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#205): https://lists.elisa.tech/g/linux-safety/message/205
Mute This Topic: https://lists.elisa.tech/mt/78481482/5278000
Group Owner: linux-safety+owner@lists.elisa.tech
Unsubscribe: https://lists.elisa.tech/g/linux-safety/unsub [linux-safety@archiver.kernel.org]
-=-=-=-=-=-=-=-=-=-=-=-


