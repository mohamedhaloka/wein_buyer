import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/models/size_guides_model.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/view/provider/sizeGuide/domain/usecases/add_size_guide.dart';
import 'package:wein_buyer/view/provider/sizeGuide/domain/usecases/edit_size_guide.dart';
import 'package:wein_buyer/view/provider/sizeGuide/domain/usecases/get_size_guide.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../domain/usecases/delete_size_guide.dart';

part 'size_guide_state.dart';

class SizeGuideCubit extends Cubit<SizeGuideState> {
  SizeGuideCubit(this.getSizeGuidesUseCase, this.deleteSizeGuidesUseCase, this.addSizeGuidesUseCase, this.editSizeGuidesUseCase)
      : super(SizeGuideInitial());

  static SizeGuideCubit of(context) => BlocProvider.of(context);

  final GetSizeGuides getSizeGuidesUseCase;
  final AddSizeGuides addSizeGuidesUseCase;
  final EditSizeGuides editSizeGuidesUseCase;
  final DeleteSizeGuides deleteSizeGuidesUseCase;

  List<SizeGuides> listOfSizeGuide = [];

  File? imageSizeGuide;

  TextEditingController nameOfSizeGuideController = TextEditingController();

  Future getSizeGuides() async {
    emit(GetSizeGuideLoading());
    final res = await getSizeGuidesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetSizeGuideError());
      },
      (res) async {
        listOfSizeGuide.clear();
        listOfSizeGuide.addAll(res);
        emit(GetSizeGuideLoaded());
      },
    );
  }

  Future addSizeGuides() async {
    emit(AddSizeGuideLoading());
    final res = await addSizeGuidesUseCase.execute(nameOfSizeGuideController.text , imageSizeGuide!);
    res.fold(
          (err) {
        showSnackBar(err.message);
        emit(AddSizeGuideError());
      },
          (res) async {
        listOfSizeGuide.add(res);
        MagicRouter.pop();
        emit(AddSizeGuideLoaded());
      },
    );
  }

  Future editSizeGuides(int sizeGuideId) async {
    emit(EditSizeGuideLoading());
    final res = await editSizeGuidesUseCase.execute(sizeGuideId ,nameOfSizeGuideController.text , imageSizeGuide!);
    res.fold(
          (err) {
        showSnackBar(err.message);
        emit(EditSizeGuideError());
      },
          (res) async {
        listOfSizeGuide.removeAt(listOfSizeGuide.indexWhere((element) => element.id == sizeGuideId));
        listOfSizeGuide.add(res);
        MagicRouter.pop();
        emit(EditSizeGuideLoaded());
      },
    );
  }

  Future deleteSizeGuides(int sizeGuideId) async {
    emit(DeleteSizeGuideLoading());
    final res = await deleteSizeGuidesUseCase.execute(sizeGuideId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(DeleteSizeGuideError());
      },
      (res) async {
        listOfSizeGuide.removeWhere((element) => element.id == sizeGuideId);
        emit(DeleteSizeGuideLoaded());
      },
    );
  }

  Future selectedImage() async {
    File? image = await AppFunc.getImage();
    if (image != null) {
      imageSizeGuide = image;
      emit(SelectedImageState());
    }
  }
}
