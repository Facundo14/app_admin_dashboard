import 'package:app_admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:app_admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_admin_dashboard/provider/categories_provider.dart';

import 'package:app_admin_dashboard/datatables/categories_datasource.dart';
import 'package:app_admin_dashboard/ui/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int rowPerPage = 10;
  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final listaCategorias = categoriesProvider.categorias;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categorias', style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            header: const Text('Listado de categorias', maxLines: 2),
            onRowsPerPageChanged: (value) => setState(() => rowPerPage = value ?? 10),
            rowsPerPage: rowPerPage,
            actions: [
              CustomIconButton(
                onPressed: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => const CategoryModal(),
                ),
                text: ' Crear',
                icon: Icons.add_outlined,
              ),
            ],
            sortColumnIndex: 1,
            showCheckboxColumn: false,
            source: CategoriesDTS(listaCategorias, context),
          )
        ],
      ),
    );
  }
}
