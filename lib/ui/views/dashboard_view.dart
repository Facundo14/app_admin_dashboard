import 'package:app_admin_dashboard/provider/auth_provider.dart';
import 'package:app_admin_dashboard/ui/cards/white_card.dart';
import 'package:app_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Dashboard View', style: CustomLabels.h1),
        const SizedBox(height: 10),
        WhiteCard(
          title: user!.nombre,
          child: Column(
            children: [
              Text('Correo: ${user.correo}'),
            ],
          ),
        )
      ],
    );
  }
}
