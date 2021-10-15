import 'package:app_admin_dashboard/ui/cards/white_card.dart';
import 'package:app_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Blank Page', style: CustomLabels.h1),
        const SizedBox(height: 10),
        const WhiteCard(
          title: 'Página en Blanco',
          child: Text('Construye tu página...'),
        )
      ],
    );
  }
}
