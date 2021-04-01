import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statusbar_visibility_example/widget/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Show / Hide StatusBar';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: 'Show StatusBar',
                  onClicked: showStatusBar,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Hide StatusBar',
                  onClicked: hideStatusBar,
                ),
              ],
            ),
          ),
        ),
      );

  Future showStatusBar() =>
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  Future hideStatusBar() => SystemChrome.setEnabledSystemUIOverlays([]);
}
