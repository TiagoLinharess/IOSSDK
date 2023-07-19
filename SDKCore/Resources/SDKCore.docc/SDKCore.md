# SharpnezCore

![Build Status](https://api.travis-ci.com/TiagoLinharess/SharpnezCore.svg)
![Platform](https://img.shields.io/cocoapods/p/SharpnezCore.svg?style=flat)
![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SharpnezCore.svg)

## What is?
### SharpnezCore is a Core module for iOS development. This module provides support codes, is still on the beginning of the development, will have more features soon

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
pod 'SharpnezCore', '~> 1.0.0'
```
Then, run the following command:

```bash
$ pod install
```
## Usage

### UIImageView methods

#### cornerRadius method

This method make UIImageview corner rounded according to the entered value

Example of usage

```swift
UIImageView().cornerRadius(radius: 32)
```

#### load method

This method loads de UIImage from a URL 

Example of usage

```swift
guard let url = URL(string: "https://avatars.githubusercontent.com/u/10639145?s=200&v=4") else { return }
UIImageView().load(url: url)
```
