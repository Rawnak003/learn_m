import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_m/core/constants/app_colors.dart';
import 'tabs/sign_in_tab.dart';
import 'tabs/sign_up_tab.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 8.h),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600
                  ),
                  dividerColor: Colors.grey.shade300,
                  dividerHeight: 1.h,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.primary,
                  splashFactory: NoSplash. splashFactory,
                  tabs: const [
                    Tab(text: "Sign In"),
                    Tab(text: "Sign Up"),
                  ],
                ),
                SizedBox(height: 20.h),
                const Expanded(
                  child: TabBarView(
                    children: [
                      SignInTab(),
                      SignUpTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
