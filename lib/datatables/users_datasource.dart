import 'package:flutter/material.dart';
import 'package:app_admin_dashboard/models/user_model.dart';
import 'package:app_admin_dashboard/services/navigaton_service.dart';

class UsersDTS extends DataTableSource {
  final List<Usuario> users;
  final BuildContext context;

  UsersDTS(this.users, this.context);

  @override
  DataRow getRow(int index) {
    final user = users[index];

    final image = (user.img == '')
        ? const Image(image: AssetImage('no-image.jpg'), width: 35, height: 35)
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!, height: 35, width: 35);
    return DataRow.byIndex(index: index, cells: [
      DataCell(
        ClipOval(
          child: image,
        ),
      ),
      DataCell(Text(user.nombre)),
      DataCell(Text(user.correo)),
      DataCell(Text(user.uid)),
      DataCell(
        IconButton(
            onPressed: () {
              NavigationService.replaceTo('/users/${user.uid}');
            },
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.orange.withOpacity(0.5),
            )),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
