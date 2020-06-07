import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:ks_locale/ks_locale.dart';
import 'package:legobook/lego_page.dart';
import 'package:lib_lego/lib_lego.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DynamicTheme(
        data: (brightness) => KsTheme.motimLight(),
        themedWidgetBuilder: (context, theme) => MaterialApp(
          localizationsDelegates: L.localizationsDelegates,
          title: 'KodeSmil Lego',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: LegoPage(),
        ),
      );
}
