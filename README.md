# react-native-pure-splash-screen

This is a module which help you display a splash screen to avoid blank screen.

## Installation

```
npm i react-native-pure-splash-screen
react-native link react-native-pure-splash-screen
```

## Setup

### iOS

Modify `AppDelegate.m`

```oc
#import <RNTSplashScreen/RNTSplashScreenModule.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ...
  // add this line
  [RNTSplashScreenModule show];
  return YES;
}
```

### Android

Step1

add an image named `splash_screen_default` under your `res/mipmap-xx` directories.

> image's extname is no matter, such as `jph`,`png`,`webp`.

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