import 'package:easy_cart/gen/fonts.gen.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/injection/main.dart';
import 'package:easy_cart/model/store_detail_model.dart';
import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/routes/new_routes.dart';
import 'package:easy_cart/routes/routes.dart';
import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String googleAdsBox = "googleAdsCount";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingInjection.ensureInitialized();

  // final uc = GetIt.I.get<CartUseCase>();
  // await uc.addAndGetData();
  // await uc.getSingle();

  await Hive.initFlutter();
  MobileAds.instance.initialize();

  Hive.registerAdapter<StoreModel>(store());
  await Hive.openBox<StoreModel>(storeModelName);
  Hive.registerAdapter<StoreDetailModel>(storeDetail());
  await Hive.openBox<StoreDetailModel>(storeDetailModelName);
  Hive.registerAdapter<StoreDetailList>(storeDetailList());
  await Hive.openBox<StoreDetailList>(storeDetailListName);
  await Hive.openBox<int>(googleAdsBox);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Easy Cart',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFFFE4864,
          <int, Color>{
            50: Color(0xFFFCE4EC),
            100: Color(0xFFF8BBD0),
            200: Color(0xFFF48FB1),
            300: Color(0xFFF06292),
            400: Color(0xFFEC407A),
            500: Color(0xFFFE4864),
            600: Color(0xFFD81B60),
            700: Color(0xFFC2185B),
            800: Color(0xFFAD1457),
            900: Color(0xFF880E4F),
          },
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 24.0,
            height: 28 / 24,
            fontWeight: FontWeight.w700,
          ),
          displayMedium: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 20.0,
            height: 28 / 20,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 18.0,
            height: 20 / 18,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 16.0,
            height: 20 / 16,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            height: 20 / 18,
          ),
          titleSmall: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 24 / 16,
          ),
          bodyLarge: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            height: 24 / 16,
          ),
          bodyMedium: TextStyle(
            color: EasyCartColorMap().gray.shade900,
            fontFamilyFallback: const [FontFamily.pretendard],
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            height: 16 / 12,
          ),
        ),
      ),
      locale: const Locale('ko', 'KR'),
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
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

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Custom Animated List')),
//         body: CustomAnimatedList(),
//       ),
//     );
//   }
// }

// class CustomAnimatedList extends StatefulWidget {
//   @override
//   _CustomAnimatedListState createState() => _CustomAnimatedListState();
// }

// class _CustomAnimatedListState extends State<CustomAnimatedList> {
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey();
//   List<Item> _items = List.generate(10, (index) => Item(index));
//   double begin = 0;

//   @override
//   void initState() {
//     begin = _items.length.toDouble();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedList(
//       key: _listKey,
//       initialItemCount: _items.length,
//       itemBuilder: (context, index, animation) {
//         return _buildItem(_items[index], animation);
//       },
//     );
//   }

//   Widget _buildItem(Item item, Animation<double> animation) {
//     return SlideTransition(
//       position: animation.drive(
//         Tween<Offset>(
//           begin: Offset(1, 0),
//           end: Offset(0, 0),
//         ).chain(CurveTween(curve: Curves.easeInOut)),
//       ),
//       child: SizeTransition(
//         sizeFactor: animation.drive(
//           Tween<double>(
//             begin: 0,
//             end: 1,
//           ).chain(CurveTween(curve: Curves.easeInOut)),
//         ),
//         child: ListTile(
//           title: Text('Item ${item.id}'),
//           trailing: IconButton(
//             icon: Icon(Icons.arrow_downward),
//             onPressed: () {
//               setState(() {
//                 int currentIndex = _items.indexOf(item);

//                 _listKey.currentState?.removeItem(currentIndex,
//                     (context, animation) => _buildItem(item, animation),
//                     duration: const Duration(milliseconds: 300));
//                 _items.removeAt(currentIndex);

//                 Future.delayed(const Duration(milliseconds: 300), () {
//                   _listKey.currentState?.insertItem(_items.length);
//                   _items.insert(_items.length, item);
//                 });

//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Item {
//   final int id;
//   bool isSelected;

//   Item(this.id, {this.isSelected = false});
// }
