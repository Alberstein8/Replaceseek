export ARCHS = armv7 armv7s arm64
export TARGET = iphone:clang:8.1
include theos/makefiles/common.mk

TWEAK_NAME = replaceSeek
replaceSeek_FILES = Tweak.xm
replaceSeek_FRAMEWORKS = UIKit MediaPlayer

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
