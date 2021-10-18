import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/provider/login_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:app_admin_dashboard/ui/buttons/link_text.dart';
import 'package:app_admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (BuildContext context) {
          final loginProvider = Provider.of<LoginFormProvider>(context);
          return Container(
            margin: EdgeInsets.only(top: size.height * 0.1),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.6),
                child: Form(
                  key: loginProvider.formKey,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        onFieldSubmitted: (_) => onFormSubmit(loginProvider, authProvider),
                        onChanged: (value) => loginProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) return 'Email no válido';
                          return null; // valido
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: CustromInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      //Password
                      TextFormField(
                        onFieldSubmitted: (_) => onFormSubmit(loginProvider, authProvider),
                        onChanged: (value) => loginProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su contraseña';
                          if (value.length < 6) return 'La contraseña debe tener mas de 6 caracteres';
                          return null; // valido
                        },
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustromInputs.loginInputDecoration(
                          hint: '***********',
                          label: 'Contraseña',
                          icon: Icons.lock_open_outlined,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      CustomOutlinedButton(
                        onPressed: () => onFormSubmit(loginProvider, authProvider),
                        text: 'Ingresar',
                      ),

                      SizedBox(height: size.height * 0.02),
                      LinkText(
                        texto: 'Nueva Cuenta',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.registerRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onFormSubmit(LoginFormProvider loginProvider, AuthProvider authProvider) {
    final isValid = loginProvider.validateForm();
    if (isValid) authProvider.login(loginProvider.email, loginProvider.password);
  }
}
