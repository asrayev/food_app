// ignore: depend_on_referenced_packages
export 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
export 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:food_app/bloc/category/category_bloc.dart';
import 'package:food_app/bloc/food/food_bloc.dart';
import 'package:food_app/ui/splash/splash_page.dart';
import 'package:food_app/utils/tools/file_importer.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabBoxBloc(),),
          BlocProvider(create: (context) => CategoryBloc()..add(CategoryEvent()),),
          BlocProvider(create: (context) => FoodBloc()..add(FoodEvent()),),
        ],
        child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          home: SplashPage(),
         // initialRoute: RouteName.splash,
        );
      },
    );
  }
}