import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/deliveryCost/domain/usecases/get_delivery_cost.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../data/models/delivery_cost_services_model.dart';
import '../../domain/usecases/update_delivery_cost.dart';

part 'delivery_cost_state.dart';

class DeliveryCostCubit extends Cubit<DeliveryCostState> {
  DeliveryCostCubit(this.getDeliveryCostUseCase, this.updateDeliveryCostUseCase)
      : super(DeliveryCostInitial());

  static DeliveryCostCubit of(context) => BlocProvider.of(context);
  final GetDeliveryCost getDeliveryCostUseCase;
  final UpdateDeliveryCost updateDeliveryCostUseCase;

  final formKey = GlobalKey<FormState>();
  final aroundMeMinController = TextEditingController(text: '0');
  final aroundMeMaxController = TextEditingController();
  final aroundMePriceController = TextEditingController();
  final localeMinController = TextEditingController();
  final localeMaxController = TextEditingController();
  final localePriceController = TextEditingController();
  final domesticMinController = TextEditingController();
  final domesticMaxController = TextEditingController();
  final domesticPriceController = TextEditingController();

  bool statueUi = true;

  Future getDeliveryCost() async {
    emit(GetDeliveryCostLoading());
    final res = await getDeliveryCostUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetDeliveryCostError());
      },
      (res) async {
        aroundMeMinController.text = res.aroundMe!.min.toString();
        aroundMeMaxController.text = res.aroundMe!.max.toString();
        aroundMePriceController.text = res.aroundMe!.price.toString();
        localeMinController.text = res.locale!.min.toString();
        localeMaxController.text = res.locale!.max.toString();
        localePriceController.text = res.locale!.price.toString();
        domesticMinController.text = res.domestic!.min.toString();
        domesticMaxController.text = res.domestic!.max.toString();
        domesticPriceController.text = res.domestic!.price.toString();
        emit(GetDeliveryCostLoaded());
      },
    );
  }

  Future updateDeliveryCost() async {
    if(formKey.currentState!.validate()){
      DeliveryCostServicesModel deliveryCostServicesModel =
      DeliveryCostServicesModel(
        aroundMeMin: num.parse(aroundMeMinController.text),
        aroundMeMax: num.parse(aroundMeMaxController.text),
        aroundMePrice: num.parse(aroundMePriceController.text),
        localeMin: num.parse(localeMinController.text),
        localeMax: num.parse(localeMaxController.text),
        localePrice: num.parse(localePriceController.text),
        domesticMin: num.parse(domesticMinController.text),
        domesticMax: num.parse(domesticMaxController.text),
        domesticPrice: num.parse(domesticPriceController.text),
      );
      emit(UpdateDeliveryCostLoading());
      final res =
      await updateDeliveryCostUseCase.execute(deliveryCostServicesModel);
      res.fold(
            (err) {
          showSnackBar(err.message);
          emit(UpdateDeliveryCostError());
        },
            (res) async {
          showSnackBar(AppStrings.deliveryCostMsg.translate());
          MagicRouter.pop();
          emit(UpdateDeliveryCostLoaded());
        },
      );
    }
  }

  changeStatusUiDeliveryCost() {
    statueUi = !statueUi;
    emit(ChangeStatusUiDeliveryCostState());
  }
}
