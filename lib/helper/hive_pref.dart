import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref{
  static late Box _box;
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
    _box=Hive.box(name: 'MyData');
  }

  static bool get currentThemeMode => _box.get('currentThemeMode',defaultValue: false);
  static set currentThemeMode(bool v) => _box.put('currentThemeMode', v);
}