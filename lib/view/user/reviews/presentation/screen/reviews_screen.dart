import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/products_body.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key, required this.rate}) : super(key: key);

  final List<Rates> rate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.comments.translate(),
      ),
      body: ReviewsBody(
        rate: rate,
      ),
    );
  }
}
