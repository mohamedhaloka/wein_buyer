import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/returnPolicy/domain/usecases/get_return_policy.dart';

import '../../../../../../widgets/snackBar.dart';
import '../../domain/usecases/update_return_policy.dart';

part 'return_policy_state.dart';

class ReturnPolicyCubit extends Cubit<ReturnPolicyState> {
  ReturnPolicyCubit(this.getReturnPolicyUseCase, this.updateReturnPolicyUseCase)
      : super(ReturnPolicyInitial());

  static ReturnPolicyCubit of(context) => BlocProvider.of(context);
  final GetReturnPolicy getReturnPolicyUseCase;
  final UpdateReturnPolicy updateReturnPolicyUseCase;

  TextEditingController returnPolicyController = TextEditingController();
  bool statueUi = true;

  Future getReturnPolicy() async {
    emit(GetReturnPolicyLoading());
    final res = await getReturnPolicyUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetReturnPolicyError());
      },
      (res) async {
        returnPolicyController.text = res;
        emit(GetReturnPolicyLoaded());
      },
    );
  }

  Future updateReturnPolicy() async {
    emit(UpdateReturnPolicyLoading());
    final res = await updateReturnPolicyUseCase.execute(returnPolicyController.text);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(UpdateReturnPolicyError());
      },
      (res) async {
        showSnackBar(AppStrings.returnPolicyMsg.translate());
        MagicRouter.pop();
        emit(UpdateReturnPolicyLoaded());
      },
    );
  }

  changeStatusUiReturnPolicy() {
    statueUi = !statueUi;
    emit(ChangeStatusUiReturnPolicyState());
  }
}
