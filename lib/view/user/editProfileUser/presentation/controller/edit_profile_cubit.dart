import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import 'package:wein_buyer/view/user/editProfileUser/data/model/edit_profile_data_model.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/usecases/get_profile_data_user.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/usecases/update_password.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/usecases/update_profile_data.dart';

import '../../../../../../../core/utils/app_enums.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../../core/appStorage/app_storage.dart';
import '../../../../../core/models/profile_model.dart';
import '../../domain/usecases/delete_account.dart';
import '../widget/change_password_bottom_sheet.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.getProfileDataUseCase, this.updateProfileDataUseCase,
      this.updatePasswordUseCase, this.deleteAccountUseCase)
      : super(EditProfileInitial());

  final GetProfileDataUser getProfileDataUseCase;
  final UpdateProfileData updateProfileDataUseCase;
  final UpdatePassword updatePasswordUseCase;
  final DeleteAccount deleteAccountUseCase;

  static EditProfileCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final birthdayController = TextEditingController();

  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  File? imageProfileFile;
  String? imageProfileNetwork;

  Gender? genderProfile;

  ProfileModel? profileModel;

  selectedImageProfile() async {
    File? image = await AppFunc.getImage();
    if (image == null) return;
    imageProfileFile = image;
    emit(SelectedImageProfile());
  }

  changeGenderProfile(Gender gender) {
    genderProfile = gender;
    emit(ChangeGenderProfile());
  }

  Future getProfileData() async {
    emit(GetProfileLoading());
    final res = await getProfileDataUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetProfileError());
      },
      (res) async {
        profileModel = res;
        firstNameController.text = res.body!.firstName ?? '';
        lastNameController.text = res.body!.lastName ?? '';
        emailController.text = res.body!.email ?? '';
        phoneController.text = res.body!.phone ?? '';
        birthdayController.text = res.body!.birthYear ?? '';
        imageProfileNetwork = res.body!.image ?? '';
        genderProfile = res.body!.gender == 'M' ? Gender.M : Gender.F;
        emit(GetProfileLoaded());
      },
    );
  }

  Future updateProfileData() async {
    if (formKey.currentState!.validate()) {
      emit(EditProfileLoading());
      final res = await updateProfileDataUseCase.execute(EditProfileDataModel(
        firstNameController.text,
        lastNameController.text,
        phoneController.text,
        emailController.text,
        birthdayController.text,
        genderProfile == Gender.F ? 'F' : 'M',
        imageProfileFile,
      ));
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(EditProfileError());
        },
        (res) async {
          showSnackBar(AppStrings.editAccountMsg.translate());
          MagicRouter.navigateAndPopAll(BottomNavUserScreen(selectedIndex: 0));
          emit(EditProfileLoaded());
        },
      );
    }
  }

  Future updatePassword(context) async {
    if (formKey.currentState!.validate()) {
      emit(EditPasswordLoading());
      final res = await updatePasswordUseCase.execute(
        oldPassController.text,
        newPassController.text,
        confirmPassController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(EditPasswordError());
        },
        (res) async {
          if (res) {
            MagicRouter.navigateAndPopAll(
                BottomNavUserScreen(selectedIndex: 0));
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              builder: (BuildContext context) {
                return const ChangePasswordBottomSheet();
              },
            );
          }
          emit(EditPasswordLoaded());
        },
      );
    }
  }

  Future deleteAccount() async {
    emit(EditPasswordLoading());
    final res = await deleteAccountUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(EditPasswordError());
      },
      (res) async {
        AppStorage.deleteAccount();
        emit(EditPasswordLoaded());
      },
    );
  }
}
