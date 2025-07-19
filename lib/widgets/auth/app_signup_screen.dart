import 'package:flutter/material.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

class AppSignupScreen extends StatefulWidget {
  const AppSignupScreen({super.key});

  @override
  State<AppSignupScreen> createState() => _AppSignupScreenState();
}

class _AppSignupScreenState extends State<AppSignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AppScreenBase(
        scrollable: true,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.xxl),
            
            // Logo
            const Center(
              child: AppLogo(),
            ),
            
            SizedBox(height: AppSpacing.xxl),
            
            // Title Section
            AppContentSection(
              title: 'Create Account',
              subtitle: 'Sign up to get started',
              child: const SizedBox.shrink(),
            ),
            
            SizedBox(height: AppSpacing.xl),
            
            // Email Field
            AppTextField(
              controller: _emailController,
              hint: 'Enter your email',
              prefixIcon: Icons.email_outlined,
            ),
            
            SizedBox(height: AppSpacing.md),
            
            // Password Field
            AppTextField(
              controller: _passwordController,
              hint: 'Enter your password',
              prefixIcon: Icons.lock_outlined,
              obscureText: true,
            ),
            
            SizedBox(height: AppSpacing.md),
            
            // Confirm Password Field
            AppTextField(
              controller: _confirmPasswordController,
              hint: 'Confirm your password',
              prefixIcon: Icons.lock_outlined,
              obscureText: true,
            ),
            
            SizedBox(height: AppSpacing.lg),
            
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onPressed: () {
                  // TODO: Implement sign up logic
                },
                label: 'Create Account',
              ),
            ),
            
            SizedBox(height: AppSpacing.xxl),
            
            // Sign In Link
            Center(
              child: RichText(
                text: TextSpan(
                  style: context.textStyle.body2,
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Navigate to sign in
                        },
                        child: Text(
                          'Sign in',
                          style: context.textStyle.body2.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 