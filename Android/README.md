# Android-ABatteryView

An Android costomized View to display battery level with charging status.

### Demo

![Presentation](https://raw.githubusercontent.com/antonio081014/ABatteryView/master/Android/Screen%20Shot%202016-01-20%20at%2015.29.48.png)

***

### How to Install it

- Add [BatteryView.java](https://github.com/antonio081014/ABatteryView/blob/master/Android/BatteryView.java) to `src\main\java\package\`
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
  3. `BatterView bv = (BatteryView) findViewById(R.id.batteryview);`

2. In Code:
  ```
  BatteryView bv = new BatteryView(mContext);
  // Specify the property like layout params
  // Add this to some ViewGroup.
  ```
  For further details, checkout the [BatteryView.java](https://github.com/antonio081014/ABatteryView/blob/master/Android/BatteryView.java) class.
