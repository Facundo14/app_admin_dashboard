import 'package:app_admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.width > 1000 ? size.height * 0.07 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            texto: 'About',
            onPressed: () {},
          ),
          const LinkText(texto: 'Help Center'),
          const LinkText(texto: 'Terms of Service'),
          const LinkText(texto: 'Privacy Policy'),
          const LinkText(texto: 'Cookie Policy'),
          const LinkText(texto: 'Ads Info'),
          const LinkText(texto: 'Blog'),
          const LinkText(texto: 'Status'),
          const LinkText(texto: 'Careers'),
          const LinkText(texto: 'Band Resources'),
          const LinkText(texto: 'Marketing'),
        ],
      ),
    );
  }
}
