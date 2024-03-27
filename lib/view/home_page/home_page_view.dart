import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_test/common/widgets/custom_appbar.dart';
import 'package:wb_test/view/home_page/widgets/banner_widget.dart';
import 'package:wb_test/view/home_page/widgets/category_card.dart';
import 'package:wb_test/view/home_page/widgets/product_card.dart';
import 'package:wb_test/viewmodel/home_page_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomepageViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<HomepageViewModel>(context, listen: false);
    viewModel.fetchHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            buildBottomNavigationBarItem(Icons.home, 'Home'),
            buildBottomNavigationBarItem(Icons.category, 'Category'),
            buildBottomNavigationBarItem(Icons.shopping_cart, 'Cart'),
            buildBottomNavigationBarItem(Icons.local_offer, 'Offers'),
            buildBottomNavigationBarItem(Icons.account_circle, 'Account'),
          ],
          currentIndex: viewModel.selectedIndex,
          selectedItemColor: Colors.green,
          backgroundColor: Colors.green,
          selectedIconTheme: const IconThemeData(color: Colors.green),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          onTap: (index) => viewModel.onItemTapped(index),
        ),
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                BannerWidget(
                    imageUrls: (viewModel.bannerModel?.contents ?? [])
                        .map((e) => e.imageUrl)
                        .toList()),
                const SizedBox(
                  height: 8,
                ),
                headerRowText("Most Popular"),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        (viewModel.productBestSellersModel?.contents ?? [])
                            .length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductListCard(
                        productContent:
                            (viewModel.productBestSellersModel?.contents ??
                                [])[index],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.network(
                  viewModel.singleBannerContent?.imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 8,
                ),
                headerRowText("Categories"),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: (viewModel.categoryModel?.contents ?? []).length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryListCard(
                        categoryContent:
                            (viewModel.categoryModel?.contents ?? [])[index],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                headerRowText("Featured Products"),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        (viewModel.productMostPopularModel?.contents ?? [])
                            .length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductListCard(
                        productContent:
                            (viewModel.productMostPopularModel?.contents ??
                                [])[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white54,
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      label: label,
    );
  }

  Widget headerRowText(String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: const TextStyle(fontSize: 16),
        ),
        GestureDetector(
          child: const Text(
            "view all",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
