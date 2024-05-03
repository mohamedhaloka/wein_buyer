import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'select_user_state.dart';

class SelectUserCubit extends Cubit<SelectUserState> {
  SelectUserCubit() : super(SelectUserInitial());

  static SelectUserCubit of(context) => BlocProvider.of(context);

  int index = 0;

  selectedTypeUser(int index){
    this.index = index;
    emit(SelectedTypeUserState());
  }
}
