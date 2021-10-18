import 'package:app_admin_dashboard/ui/cards/white_card.dart';
import 'package:app_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconView extends StatelessWidget {
  const IconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(width: 170, titleCenter: true, title: 'ac_unit_outlined', child: Center(child: Icon(Icons.ac_unit_outlined))),
              WhiteCard(
                  width: 170,
                  titleCenter: true,
                  title: 'accessible_forward_rounded',
                  child: Center(child: Icon(Icons.accessible_forward_rounded))),
              WhiteCard(width: 170, titleCenter: true, title: 'ad_units_rounded', child: Center(child: Icon(Icons.ad_units_rounded))),
              WhiteCard(
                  width: 170, titleCenter: true, title: 'account_tree_outlined', child: Center(child: Icon(Icons.account_tree_outlined))),
              WhiteCard(
                  width: 170, titleCenter: true, title: 'face_retouching_natural', child: Center(child: Icon(Icons.face_retouching_natural))),
              WhiteCard(width: 170, titleCenter: true, title: 'hail', child: Center(child: Icon(Icons.hail))),
              WhiteCard(width: 170, titleCenter: true, title: 'offline_share', child: Center(child: Icon(Icons.offline_share))),
              WhiteCard(width: 170, titleCenter: true, title: 'icecream', child: Center(child: Icon(Icons.icecream))),
              WhiteCard(width: 170, titleCenter: true, title: 'yard_sharp', child: Center(child: Icon(Icons.yard_sharp))),
              WhiteCard(width: 170, titleCenter: true, title: 'radar_sharp', child: Center(child: Icon(Icons.radar_sharp))),
              WhiteCard(width: 170, titleCenter: true, title: 'earbuds', child: Center(child: Icon(Icons.earbuds))),
              WhiteCard(width: 170, titleCenter: true, title: 'backpack_outlined', child: Center(child: Icon(Icons.backpack_outlined))),
              WhiteCard(width: 170, titleCenter: true, title: 'sailing_outlined', child: Center(child: Icon(Icons.sailing_outlined))),
              WhiteCard(width: 170, titleCenter: true, title: 'zoom_out_map', child: Center(child: Icon(Icons.zoom_out_map))),
            ],
          )
        ],
      ),
    );
  }
}
