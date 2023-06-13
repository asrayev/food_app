import 'package:flutter/material.dart';
import 'package:food_app/ui/main/widget/app_navigation_bar.dart';
import 'package:food_app/utils/tools/file_importer.dart';
import 'sub_screens/home/home_page.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      SearchPage(),
      BoxPage(),
      ProfilePage(),
    ];
    return Scaffold(
    body: BlocBuilder<TabBoxBloc, TabBoxState>(
              builder: (context, state) => pages[state.index],
            ),
            bottomNavigationBar: const AppNavigationBar(),
          );
  }
}
