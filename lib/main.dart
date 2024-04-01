import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';
import 'package:test_flutter/routes/route_config.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyRouter.initialLocation = "/";
    // MyRouter.initialLocation = '/${RouteConstants.jokeRouteName}/add';
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppTheme.grey,
        textTheme: AppTheme.textTheme,
      ),
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: MyRouter().router,
      // home: const HomePage(),
    );
  }
}
