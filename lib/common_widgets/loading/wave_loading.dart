import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/constants/app_colors.dart';

class WaveLoading extends StatelessWidget {
  const WaveLoading({super.key, this.waveColor});

  final Color? waveColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: waveColor ?? AppColors.primary,
        size: 40.w,
      ),
    );
  }
}