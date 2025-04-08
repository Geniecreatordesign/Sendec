#!/bin/bash

export JAVA_HOME=/home/dragon/world/android/jdk/jdk-17
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_SDK_ROOT=/home/dragon/world/android/sdk

echo "[INFO] Environment disiapkan:"
echo "JAVA_HOME=$JAVA_HOME"
echo "ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT"

echo ""
echo "[INFO] Membuild APK..."
cordova build android
