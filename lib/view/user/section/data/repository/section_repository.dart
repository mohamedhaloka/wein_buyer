import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/main_categories_model.dart';
import '../../../../../../../core/models/sub_categories_model.dart';
import '../../domain/repository/base_section_repository.dart';
import '../datasource/section_remote_datasource.dart';

class SectionRepository extends BaseSectionRepository {
  final BaseSectionRemoteDatasource baseSectionRemoteDatasource;

  SectionRepository(this.baseSectionRemoteDatasource);

  @override
  Future<Either<Failure, SubCategoriesModel>> getSubCatesAndTopRatedProducts(int cateId) async{
    try {
      final res = await baseSectionRemoteDatasource.getSubCatesAndTopRatedProducts(cateId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, MainCategoriesModel>> getMainCates() async{
    try {
      final res = await baseSectionRemoteDatasource.getMainCates();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }
}
