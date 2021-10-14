import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:app_admin_dashboard/ui/buttons/link_text.dart';
import 'package:app_admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.1),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.6),
          child: Form(
            child: Column(
              children: [
                //Nombre
                TextFormField(
                  //validator: (),
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
                  //validator: (),
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
                  //validator: (),
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
                  onPressed: () {
                    //TODO: ir a registro
                  },
                  text: 'Crear cuenta',
                ),

                SizedBox(height: size.height * 0.02),
                LinkText(
                  texto: 'Ir al login',
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
