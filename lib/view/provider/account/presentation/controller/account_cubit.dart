import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/account/domain/usecases/contactUs.dart';
import 'package:wein_buyer/view/provider/account/domain/usecases/delete_account_provider.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../../../../core/appStorage/app_storage.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../select_user/presentation/screens/select_user_screen.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.contactUsUseCase, this.deleteAccountUseCase)
      : super(AccountInitial());

  final ContactUs contactUsUseCase;
  final DeleteAccountProvider deleteAccountUseCase;

  static AccountCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final msgController = TextEditingController();

  Future contactUs() async {
    if (formKey.currentState!.validate()) {
      emit(ContactUsLoading());
      final res = await contactUsUseCase.execute(nameController.text,
          emailController.text, phoneController.text, msgController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(ContactUsError());
        },
        (res) async {
          emit(ContactUsLoaded());
          showSnackBar(AppStrings.contactUsMsg.translate());
          MagicRouter.pop();
        },
      );
    }
  }

  Future deleteAccount() async {
    emit(ContactUsLoading());
    final res = await deleteAccountUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ContactUsError());
      },
      (res) async {
        AppStorage.deleteAccount();
        emit(ContactUsLoaded());
      },
    );
  }

  showAlertDialog(
      {required BuildContext context,
      required String title,
      required String contentMessage}) {
    Widget cancelButton = MaterialButton(
      height: AppSizes.getProportionateScreenHeight(45),
      onPressed: () => Navigator.of(context).pop(),
      color: Colors.white,
      child: const Text('no'),
    );

    Widget okButton = MaterialButton(
      height: AppSizes.getProportionateScreenHeight(45),
      onPressed: () => deleteAccount(),
      color: Colors.white,
      child: const Text('yes'),
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
      ),
      content: Text(
        contentMessage,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primaryColor, fontSize: 17.sp),
      ),
      actions: [
        cancelButton,
        SizedBox(
          width: AppSizes.getProportionateScreenWidth(10),
        ),
        okButton
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => alert,
    );
  }
}
