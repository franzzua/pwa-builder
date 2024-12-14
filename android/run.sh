#!/bin/bash
./answers.sh | bubblewrap init --manifest=https://$1/manifest.json

export ANDROID_SDK_ROOT=/usr/lib/android
cat ./app/build.gradle | sed -e s/33/34/g | tee ./app/build.gradle
./gradlew bundleRelease
cp ./app/build/outputs/bundle/release/app-release.aab /out/
jarsigner -keystore ./android.keystore /out/app-release.aab android \
  -storepass $BUBBLEWRAP_KEYSTORE_PASSWORD \
  -keypass $BUBBLEWRAP_KEY_PASSWORD
