import 'package:material_ui/material_ui.dart';

import 'auth_theme.dart';
import 'widgets/bottom_auth_link.dart';
import 'widgets/custom_underline_field.dart';
import 'widgets/primary_auth_button.dart';
import 'widgets/wave_header.dart';

/// Écran d'inscription : en-tête vague + quatre champs soulignés.
class Insciption extends StatefulWidget {
  const Insciption({super.key});

  @override
  State<Insciption> createState() => _InsciptionState();
}

class _InsciptionState extends State<Insciption> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    // TODO(API): POST /api/v1/auth/register puis /auth/email/verify.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WaveHeader(
              height: size.height * 0.30,
              title: 'Sign Up',
              profile: WaveProfile.signUp,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'Hey, Welcome!',
                    style: TextStyle(
                      color: AuthColors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 28),

                  CustomUnderlineField(
                    controller: _usernameController,
                    hintText: 'Username',
                    prefixIcon: Icons.person,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  CustomUnderlineField(
                    controller: _emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.alternate_email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  CustomUnderlineField(
                    controller: _passwordController,
                    hintText: 'Enter 8-digit Password',
                    prefixIcon: Icons.lock,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AuthColors.muted,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  CustomUnderlineField(
                    controller: _confirmController,
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    obscureText: _obscureConfirm,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AuthColors.muted,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() => _obscureConfirm = !_obscureConfirm);
                      },
                    ),
                  ),
                  const SizedBox(height: 36),

                  PrimaryAuthButton(label: 'Sign Up', onPressed: _submit),
                  const SizedBox(height: 18),

                  BottomAuthLink(
                    promptText: 'Already have an account? ',
                    actionText: 'Sign In',
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
