import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wb_test/model/banner_model.dart';
import 'package:wb_test/model/category_model.dart';
import 'package:wb_test/model/product_model.dart';
import 'package:wb_test/service/api_client.dart';

class HomepageViewModel extends ChangeNotifier {
  final _apiService = ApiClient();
  BannerModel? bannerModel;
  ProductModel? productBestSellersModel;
  CategoryModel? categoryModel;
  ProductModel? productMostPopularModel;
  BannerContent? singleBannerContent;

  int selectedIndex = 0;

  fetchHomePageData() async {
    try {
      final responseData = await _apiService.fetchData();
      bannerModel = BannerModel.fromJson(responseData[0]);
      productBestSellersModel = ProductModel.fromJson(responseData[1]);
      singleBannerContent = BannerContent.fromJson(responseData[2]);
      categoryModel = CategoryModel.fromJson(responseData[3]);
      productMostPopularModel = ProductModel.fromJson(responseData[4]);
    } on Exception catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
