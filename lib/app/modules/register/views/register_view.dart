import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color _primaryColor = Color(0xFF38B000);
const double _horizontalPadding = 24.0;

enum AccountType { projectManager, karyawan }

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding,
            vertical: 80.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildLogo(),
              const SizedBox(height: 15.0),

              const Text(
                'Create an account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: _primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),

              const _AccountSelectionWidget(),

              const SizedBox(height: 20.0),

              const Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8.0),
              TextFormField(decoration: _inputDecoration()),
              const SizedBox(height: 20.0),

              const Text(
                'Email address',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 20.0),

              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8.0),
              const _PasswordField(),

              const SizedBox(height: 40.0),

              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Sign up tapped');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              Row(
                children: <Widget>[
                  const Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  const Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20.0),

              SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    debugPrint('Continue with Google tapped');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/icon/google.png'),
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    const String _logoAssetPath = 'assets/logo/logo.png';

    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: Image.asset(_logoAssetPath, fit: BoxFit.contain),
      ),
    );
  }

  InputDecoration _inputDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: _primaryColor, width: 2.0),
      ),
    );
  }
}

class _AccountSelectionWidget extends StatefulWidget {
  const _AccountSelectionWidget();

  @override
  State<_AccountSelectionWidget> createState() =>
      _AccountSelectionWidgetState();
}

class _AccountSelectionWidgetState extends State<_AccountSelectionWidget> {
  AccountType? _selectedType = AccountType.projectManager;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize
            .min, 
        children: <Widget>[
          _buildTypeRadio(AccountType.projectManager, 'Project Manager'),
          const SizedBox(width: 10), 
          _buildTypeRadio(AccountType.karyawan, 'Karyawan'),
        ],
      ),
    );
  }

  Widget _buildTypeRadio(AccountType type, String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Radio<AccountType>(
          value: type,
          groupValue: _selectedType,
          activeColor: _primaryColor,
          onChanged: (AccountType? value) {
            setState(() {
              _selectedType = value;
            });
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => __PasswordFieldState();
}

class __PasswordFieldState extends State<_PasswordField> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    final RegisterView parent = context
        .findAncestorWidgetOfExactType<RegisterView>()!;

    return TextFormField(
      obscureText: _isPasswordHidden,
      decoration: parent._inputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordHidden = !_isPasswordHidden;
            });
          },
        ),
      ),
    );
  }
}
