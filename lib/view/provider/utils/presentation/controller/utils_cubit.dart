import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/view/provider/utils/domain/usecases/get_sizes.dart';
import 'package:wein_buyer/view/provider/utils/domain/usecases/get_verified_status.dart';

import '../../../../../../core/models/sizes_model.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../../../../core/appStorage/app_storage.dart';

part 'utils_state.dart';

class UtilsCubit extends Cubit<UtilsState> {
  UtilsCubit(this.getSizesUseCase, this.getVerifiedStatusUseCase) : super(UtilsInitial());

  final GetSizes getSizesUseCase;
  final GetVerifiedStatus getVerifiedStatusUseCase;

  static UtilsCubit of(context) => BlocProvider.of(context);

  List<String> listOfSizes = [];

  bool? isVre;

  Future getSizes() async {
    final res = await getSizesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetSizesError());
      },
      (res) async {
        res.body!.forEach((element) {
          listOfSizes.add(element.value??'');
        });
        emit(GetSizesLoaded());
      },
    );
  }

  Future getVerifiedStatus() async {
    emit(GetVerifiedStatusLoading());
    final res = await getVerifiedStatusUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetVerifiedStatusError());
      },
      (res) async {
        isVre = res;
        AppStorage.cacheIsVerified(res);
        emit(GetVerifiedStatusLoaded());
      },
    );
  }
}
