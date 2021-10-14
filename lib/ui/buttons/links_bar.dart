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
            onPressed: () => print('about'),
          ),
          LinkText(texto: 'Help Center'),
          LinkText(texto: 'Terms of Service'),
          LinkText(texto: 'Privacy Policy'),
          LinkText(texto: 'Cookie Policy'),
          LinkText(texto: 'Ads Info'),
          LinkText(texto: 'Blog'),
          LinkText(texto: 'Status'),
          LinkText(texto: 'Careers'),
          LinkText(texto: 'Band Resources'),
          LinkText(texto: 'Marketing'),
        ],
      ),
    );
  }
}
