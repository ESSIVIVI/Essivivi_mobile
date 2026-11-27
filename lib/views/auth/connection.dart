import 'package:material_ui/material_ui.dart';

import 'auth_theme.dart';
import 'inscription.dart';
import 'widgets/bottom_auth_link.dart';
import 'widgets/custom_underline_field.dart';
import 'widgets/primary_auth_button.dart';
import 'widgets/wave_header.dart';

/// Écran de connexion : en-tête vague + champs soulignés + options.
class Connection extends StatefulWidget {
  const Connection({super.key});

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    // TODO(API): POST /api/v1/auth/login {email: username, password}
    // Gérer ensuite le retour « two_factor_required » et stocker les tokens.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WaveHeader(
              height: size.height * 0.36,
              title: 'Sign In',
              profile: WaveProfile.signIn,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: AuthColors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 36),

                  CustomUnderlineField(
                    controller: _usernameController,
                    hintText: 'Username',
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),

                  CustomUnderlineField(
                    controller: _passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
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
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() => _rememberMe = value ?? false);
                              },
                              side: const BorderSide(
                                color: AuthColors.muted,
                                width: 1.2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              fillColor:
                                  WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return AuthColors.green;
                                }
                                return Colors.transparent;
                              }),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Remember me',
                            style: TextStyle(color: AuthColors.muted, fontSize: 12),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO(API): écran « mot de passe oublié ».
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: AuthColors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),

                  PrimaryAuthButton(label: 'Log In', onPressed: _submit),
                  const SizedBox(height: 18),

                  BottomAuthLink(
                    promptText: "Don't have an account? ",
                    actionText: 'Signup',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Insciption()),
                      );
                    },
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
