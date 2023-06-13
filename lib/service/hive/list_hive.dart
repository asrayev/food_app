// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';


class SaveBoxService extends HiveObject {
  static final SaveBoxService _instance = SaveBoxService._init();
  static SaveBoxService get instance => _instance;
  SaveBoxService._init();

  Future<int> getIntBox() async {
    final listCountry = await Hive.openBox('sumBox');
    return listCountry.get('allPrice');
  }
  Future<void> addIntBox(int item) async {
    final listBox = await Hive.openBox('sumBox');
    if (listBox.get('allPrice') == null) {
      await listBox.put('allPrice', item);
    }
    int lst = listBox.get('allPrice');
    lst = lst + item;
    await listBox.put('allPrice', lst);
  }

  Future<void> removeIntBox(int item) async {
    final listBox = await Hive.openBox('sumBox');
    if (listBox.get('allPrice') == null) {
      await listBox.put('allPrice', item);
    }
    int lst = listBox.get('allPrice');
    lst = lst - item;
    await listBox.put('allPrice', lst);
  }



  Future<void> addToList(int item) async {
    final listBox = await Hive.openBox('list');
    if (listBox.get('boxList') == null) {
      await listBox.put('boxList', [item]);
    }
    List lst = listBox.get('boxList');
    lst.add(item);
    lst.removeWhere((element) => element == 0);
    await listBox.put('boxList', lst);
  }

  Future<void> removeToList(int item) async {
    final listBox = await Hive.openBox('list');
    if (listBox.get('boxList') == null) {
      await listBox.put('boxList', []);
    }
    List lst = listBox.get('boxList');
    lst.remove(item);
    lst.removeWhere((element) => element == 0);
    await listBox.put('boxList', lst);
  }

  Future<List> getListBox() async {
    final listCountry = await Hive.openBox('list');
    return listCountry.get('boxList');
  }
}