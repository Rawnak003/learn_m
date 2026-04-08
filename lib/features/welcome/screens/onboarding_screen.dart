import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../app/routes/route_names.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/local_storage_services/shared_preference_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() async {
    if (_currentPage == 2) {
      await SharedPreferenceData.setOnboardingSeen();
      Navigator.pushReplacementNamed(context, RouteNames.onboardingScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    _pageController.jumpToPage(2);
    setState(() => _currentPage = 2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _skip,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  onPageChanged: (index) => setState(() => _currentPage = index),
                  itemBuilder: (context, index) {
                    return _buildPage(
                      imagePath: _pageIcons[index],
                      title: _pageTitles[index],
                      subtitle: _pageSubtitles[index],
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final isActive = index == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    height: 7.h,
                    width: isActive ? 20.w : 7.w,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.primary
                          : AppColors.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  );
                }),
              ),
              SizedBox(height: 40.h),

              _nextButton(),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    final isLastPage = _currentPage == 2;

    return GestureDetector(
      onTap: _nextPage,
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          color: isLastPage ? AppColors.primary : AppColors.background,
          border: Border.all(
            color: AppColors.primary,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(45.r),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isLastPage ? 'Get Started' : 'Next',
                style: TextStyle(
                  color: isLastPage
                      ? AppColors.background
                      : AppColors.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 16.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: isLastPage
                    ? AppColors.background
                    : AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(height: 32.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  List<String> get _pageTitles => [
    'First See Learning',
    'Connect With Everyone',
    'Always Fascinated Learning',
  ];

  List<String> get _pageSubtitles => [
    'Forget about a for of paper all knowledge in one learning!',
    'Always keep in touch with your tutor & friends. Let\'s get connected!',
    'Anytime, Anywhere! The time is at your discretion so study whenever you want!',
  ];

  List<String> get _pageIcons => [
    Assets.images.boy.path,
    Assets.images.man.path,
    Assets.images.reading.path,
  ];
}