enum DeviceType {
  mobile,
  tablet,
  desktop,
}

class ScreenUtil {
  static const double mobileMaxWidth = 640.0;
  static const double tabletMaxWidth = 1008.0;

  static DeviceType getDeviceType(double width) {
    if(width < mobileMaxWidth) {
      return DeviceType.mobile;
    }
    if(width > mobileMaxWidth && width < tabletMaxWidth) {
      return DeviceType.tablet;
    }

    return DeviceType.desktop;
  }

}