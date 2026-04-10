import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common_widgets/buttons/primary_button.dart';
import '../../../../../../common_widgets/buttons/social_buttons.dart';
import '../../../../../../common_widgets/text_form_field/custom_text_field.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/input_validators.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/auth_screen/auth_view_model.dart';

class SignUpTab extends ConsumerWidget {
  const SignUpTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpProvider);
    final controller = ref.read(signUpProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: 36.h),
                  CustomTextField(
                    label: 'Use Name',
                    controller: controller.usernameController,
                    action: TextInputAction.next,
                    prefixIconPath: Assets.icons.userCircle,
                    validator: (value) =>
                        InputValidators.nameValidator('user name', value),
                  ),

                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'Email',
                    controller: controller.emailController,
                    action: TextInputAction.next,
                    prefixIconPath: Assets.icons.envelope,
                    validator: (value) => InputValidators.emailValidator(value),
                  ),

                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'Password',
                    controller: controller.passwordController,
                    action: TextInputAction.next,
                    isObscure: state.isPasswordObscure,
                    prefixIconPath: Assets.icons.lock,
                    suffixIconPath: state.isPasswordObscure
                        ? Assets.icons.eye
                        : Assets.icons.eyeSlash,
                    suffixIconOnTap: controller.togglePassword,
                    validator: (value) =>
                        InputValidators.passwordValidator(value),
                  ),

                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'Confirm Password',
                    controller: controller.confirmPasswordController,
                    action: TextInputAction.done,
                    isObscure: state.isConfirmPasswordObscure,
                    prefixIconPath: Assets.icons.lock,
                    suffixIconPath: state.isConfirmPasswordObscure
                        ? Assets.icons.eye
                        : Assets.icons.eyeSlash,
                    suffixIconOnTap: controller.toggleConfirmPassword,
                    validator: (value) =>
                        InputValidators.passwordValidator(value),
                  ),

                  SizedBox(height: 16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: state.isChecked,
                        onChanged: (value) {
                          controller.toggleCheckbox(value!);
                        },
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            children: [
                              const TextSpan(text: 'I agree to the '),
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                                // recognizer: TapGestureRecognizer()..onTap = () {
                                //   Navigator.pushNamed(context, RouteNames.terms);
                                // },
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy.',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                                // recognizer: TapGestureRecognizer()..onTap = () {
                                //   Navigator.pushNamed(context, RouteNames.privacy);
                                // },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 36.h),

                  PrimaryButton(
                    onTap: () async {
                      if (state.isChecked) {

                      } else {}
                    },
                    buttonTitle: 'Sign Up',
                    isRounded: true,
                    isOutlined: state.isChecked ? false : true,
                    titleColor: state.isChecked ? Colors.white : AppColors.primary,
                  ),

                  SizedBox(height: 36.h),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.black38, thickness: .75.w),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'or',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Divider(color: Colors.black38, thickness: .75.w),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),
                  SocialButtons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
