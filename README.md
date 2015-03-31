# hands-on

This repo is where we are building an Minimal Viable Demo for "Hands On", an ambitious new application that aspires to disrupt traditional social networks, project management, and knowledge management.

http://theswanfactory.com/2015/03/08/how-to-disrupt-facebook/

## Installation

The current version is an iOS application written in Objective-C using CocoaPods:

    http://guides.cocoapods.org/using/getting-started.html
    
As such, you can only build this on OS X using Xcode:

```
$ git clone git@github.com:TheSwanFactory/hands-on.git # Use SSH for easier push-backs
$ cd hands-on/app
$ sudo gem install cocoapods
$ pod install 
$ open HandsOn.xcworkspace # Required to build pods properly
```
We are hoping to build a cross-platform version in the future using [React Native](http://facebook.github.io/react-native/) and OrientDB.
