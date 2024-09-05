import 'package:flutter/material.dart';
import 'package:qmma_flutter/ui/utils/screen_util.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final DeviceType deviceType = ScreenUtil.getDeviceType(size.width);

    if(deviceType == DeviceType.mobile){
      return mobile;
    }
    if(deviceType == DeviceType.tablet){
      return tablet ?? mobile;
    }
    return desktop;
  }
}
