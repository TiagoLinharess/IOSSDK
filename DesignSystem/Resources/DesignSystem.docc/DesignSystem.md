# SharpnezDesignSystem

![Build Status](https://api.travis-ci.com/TiagoLinharess/SharpnezDesignSystem.svg)
![Platform](https://img.shields.io/cocoapods/p/SharpnezDesignSystem.svg?style=flat)
![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SharpnezDesignSystem.svg)

## What is?
### SharpnezDesignSystem is a DesignSystem module for iOS development. This is a UI module including components and UI helpers for better development.

## Installing via cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command

```bash
$ gem install cocoapods
```

Frist of all, you need to setup a source propertie in your ``Poffile``

```
source 'https://github.com/CocoaPods/Specs.git'
```

After that still in your Pofile file add the following line.

```
pod 'SharpnezDesignSystem', '~> 1.0.0'
```
Then, run the following command:

```bash
$ pod install
```
## Setup Module

At frist, if you do not want to use use the DesignSystem custom fonts, jump for the next step, now if you wuant to use, setup the custom fonts in your AppDelegate or in another file that is used before using the fonts

```swift
import SharpnezDesignSystem
import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        DesignSystemConfiguration.loadFonts()
        return true
    }
}
```

After that, SharpnezDesignSystem is totally ready for usage

## Usage
