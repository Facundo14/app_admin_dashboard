import 'package:app_admin_dashboard/provider/user_form_provider.dart';
import 'package:app_admin_dashboard/router/router.dart';
import 'package:app_admin_dashboard/services/navigaton_service.dart';
import 'package:app_admin_dashboard/services/notifications_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_admin_dashboard/provider/users_provider.dart';
import 'package:app_admin_dashboard/models/user_model.dart';
import 'package:app_admin_dashboard/ui/cards/white_card.dart';
import 'package:app_admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:app_admin_dashboard/ui/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;
  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final usersformProvider = Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null) {
        usersformProvider.user = userDB;
        usersformProvider.formKey = GlobalKey<FormState>();
        setState(() => user = userDB);
      } else {
        NavigationService.replaceTo(Flurorouter.usersRoute);
      }
    });
  }

  @override
  void dispose() {
    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Usuario', style: CustomLabels.h1),
          const SizedBox(height: 10),
          if (user == null)
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                child: const CircularProgressIndicator(),
              ),
            ),
          if (user != null) _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(250),
      },
      children: const [
        TableRow(children: [
          //AVATAR
          _AvatarContainer(),
          //Formulario
          _UserViewForm(),
        ])
      ],
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    return WhiteCard(
      width: 250,
      title: 'Informacion general',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: user.nombre,
              onChanged: (value) => userFormProvider.copyUserWith(nombre: value),
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Nombre del usuario', label: 'Nombre', icon: Icons.supervised_user_circle_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) return 'El nombre no debe ser vacio';
                if (value.length < 3) return 'Debe tener mas de 3 caracteres';
                return null; // valido
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: user.correo,
              onChanged: (value) => userFormProvider.copyUserWith(correo: value),
              decoration: CustomInputs.formInputDecoration(
                hint: 'Correo del usuario',
                label: 'Correo',
                icon: Icons.email_outlined,
              ),
              validator: (value) {
                if (!EmailValidator.validate(value ?? '')) return 'Email no válido';
                return null; // valido
              },
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 110),
              child: ElevatedButton(
                  onPressed: () async {
                    final saved = await userFormProvider.updateUser();

                    if (saved) {
                      NotificationsService.showSnackbar('Usuario Actualizado');

                      Provider.of<UsersProvider>(context, listen: false).refreshUser(user);

                      NavigationService.replaceTo(Flurorouter.usersRoute);
                    } else {
                      NotificationsService.showSnackbarError('No se pudo actualizar');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.save_outlined, size: 20),
                      Text(' Guardar'),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  const ClipOval(
                    child: Image(
                      image: AssetImage('no-image.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        child: const Icon(Icons.camera_alt_outlined, size: 20),
                        onPressed: () {
                          //TODO: Seleccionar Imagen
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
