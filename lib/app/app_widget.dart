import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/mobile/util/routes/named_routes_mobile.dart';
import 'package:projeto_csa_app/app/web/util/routes/named_routes_web.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        minWidth: 370,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(370, name: MOBILE),
        ],
      ),
      routes: kIsWeb ? NamedRoutesWeb.routesWeb : NamedRoutesMobile.routesMobile,
    );
  }
}
