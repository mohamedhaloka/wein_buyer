import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/size_guides_model.dart';
import '../../../../../../core/error/failure.dart';

abstract class BaseSizeGuideRepository {
  Future<Either<Failure, List<SizeGuides>>> getSizeGuides();
  Future<Either<Failure, SizeGuides>> addSizeGuide(String name, File image);
  Future<Either<Failure, SizeGuides>> editSizeGuide(int sizeGuideId, String name, File image);
  Future<Either<Failure, bool>> deleteSizeGuide(int sizeGuideId);
}
