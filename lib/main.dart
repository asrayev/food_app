import 'package:flutter/material.dart';
import 'package:food_app/utils/tools/get_it.dart';
import 'app/app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox("boxList");
  await Hive.openBox("sumBox");
  runApp(const App());
  setup();
}
