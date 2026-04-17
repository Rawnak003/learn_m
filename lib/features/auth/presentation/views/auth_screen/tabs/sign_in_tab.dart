import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_m/core/constants/app_colors.dart';

import '../../../../../../common_widgets/buttons/primary_button.dart';
import '../../../../../../common_widgets/buttons/social_buttons.dart';
import '../../../../../../common_widgets/text_form_field/custom_text_field.dart';
import '../../../../../../core/utils/input_validators.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/riverpod/sign_in_provider.dart';

class SignInTab extends ConsumerStatefulWidget {
  const SignInTab({super.key});

  @override
  ConsumerState<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends ConsumerState<SignInTab> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInProvider);
    final provider = ref.read(signInProvider.notifier);

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
                    label: 'Email',
                    controller: _emailController,
                    onChanged: (value) => provider.updateEmail(value),
                    action: TextInputAction.next,
                    prefixIconPath: Assets.icons.envelope,
                    validator: (value) => InputValidators.emailValidator(value),
                  ),

                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'Password',
                    controller: _passwordController,
                    onChanged: (value) => provider.updatePassword(value),
                    action: TextInputAction.done,
                    isObscure: state.isPasswordObscure,
                    prefixIconPath: Assets.icons.lock,
                    suffixIconPath: state.isPasswordObscure
                        ? Assets.icons.eye
                        : Assets.icons.eyeSlash,
                    suffixIconOnTap: provider.togglePassword,
                    validator: (value) =>
                        InputValidators.passwordValidator(value),
                  ),

                  SizedBox(height: 12.h,),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 36.h),

                  PrimaryButton(
                    onTap: () async {},
                    buttonTitle: 'Sign In',
                    isRounded: true,
                  ),

                  SizedBox(height: 36.h),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.black38, thickness: .75.w),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'or login with',
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
