import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/models/privacy_policy_model.dart';
import 'package:wein_buyer/view/user/pages/domain/usecases/get_faqs.dart';
import 'package:wein_buyer/view/user/pages/domain/usecases/get_privacy_policy.dart';
import 'package:wein_buyer/view/user/pages/domain/usecases/get_terms.dart';

import '../../../../../../../core/models/fqs_model.dart';
import '../../../../../../../core/models/terms_model.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../../core/models/currencies_model.dart';
import '../../domain/usecases/get_currencies.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PagesState> {
  PagesCubit(this.getFaqsUseCase, this.getPrivacyPolicyUseCase,
      this.getTermsUseCase, this.getCurrenciesUseCase)
      : super(PagesInitial());

  static PagesCubit of(context) => BlocProvider.of(context);

  final GetFaqs getFaqsUseCase;
  final GetPrivacyPolicy getPrivacyPolicyUseCase;
  final GetTerms getTermsUseCase;
  final GetCurrencies getCurrenciesUseCase;

  FqsModel? fqsModel;
  PrivacyPolicyModel? policyModel;
  TermsModel? termsModel;
  CurrenciesModel? currenciesModel;
  Currency? selectedCurrenciesModel;

  Future getTerms() async {
    emit(GetTermsLoading());
    final res = await getTermsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetTermsError());
      },
      (res) async {
        termsModel = res;
        emit(GetTermsLoaded());
      },
    );
  }

  Future getPrivacyPolicy() async {
    emit(GetPrivacyPolicyLoading());
    final res = await getPrivacyPolicyUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetPrivacyPolicyError());
      },
      (res) async {
        policyModel = res;
        emit(GetPrivacyPolicyLoaded());
      },
    );
  }

  Future getFaqs() async {
    emit(GetFaqsLoading());
    final res = await getFaqsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetFaqsError());
      },
      (res) async {
        fqsModel = res;
        emit(GetFaqsLoaded());
      },
    );
  }

  Future getCurrencies() async {
    if ((AppStorage.currency ?? 0) > 0) {
      selectedCurrenciesModel = Currency(id: AppStorage.currency);
    }

    emit(GetCurrenciesLoading());
    final res = await getCurrenciesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetCurrenciesError());
      },
      (res) async {
        currenciesModel = res;
        emit(GetCurrenciesLoaded());
      },
    );
  }

  selectedCurrencies(Currency v) {
    selectedCurrenciesModel = v;
    emit(SelectedCurrenciesState());
  }
}
