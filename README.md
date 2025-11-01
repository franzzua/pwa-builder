Docker images for building Android and iOS application from PWA

## Android

### Build

Based on [bubblewrap](https://github.com/GoogleChromeLabs/bubblewrap) project with some improvements

[Docker](./android/Dockerfile) runs bubblewrap for sample app (https://webboard.app) and installs all required tools 
After that you can run this docker many times for different apps quickly:
`docker run fransuane/android-pwa-builder your-domain.com`
It downloads manifest and replaces variables in default android project. Outputs .aab into `/out` folder - you can mount and grab result
You can override anything by env vars, like `-e TWA_SPLASH_SCREEN_COLOR=#000`. Look at [answers.sh](./android/answers.sh) for available env vars
* provide your android.keystore file with `-v ./android.keystore:/app/android.keystore`
* provide your `BUBBLEWRAP_KEYSTORE_PASSWORD` and `BUBBLEWRAP_KEY_PASSWORD` with env vars

### Publish

You can find [workflow](./.github/workflows/android.yml) for publishing .aab to google play console.

It gets last version from google play, increments it, generates new .aab bundle and pushes it to google play


## IOS

### Build

[Docker](./ios/PWABuilder.IOS.Cli/Dockerfile) contains C# app that takes config.json and produces Swift app based on it.
* TODO: download manifest.json and use vars from it
* Copy example [config.json](https://github.com/franzzua/pwabuilder-ios-cli/blob/main/PWABuilder.IOS.Cli/config.json) and modify it to use
* `docker run fransuane/ios-pwa-builder -v ./config.json:/app/config.json -v ./out:/out`

### Publish

You can find [workflow](./.github/workflows/ios.yml) for publishing bundle to your Apple developer environment

It gets last version, increments it, generates new bundle and publishes it.
You have to provide many variables, all required.