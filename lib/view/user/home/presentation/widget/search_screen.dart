import 'package:flutter/material.dart';
import 'package:wein_buyer/core/models/product_details.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/product_details_screen.dart';
import '../../../../../../../core/models/product.dart';

class SearchScreen extends SearchDelegate {
  final List<Product> listOfProducts;

  SearchScreen(this.listOfProducts);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    for (var element in listOfProducts) {
      if (element.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name ?? ''),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchQuery = [];

    for (var element in listOfProducts) {
      if (element.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsScreen(productId: result.id!)));
          },
          child: ListTile(
            title: Text(result.name ?? ''),
          ),
        );
      },
    );
  }
}
