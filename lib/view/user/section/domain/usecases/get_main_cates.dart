import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/main_categories_model.dart';
import '../repository/base_section_repository.dart';

class GetMainCates {
  final BaseSectionRepository baseSectionRepository;

  GetMainCates(this.baseSectionRepository);

  Future<Either<Failure, MainCategoriesModel>> execute() async {
    return await baseSectionRepository.getMainCates();
  }
}
