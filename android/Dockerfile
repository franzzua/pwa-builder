FROM ghcr.io/googlechromelabs/bubblewrap

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip -q -O tmp.zip \
     && unzip tmp.zip -d /usr/lib/android && rm tmp.zip

RUN mkdir /usr/lib/android/licenses \
    && echo 24333f8a63b6825ea9c5514f83c2829b004d1fee > /usr/lib/android/licenses/android-sdk-license

RUN bubblewrap updateConfig --jdk-path /usr/lib/jvm/java-11-openjdk-amd64 --androidSdkPath /usr/lib/android

RUN /usr/lib/android/tools/bin/sdkmanager --install "build-tools;34.0.0" --sdk_root="/usr/lib/android"

ENV BUBBLEWRAP_KEYSTORE_PASSWORD=password
ENV BUBBLEWRAP_KEY_PASSWORD=password
COPY /android.keystore /app/android.keystore

RUN yes '' | bubblewrap init --manifest=https://webboard.app/manifest.json

RUN bubblewrap build && rm /app/* -rf

COPY run.sh /app/run.sh
COPY answers.sh /app/answers.sh

ENTRYPOINT ["/app/run.sh"]