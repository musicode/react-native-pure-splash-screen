# react-native-pure-splash-screen

> This repo is deprecated, please visit the new [splash-screen](https://github.com/react-native-hero/splash-screen) repo.

This is a module which help you display a splash screen to avoid blank screen.

## Installation

```
npm i react-native-pure-splash-screen
// link below 0.60
react-native link react-native-pure-splash-screen
```

## Setup

### iOS

Modify `AppDelegate.m`

```oc
#import <RNTSplashScreenModule.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ...
  // add this line
  [RNTSplashScreenModule show:rootView];
  return YES;
}
```

### Android

Step1

add a layout file named `splash_screen_default.xml` under your `res/layout` directories.

Step2

Modify `MainActivity.java`

```java
package com.example;

import android.os.Bundle;

import com.facebook.react.ReactActivity;
import com.github.musicode.splashscreen.RNTSplashScreenModule;

public class MainActivity extends ReactActivity {

    /**
     * Returns the name of the main component registered from JavaScript.
     * This is used to schedule rendering of the component.
     */
    @Override
    protected String getMainComponentName() {
        return "example";
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // add this line
        RNTSplashScreenModule.Companion.show(this);
        super.onCreate(savedInstanceState);
    }

}
```

## Usage

```js
import SplashScreen from 'react-native-pure-splash-screen'

SplashScreen.hide()
```