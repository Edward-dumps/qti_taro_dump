#! /vendor/bin/sh
#=============================================================================
# Copyright (c) 2020-2022 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#=============================================================================

soc_id=`cat /sys/devices/soc0/soc_id` 2> /dev/null

#soc_id's SM8150:339, SM8250:356, SM8350:415, 439 and 456, HDK8150: 361
if [ "$soc_id" -eq 339 ] || [ "$soc_id" -eq 356 ] || [ "$soc_id" -eq 361 ] || [ "$soc_id" -eq 415 ] || [ "$soc_id" -eq 439 ] || [ "$soc_id" -eq 456 ]; then
    enable vendor.keymaster-sb-4-0
    start vendor.keymaster-sb-4-0
    enable vendor.authsecret.qti-1-0
    start vendor.authsecret.qti-1-0
#soc_ids SM8450: 457, 482, 552, SM8475: 530, 531, 540
elif [ "$soc_id" -eq 457 ] || [ "$soc_id" -eq 482 ] || [ "$soc_id" -eq 552 ] \
        || [ "$soc_id" -eq 530 ] || [ "$soc_id" -eq 531 ] || [ "$soc_id" -eq 540 ]; then
    enable vendor.keymaster-sb-4-0
    start vendor.keymaster-sb-4-0
else
    setprop vendor.gatekeeper.disable_spu true
fi
