import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wb_test/view/home_page/home_page_view.dart';
import 'package:wb_test/viewmodel/home_page_view_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'model/banner_model.dart';
import 'model/category_model.dart';
import 'model/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDirectory =
  //     await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // Hive.registerAdapter(BannerModelAdapter());
  // Hive.registerAdapter(BannerContentAdapter());
  // Hive.registerAdapter(CategoryModelAdapter());
  // Hive.registerAdapter(CategoryContentAdapter());
  // Hive.registerAdapter(ProductModelAdapter());
  // Hive.registerAdapter(ProductContentAdapter());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomepageViewModel()),
    ],
    child: MaterialApp(home: HomePage()),
  ));
}
