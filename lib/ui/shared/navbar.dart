import 'package:app_admin_dashboard/provider/sidemenu_provider.dart';
import 'package:app_admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:app_admin_dashboard/ui/shared/widgets/notificaton_indicator.dart';
import 'package:app_admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700) IconButton(icon: const Icon(Icons.menu_outlined), onPressed: () => SideMenuProvider.openMenu()),
          const SizedBox(width: 10),
          if (size.width > 440)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const NotificationIndicator(),
          const SizedBox(width: 10),
          const NavbarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      );
}
