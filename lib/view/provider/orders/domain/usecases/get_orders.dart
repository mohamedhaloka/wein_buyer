import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/orders_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import 'package:wein_buyer/core/models/size_guides_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import 'package:wein_buyer/view/provider/sizeGuide/domain/repository/base_size_guide_repository.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/my_rates_model.dart';
import '../repository/base_orders_repository.dart';

class GetOrders {
  final BaseOrdersRepository baseOrdersRepository;

  GetOrders(this.baseOrdersRepository);

  Future<Either<Failure, OrdersModel>> execute(String status) async {
    return await baseOrdersRepository.getOrders(status);
  }
}
