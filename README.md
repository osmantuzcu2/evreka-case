# evrekacase

EvrekaCase is a location-based container tracking application developed with flutter. Users can see each containers fullness and they can relocate them. Users can navigate to containers.

<img src="https://raw.githubusercontent.com/osmantuzcu2/evreka-case/main/assets/docs/ss.jpg">

## Dependencies
  connectivity : for check device connectivitiy
  firebase_database : for connect realtime database
  get : for state management, validation, routes
  google_maps_flutter : for map view
  lint : for clean code
  maps_launcher : for launch navigation

## Folder Structure
Each module has a View, Model, Controller, Service dart file.This way, you don't have to navigate much outside of the folder you're working in.
Global widgets contain recursively used widgets.
Views contain widgets and everything can be seen.
Models contain data models for json responses.
Controllers using Getx State Management library.
Services contain network communications.

<img src="https://raw.githubusercontent.com/osmantuzcu2/evreka-case/main/assets/docs/folder.jpg">

## How to build
    1- Flutter v.2.X must be installed and enviroment must be ready. See more : https://flutter.dev/docs/get-started/install
    3- Create your own google-services.json file. For more information : https://firebase.flutter.dev/docs/database/overview/
    2- flutter pub get
    3- flutter run

## Permissions
    ### Android

1. Set the `minSdkVersion` in `android/app/build.gradle`:

```groovy
android {
    defaultConfig {
        minSdkVersion 20
    }
}
```

This means that app will only be available for users that run Android SDK 20 or higher.

2. Specify your API key in the application manifest `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```

### iOS

Specify your API key in the application delegate `ios/Runner/AppDelegate.m`:

```objectivec
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GMSServices provideAPIKey:@"YOUR KEY HERE"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
```

Or in your swift code, specify your API key in the application delegate `ios/Runner/AppDelegate.swift`:

```swift
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

more details : https://github.com/flutter/plugins/tree/master/packages/google_maps_flutter/google_maps_flutter

