#  Fat Libarary


## Build for device and simulator

``` 
xcodebuild -project EventKitPermissionsWrapper.xcodeproj -sdk iphoneos -configuration Release clean build
xcodebuild -project EventKitPermissionsWrapper.xcodeproj -sdk iphonesimulator -arch x86_64 -configuration Release build
``` 

## Create fat lib

Bundle results into on fat binary:

``` 
lipo -create -output libEventKitPermissionsWrapper.a build/Release-iphonesimulator/libEventKitPermissionsWrapper.a build/Release-iphoneos/libEventKitPermissionsWrapper.a

```

## Check lib

Use this to check all contained architectures

```
lipo -info libEventKitPermissionsWrapper.a
```

this should show:

```
Architectures in the fat file: libEventKitPermissionsWrapper.a are: x86_64 arm64 
```
