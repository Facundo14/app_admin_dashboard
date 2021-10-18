import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/services/navigaton_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:app_admin_dashboard/provider/register_form_provider.dart';

import 'package:app_admin_dashboard/router/router.dart';

import 'package:app_admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:app_admin_dashboard/ui/buttons/link_text.dart';
import 'package:app_admin_dashboard/ui/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(
          builder: (BuildContext context) {
            final registerProvider = Provider.of<RegisterFormProvider>(context);
            return Container(
              margin: EdgeInsets.only(top: size.height * 0.1),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width * 0.6),
                  child: Form(
                    key: registerProvider.formKey,
                    child: Column(
                      children: [
                        //Nombre
                        TextFormField(
                          onFieldSubmitted: (_) => onRegisterForm(context, registerProvider),
                          onChanged: (value) => registerProvider.name = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Ingrese su nombre';
                            if (value.length < 3) return 'La contraseña debe tener mas de 3 caracteres';
                            return null; // valido
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: CustromInputs.loginInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.people_alt,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        //Email
                        TextFormField(
                          onFieldSubmitted: (_) => onRegisterForm(context, registerProvider),
                          onChanged: (value) => registerProvider.email = value,
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) return 'Email no válido';
                            return null;
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
                          onFieldSubmitted: (_) => onRegisterForm(context, registerProvider),
                          onChanged: (value) => registerProvider.password = value,
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
                          onPressed: () => onRegisterForm(context, registerProvider),
                          text: 'Crear cuenta',
                          textColor: Colors.blue,
                        ),

                        SizedBox(height: size.height * 0.02),
                        LinkText(
                          texto: 'Ir al login',
                          onPressed: () {
                            NavigationService.replaceTo(Flurorouter.loginRoute);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  void onRegisterForm(BuildContext context, RegisterFormProvider registerProvider) {
    final validForm = registerProvider.validateForm();
    if (!validForm) return;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.register(
      registerProvider.email,
      registerProvider.password,
      registerProvider.name,
    );
  }
}
