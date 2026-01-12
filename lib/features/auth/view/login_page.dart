import 'package:che_cucino/core/di/injector.dart';
import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:che_cucino/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeader(context),
              const SizedBox(height: 48),
              _buildLoginForm(context),
              const SizedBox(height: 24),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(
          Icons.skillet_outlined,
          size: 80,
          color: theme.primaryColor,
        ),
        const SizedBox(height: 24),
        Text(
          'CheCucino',
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Fresh ideas, zero waste.',
          style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onBackground.withOpacity(0.6)),
        ),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        _buildNeoTextField(
          controller: _emailController,
          labelText: 'Email or username',
          prefixIcon: Icons.alternate_email,
        ),
        const SizedBox(height: 16),
        _buildNeoTextField(
          controller: _passwordController,
          labelText: 'Password',
          prefixIcon: Icons.lock_open,
          suffixIcon: Icons.visibility,
          obscureText: true,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('Forgot password?'),
          ),
        ),
        const SizedBox(height: 24),
        NeoButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  AuthLoginRequested(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
          },
          child: const Text('Log in'),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'or',
                style: theme.textTheme.bodySmall,
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 24),
        NeoButton(
          onPressed: () {},
          child: const Text('Create an account'),
        ),
      ],
    );
  }

  Widget _buildNeoTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    IconData? suffixIcon,
    bool obscureText = false,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final shadowColor1 = isDarkMode ? const Color(0xFF151714) : const Color(0xFFD1D3CB);
    final shadowColor2 = isDarkMode ? const Color(0xFF292D28) : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: shadowColor1,
            offset: const Offset(5, 5),
            blurRadius: 10,
            spreadRadius: -5,
          ),
          BoxShadow(
            color: shadowColor2,
            offset: const Offset(-5, -5),
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
