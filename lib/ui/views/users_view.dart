import 'package:app_admin_dashboard/datatables/users_datasource.dart';
import 'package:app_admin_dashboard/provider/users_provider.dart';
import 'package:app_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users, context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Usuarios', style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = 1;
                    usersProvider.sort<String>((user) => user.nombre);
                  }),
              DataColumn(
                  label: Text('Correo'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = 2;
                    usersProvider.sort<String>((user) => user.correo);
                  }),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Acciones')),
            ],
            source: usersDataSource,
            onPageChanged: (page) {},
          )
        ],
      ),
    );
  }
}
