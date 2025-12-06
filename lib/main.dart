import 'package:flutter/material.dart';
import 'package:nike/data/repository/product_repository.dart';
import 'package:nike/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productRepository
        .getAll(0)
        .then((value) {
          debugPrint(value.toString());
        })
        .catchError((e) {
          debugPrint(e.toString());
        });
    final defaultTextStyle = TextStyle(
      fontFamily: 'IranYekan',
      color: LightThemeColors.primaryTextColor,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: defaultTextStyle,
          bodySmall: defaultTextStyle.apply(
            color: LightThemeColors.secondaryTextColor,
          ),
          titleLarge: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        colorScheme: const ColorScheme.light(
          primary: LightThemeColors.primaryColor,
          secondary: LightThemeColors.secondaryColor,
          onSecondary: Colors.white,
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(title: 'فروشگاه نایک'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('دکمه ی پلاس را لمس نمایید'),
            Text(
              'دکمه ی پلاس را لمس نمایید',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
