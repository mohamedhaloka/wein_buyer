import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/view/provider/product/domain/repository/base_add_product_repository.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/add_product_model.dart';
import '../../../../../../core/models/product_details_model.dart';

class EditProduct {
  final BaseAddProductRepository baseAddProductRepository;

  EditProduct(this.baseAddProductRepository);

  Future<Either<Failure, ProductDetailsModel>> execute(
      AddProductModel addProductModel, int productId) async {
    return await baseAddProductRepository.editProduct(
        addProductModel, productId);
  }
}
