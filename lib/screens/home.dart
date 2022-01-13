import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/home_controller.dart';
import 'package:timberr/screens/cart_page.dart';
import 'package:timberr/widgets/bottom_navbar.dart';
import 'package:timberr/widgets/category_tab_bar.dart';
import 'package:timberr/widgets/product_grid_tile.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        selectedPos: 0,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                color: const Color(0xFF808080),
              ),
            ),
            title: Column(
              children: [
                Text(
                  'Make home',
                  style: GoogleFonts.gelasio(
                    color: const Color(0xFF909090),
                    fontSize: 18,
                  ),
                ),
                Text(
                  'BEAUTIFUL',
                  style: GoogleFonts.gelasio(
                    color: const Color(0xFF303030),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(
                    () => CartPage(),
                    transition: Transition.fade,
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icons/cart_icon.svg',
                  color: const Color(0xFF808080),
                ),
              )
            ],
            bottom: CategoryTabBar(),
            floating: true,
            snap: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: Obx(() {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 18,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ProductGridTile(
                      product: _controller.productsList.elementAt(index),
                    );
                  },
                  childCount: _controller.productsList.length,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Hello");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("Suggestion");
  }
}
