# Android-ABatteryView

[![Android Arsenal](https://img.shields.io/badge/Android%20Arsenal-BatteryView-brightgreen.svg)](https://android-arsenal.com/details/1/5155)

An Android costomized View to display battery level with charging status.

### Demo
<p align="center"><img src="https://media.giphy.com/media/l0EwYzyKHwRXGRAaI/giphy.gif"></p>

***

### How to Install it

- Add [BatteryView.java](https://github.com/antonio081014/ABatteryView/blob/master/Android/BatteryView.java) to `src\main\java\package\`
- Add to [BatteryView.java Line#1 ](https://github.com/antonio081014/ABatteryView/blob/master/Android/BatteryView.java#L1) the corresponding package. `com.your.package`
- Add [attrs_battery_view.xml](https://github.com/antonio081014/ABatteryView/blob/master/Android/attrs_battery_view.xml) to `src\main\res\values\`

### How to Use it

1. In XML File:
  1. In the root ViewGroup property, specify: `xmlns:custom="http://schemas.android.com/apk/res-auto"`;
  2. Within the ViewGroup, add the following code:
    ```
    <package.BatteryView
        android:id="@+id/batteryview"
        android:layout_width="48dp"
        android:layout_height="24dp"
        custom:charging="true"
        custom:level="70" />
    ```
  3. To change the warning battery level use: `custom:warningLevel="40"`
  4. To disable the warning battery color red use: `custom:levelColors="false"`
  4. To disable the displaying of battery value use: `custom:showValue="false"`
  5. `BatterView bv = (BatteryView) findViewById(R.id.batteryview);`

2. In Code:
  ```
  BatteryView bv = new BatteryView(mContext);
  // Specify the property like layout params
  // Add this to some ViewGroup.
  ```
  For further details, checkout the [BatteryView.java](https://github.com/antonio081014/ABatteryView/blob/master/Android/BatteryView.java) class.
