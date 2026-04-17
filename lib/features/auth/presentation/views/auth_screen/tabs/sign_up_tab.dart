import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common_widgets/buttons/primary_button.dart';
import '../../../../../../common_widgets/buttons/social_buttons.dart';
import '../../../../../../common_widgets/loading/wave_loading.dart';
import '../../../../../../common_widgets/text_form_field/custom_text_field.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/input_validators.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/riverpod/sign_up_provider.dart';

class SignUpTab extends ConsumerStatefulWidget {
  const SignUpTab({super.key});

  @override
  ConsumerState<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends ConsumerState<SignUpTab> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpProvider);
    final provider = ref.read(signUpProvider.notifier);

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
                    label: 'User Name',
                    controller: _usernameController,
                    onChanged: (value) => provider.updateUserName(value),
                    action: TextInputAction.next,
                    prefixIconPath: Assets.icons.userCircle,
                    validator: (value) => InputValidators.nameValidator('user name', value),
                  ),

                  SizedBox(height: 16.h),

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
                    action: TextInputAction.next,
                    isObscure: state.isPasswordObscure,
                    prefixIconPath: Assets.icons.lock,
                    suffixIconPath: state.isPasswordObscure
                        ? Assets.icons.eye
                        : Assets.icons.eyeSlash,
                    suffixIconOnTap: provider.togglePassword,
                    validator: (value) => InputValidators.passwordValidator(value),
                  ),

                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'Confirm Password',
                    controller: _confirmPasswordController,
                    onChanged: (value) => provider.updateConfirmPassword(value),
                    action: TextInputAction.done,
                    isObscure: state.isConfirmPasswordObscure,
                    prefixIconPath: Assets.icons.lock,
                    suffixIconPath: state.isConfirmPasswordObscure
                        ? Assets.icons.eye
                        : Assets.icons.eyeSlash,
                    suffixIconOnTap: provider.toggleConfirmPassword,
                    validator: (value) => InputValidators.passwordValidator(value),
                  ),

                  SizedBox(height: 16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: state.isChecked,
                        onChanged: (value) {
                          provider.toggleCheckbox(value!);
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

                  Visibility(
                    visible: !state.isLoading,
                    replacement: const WaveLoading(),
                    child: PrimaryButton(
                      onTap: () async {
                        final error = await provider.signUp();

                        if (error != null) {
                          AppUtils.showToast(error);
                        } else {
                          if (mounted) {
                            DefaultTabController.of(context).animateTo(0);
                          }
                        }
                      },
                      buttonTitle: 'Sign Up',
                      isRounded: true,
                      isOutlined: state.isChecked ? false : true,
                      titleColor: state.isChecked
                          ? Colors.white
                          : AppColors.primary,
                    ),
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
