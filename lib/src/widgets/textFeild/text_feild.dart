import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertodoapp/src/constants/app_colors.dart';
import 'package:fluttertodoapp/src/provider/app_providers.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final int? maxLines;
  final bool? obscureText;
  final String? svgPath;
  final String? hintText;

  const AppTextField(this.controller, this.labelText,
      {super.key,
      this.maxLines,
      this.obscureText,
      this.svgPath,
      this.hintText});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  ProviderContainer? _ref;
  AppColors? _appColors;

  String eyeOpen = "eye_see.svg";
  String eyeCrossed = "eye-crossed.svg";
  bool res = false;
  bool obscureRes = false;

  @override
  void initState() {
    super.initState();
    _ref = ProviderContainer();
    _appColors = _ref?.read(appColorProvider);

    obscureRes = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      obscureText: obscureRes,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIconConstraints: BoxConstraints.tight(Size.square(35.sp)),
        prefixIcon: widget.svgPath != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: SvgPicture.asset(
                  "assets/interface/${widget.svgPath}",
                  color: Colors.blueAccent.withOpacity(0.9),
                  height: 5.sp,
                ),
              )
            : null,
        suffixIconConstraints: BoxConstraints.tight(Size.square(35.sp)),
        suffixIcon: widget.obscureText == true
            ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        res = !res;
                        obscureRes = !obscureRes;
                      });
                    },
                    child: SvgPicture.asset(
                      "assets/interface/${res ? eyeCrossed : eyeOpen}",
                      color: Colors.blueAccent.withOpacity(0.9),
                      height: 5.sp,
                    )),
              )
            : null,
      ),
    );
  }
}
