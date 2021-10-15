import 'package:app_admin_dashboard/ui/buttons/links_bar.dart';
import 'package:app_admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:app_admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        //isAlwaysShown: false,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            size.width > 1000 ? _DesktopBody(child: child) : _MobileBody(child: child),
            //LinksBar
            const LinksBar()
          ],
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.95,
      child: Row(
        children: [
          const Expanded(child: BackgroundTwitter()),

          //View Container
          Container(
            width: size.width * 0.4,
            height: size.height,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.01),
                const CustomTitle(),
                SizedBox(height: size.height * 0.01),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02),
          const CustomTitle(),
          SizedBox(
            width: size.width,
            height: size.height * 0.5,
            child: child,
          ),
          SizedBox(
            width: size.width,
            height: size.height * 0.4,
            child: const BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}
