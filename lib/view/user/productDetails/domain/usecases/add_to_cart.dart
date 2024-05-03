import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wein_buyer/view/user/productDetails/domain/repository/base_product_details_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/related_products_model.dart';

class AddToCart {
  final BaseProductDetailsRepository baseProductDetailsRepository;

  AddToCart(this.baseProductDetailsRepository);

  Future<Either<Failure, bool>> execute(int productId, int quantity,
      String color, String size, double lat, double lng) async {
    return await baseProductDetailsRepository.addToCart(
        productId, quantity, color, size, lat, lng);
  }
}
