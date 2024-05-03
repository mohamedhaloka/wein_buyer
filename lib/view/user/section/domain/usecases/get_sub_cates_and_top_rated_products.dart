import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/sub_categories_model.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/main_categories_model.dart';
import '../repository/base_section_repository.dart';

class GetSubCatesAndTopRatedProducts {
  final BaseSectionRepository baseSectionRepository;

  GetSubCatesAndTopRatedProducts(this.baseSectionRepository);

  Future<Either<Failure, SubCategoriesModel>> execute(int cateId) async {
    return await baseSectionRepository.getSubCatesAndTopRatedProducts(cateId);
  }
}
