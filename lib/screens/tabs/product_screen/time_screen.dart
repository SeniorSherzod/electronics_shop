import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyAppWidget extends StatefulWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  _MyAppWidgetState createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> with WidgetsBindingObserver {
  // Store initial locale settings here, they are unchanged
  late final String initialDefaultSystemLocale;
  late final List<Locale> initialSystemLocales;

  // Store dynamic changeable locale settings here, they change with the system changes
  late String currentDefaultSystemLocale;
  late List<Locale> currentSystemLocales;

  // Here we read the current locale values
  void setCurrentValues() {
    currentSystemLocales = WidgetsBinding.instance!.window.locales;
    currentDefaultSystemLocale = Platform.localeName;
  }

  @override
  void initState() {
    // This is run when the widget is first time initialized
    WidgetsBinding.instance!.addObserver(this); // Subscribe to changes
    initialSystemLocales = WidgetsBinding.instance!.window.locales;
    initialDefaultSystemLocale = Platform.localeName;
    setCurrentValues();
    super.initState();
  }

  @override
  void didChangeLocales(List<Locale>? locale) {
    // This is run when system locales are changed
    super.didChangeLocales(locale);
    // Update state with the new values and redraw controls
    setState(() {
      setCurrentValues();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Initial system default locale: $initialDefaultSystemLocale.'),
            Text('Initial language code: ${initialDefaultSystemLocale.split('_')[0]}, country code: ${initialDefaultSystemLocale.split('_')[1]}.'),
            Text('Initial system locales:'),
            for (var locale in initialSystemLocales) Text(locale.toString()),
            Text(''),
            Text('Current system default locale: $currentDefaultSystemLocale.'),
            Text('Current system locales:'),
            for (var locale in currentSystemLocales) Text(locale.toString()),
            Text(''),
            Text('Selected application locale: ${Localizations.localeOf(context).toString()}.'),
            Text(''),
            Text('Current date: ${Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.formatFullDate(DateTime.now())}.'),
            Text('Current time zone: ${DateTime.now().timeZoneName} (offset ${DateTime.now().timeZoneOffset.inSeconds/60}).'),
          ],
        ),
      ),
      supportedLocales: [
        const Locale('ru'),
        const Locale('en'),
      ],
      localizationsDelegates: [
        // These are default localization delegates that implement the very basic translations for standard controls and date/time formats.
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
