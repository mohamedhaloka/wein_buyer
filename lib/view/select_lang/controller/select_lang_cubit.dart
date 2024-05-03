import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'select_lang_state.dart';

class SelectLangCubit extends Cubit<SelectLangState> {
  SelectLangCubit() : super(SelectLangInitial());

  static SelectLangCubit of(context) => BlocProvider.of(context);

  int index = 0;

  selectedLang(int index){
    this.index = index;
    emit(SelectedLangState());
  }
}
