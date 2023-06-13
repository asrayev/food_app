import 'package:flutter/material.dart';
import 'package:food_app/ui/main/main_page.dart';
import 'package:food_app/ui/main/sub_screens/home/home_page.dart';
import '../../utils/tools/file_importer.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

@override
  void initState() {
    goNext();
    super.initState();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then(
          (value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainPage()));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
