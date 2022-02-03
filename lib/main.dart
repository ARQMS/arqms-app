import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/app/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

late PackageInfo appInfo;

void main() async {
  // Fixes some "Null check operator used on a null value" Exceptions in
  // flutter and other third part libraries (google_sign_in).
  // https://stackoverflow.com/a/67956117
  WidgetsFlutterBinding.ensureInitialized();

  appInfo = await PackageInfo.fromPlatform();

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Styles
      title: "title".i18n(context),

      // I18n configuration
      supportedLocales: AppLocalizations.supportedLocals,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: AppLocalizations.resolutionCallback,

      // Navigation
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: (setting) => AppNavigator.onGenerateRoute(setting),
    );
  }
}
