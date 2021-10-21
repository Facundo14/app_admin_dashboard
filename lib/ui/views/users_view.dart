import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:app_admin_dashboard/provider/providers.dart';

import 'package:app_admin_dashboard/datatables/users_datasource.dart';

import 'package:app_admin_dashboard/ui/labels/custom_labels.dart';

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
              const DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: const Text('Nombre'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = 1;
                    usersProvider.sort<String>((user) => user.nombre);
                  }),
              DataColumn(
                  label: const Text('Correo'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = 2;
                    usersProvider.sort<String>((user) => user.correo);
                  }),
              const DataColumn(label: Text('UID')),
              const DataColumn(label: Text('Acciones')),
            ],
            source: usersDataSource,
            onPageChanged: (page) {},
          )
        ],
      ),
    );
  }
}
