XBUILD=/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild
PROJECT_ROOT=./EventKitPermissionsWrapper
PROJECT=$(PROJECT_ROOT)/EventKitPermissionsWrapper.xcodeproj
TARGET=EventKitPermissionsWrapper

all: lib$(TARGET).a

lib$(TARGET)-x86_64.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphonesimulator -arch x86_64 -configuration Release clean build
	-mv $(PROJECT_ROOT)/build/Release-iphonesimulator/lib$(TARGET).a $@

lib$(TARGET)-arm64.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphoneos -configuration Release clean build
	-mv $(PROJECT_ROOT)/build/Release-iphoneos/lib$(TARGET).a $@

lib$(TARGET).a: lib$(TARGET)-x86_64.a lib$(TARGET)-arm64.a
	lipo -create -output $@ $^

clean:
	-rm -f *.a *.dll

info:
	lipo -info lib$(TARGET).a
