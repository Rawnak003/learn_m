import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 40.h,
            width: 40.h,
            child: SvgPicture.asset(Assets.icons.google),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: (){},
          child: SizedBox(
            height: 40.h,
            width: 40.h,
            child: SvgPicture.asset(Assets.icons.apple),
          ),
        ),
      ],
    );
  }
}
