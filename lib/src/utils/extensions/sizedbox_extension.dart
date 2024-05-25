import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  /// Create a SizedBox with the specified height
  SizedBox get heightBox => SizedBox(height: toDouble().w);

  /// Create a SizedBox with the specified width
  SizedBox get widthBox => SizedBox(width: toDouble().h);
}
