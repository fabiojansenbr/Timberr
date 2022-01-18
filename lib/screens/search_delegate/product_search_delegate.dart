import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/services/search_service.dart';
import 'package:timberr/widgets/product_grid_tile.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
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
    return FutureBuilder(
      future: SearchService().searchProduct(query),
      builder: (context, snapshot) {
        List responseList;
        if (snapshot.connectionState == ConnectionState.done) {
          try {
            responseList = snapshot.data as List;
            if (responseList.isEmpty) {
              return Center(
                child: Text(
                  "No Matching Products Found 🥺",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    color: const Color(0xFF808080),
                  ),
                ),
              );
            } else {
              List<Product> productList = responseList
                  .map((productResponse) => Product.fromJson(productResponse))
                  .toList();
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 18,
                ),
                itemBuilder: (context, index) {
                  return ProductGridTile(
                    product: productList[index],
                    heroMode: false,
                  );
                },
              );
            }
          } catch (e) {
            //in case no response is received
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF303030),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
