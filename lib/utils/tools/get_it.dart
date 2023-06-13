

import 'package:food_app/utils/tools/file_importer.dart';



final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());


}