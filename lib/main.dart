import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futbit_bloc/presentation/pages/home_page.dart';
import './presentation/router.dart' as router;

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const FutBit());
}

class FutBit extends StatelessWidget {
  const FutBit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FutBit",
      onGenerateRoute: router.generateRoute,
      home: HomePage(),
    );
  }
}
