import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../domain/usecases/toggle_open_status.dart';

part 'setting_market_state.dart';

class SettingMarketCubit extends Cubit<SettingMarketState> {
  SettingMarketCubit(this.toggleOpenStatusUseCase)
      : super(SettingMarketInitial());

  final ToggleOpenStatus toggleOpenStatusUseCase;

  static SettingMarketCubit of(context) => BlocProvider.of(context);

  bool? toggleOpenStatusVal;

  cacheOpenStatus(){
    toggleOpenStatusVal = AppStorage.getOpenStatusInfo;
  }



  Future toggleOpenStatus() async {
    final res = await toggleOpenStatusUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(SettingMarketInitial());
      },
      (res) async {
        toggleOpenStatusVal = res;
        await AppStorage.cacheOpenStatus(res);
        emit(ToggleOpenStatusState());
      },
    );
  }
}
