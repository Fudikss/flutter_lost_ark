import 'package:lost_ark_flutter/Characters/Provider/Characters_Provider.dart';
import 'package:lost_ark_flutter/Home/Provider/Home_Provider.dart';

import 'Util/Import_Package.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => CharactersProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: Home(),
        ),
      );
  }
}
