import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/size_guides_model.dart';
import 'package:wein_buyer/view/provider/sizeGuide/domain/repository/base_size_guide_repository.dart';
import '../../../../../../core/error/failure.dart';

class AddSizeGuides {
  final BaseSizeGuideRepository baseSizeGuideRepository;

  AddSizeGuides(this.baseSizeGuideRepository);

  Future<Either<Failure, SizeGuides>> execute(String name , File image) async {
    return await baseSizeGuideRepository.addSizeGuide(name , image);
  }
}
