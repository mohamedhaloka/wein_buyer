part of 'pages_cubit.dart';

@immutable
abstract class PagesState {}

class PagesInitial extends PagesState {}

class GetFaqsLoaded extends PagesState {}

class GetFaqsLoading extends PagesState {}

class GetFaqsError extends PagesState {}

class GetPrivacyPolicyLoaded extends PagesState {}

class GetPrivacyPolicyLoading extends PagesState {}

class GetPrivacyPolicyError extends PagesState {}

class GetTermsLoaded extends PagesState {}

class GetTermsLoading extends PagesState {}

class GetTermsError extends PagesState {}

class GetCurrenciesLoaded extends PagesState {}

class GetCurrenciesLoading extends PagesState {}

class GetCurrenciesError extends PagesState {}
class SelectedCurrenciesState extends PagesState {}
