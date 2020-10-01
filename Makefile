FINALPACKAGE = 1
DEBUG = 0

INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang::9.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ActivatorListenersForMusicApp

$(TWEAK_NAME)_FILES = $(TWEAK_NAME).xm
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = MediaRemote
$(TWEAK_NAME)_LDFLAGS = -lactivator
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
