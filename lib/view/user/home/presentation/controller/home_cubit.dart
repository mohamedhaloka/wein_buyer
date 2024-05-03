import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/view/user/home/domain/usecases/get_home_data.dart';

import '../../../../../../../core/models/home_model.dart';
import '../../../../../../../widgets/snackBar.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getHomeDataUseCase) : super(HomeInitial());

  static HomeCubit of(context) => BlocProvider.of(context);

  final GetHomeData getHomeDataUseCase;

  Home? homeModel;

  Future getHomeData() async {
    emit(GetHomeDataLoading());
    final res = await getHomeDataUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetHomeDataError());
      },
      (res) async {
        homeModel = res.body;
        emit(GetHomeDataLoaded());
      },
    );
  }
}
