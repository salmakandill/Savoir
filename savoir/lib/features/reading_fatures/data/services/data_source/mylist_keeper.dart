import 'package:hive_flutter/hive_flutter.dart';
import 'package:savoir/features/reading_fatures/data/models/my_list_model.dart';

class MylistKeeper {
  static late Box<MyListModel> myListBox;
  static const String boxName = 'my_list';
  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MyListModelAdapter());
    }
    myListBox = await Hive.openBox<MyListModel>(boxName);
  }

  static List<MyListModel> getMyList() {
    return myListBox.values.toList();
  }
}
