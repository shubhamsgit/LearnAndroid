#!/usr/bin/env bash

PACKAGE=com.techhue.views
ACTIVITY=.MyActivity
#APK_LOCATION=app/build/outputs/apk/app-debug.apk
APK_LOCATION=app/build/outputs/apk/debug/app-debug.apk
echo "Package: $PACKAGE"

echo "Building the project with tasks: $TASKS"
./gradlew $TASKS

echo "Uninstalling $PACKAGE"
adb uninstall $PACKAGE

echo "Installing $APK_LOCATION"
adb install $APK_LOCATION

echo "Starting $ACTIVITY"
adb shell am start -n $PACKAGE/$ACTIVITY

