import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/size_guides_model.dart';
import '../../domain/repository/base_size_guide_repository.dart';
import '../datasource/size_guide_remote_datasource.dart';

class SizeGuidesRepository extends BaseSizeGuideRepository {
  final BaseSizeGuideRemoteDatasource baseSizeGuideRemoteDatasource;

  SizeGuidesRepository(this.baseSizeGuideRemoteDatasource);

  @override
  Future<Either<Failure, List<SizeGuides>>> getSizeGuides() async {
    try {
      final res = await baseSizeGuideRemoteDatasource.getSizeGuides();
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
  Future<Either<Failure, SizeGuides>> addSizeGuide(
      String name, File image) async {
    try {
      final res = await baseSizeGuideRemoteDatasource.addSizeGuide(name, image);
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
  Future<Either<Failure, SizeGuides>> editSizeGuide(
      int sizeGuideId, String name, File image) async {
    try {
      final res = await baseSizeGuideRemoteDatasource.editSizeGuide(
          sizeGuideId, name, image);
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
  Future<Either<Failure, bool>> deleteSizeGuide(int sizeGuideId) async {
    try {
      final res =
          await baseSizeGuideRemoteDatasource.deleteSizeGuide(sizeGuideId);
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
