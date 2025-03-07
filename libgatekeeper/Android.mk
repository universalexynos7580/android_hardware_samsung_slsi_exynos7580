# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

MOBICORE_PATH := hardware/samsung_slsi/$(TARGET_SOC)/mobicore
CURRENT_PATH := hardware/samsung_slsi/$(TARGET_SOC)/libgatekeeper

LOCAL_MODULE := gatekeeper.$(TARGET_SOC)

LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := exynos_gatekeeper.cpp \
		   tlcTeeGatekeeper_if.cpp

LOCAL_C_INCLUDES := \
	$(CURRENT_PATH)/include \
	$(MOBICORE_PATH)/daemon/ClientLib/public \
	$(MOBICORE_PATH)/common/MobiCore/inc/

LOCAL_CFLAGS := -fvisibility=hidden
LOCAL_CFLAGS += -Wall -Werror

ifeq ($(PRODUCT_TRUSTZONE_ENABLED), true)
LOCAL_CFLAGS += -DACCESS_EFS_POSSIBLE
endif
LOCAL_SHARED_LIBRARIES := liblog \
			  libMcClient

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
