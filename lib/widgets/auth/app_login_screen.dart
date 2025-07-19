import 'package:flutter/material.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

class AppLoginScreen extends StatefulWidget {
  const AppLoginScreen({super.key});

  @override
  State<AppLoginScreen> createState() => _AppLoginScreenState();
}

class _AppLoginScreenState extends State<AppLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
              title: 'Welcome back',
              subtitle: 'Sign in to your account',
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
            
            // Remember Me & Forgot Password
            Padding(
              padding: AppSpacing.xsPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        activeColor: context.colors.primary,
                      ),
                      Text(
                        'Remember me',
                        style: context.textStyle.body2,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement forgot password logic
                    },
                    child: Text(
                      'Forgot Password',
                      style: context.textStyle.body2.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: AppSpacing.lg),
            
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onPressed: () {
                  // TODO: Implement login logic
                },
                label: 'Sign In',
              ),
            ),
            
            SizedBox(height: AppSpacing.xxl),
            
            // Sign Up Link
            Center(
              child: RichText(
                text: TextSpan(
                  style: context.textStyle.body2,
                  children: [
                    const TextSpan(text: "Don't have an account? "),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Navigate to sign up
                        },
                        child: Text(
                          'Sign up',
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