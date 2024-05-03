part of 'addresses_cubit.dart';

@immutable
abstract class AddressesState {}

class AddressesInitial extends AddressesState {}

class AddAddressLoaded extends AddressesState {}
class AddAddressLoading extends AddressesState {}
class AddAddressError extends AddressesState {}

class EditAddressLoaded extends AddressesState {}
class EditAddressLoading extends AddressesState {}
class EditAddressError extends AddressesState {}

class DeleteAddressLoaded extends AddressesState {}
class DeleteAddressLoading extends AddressesState {}
class DeleteAddressError extends AddressesState {}

class GetAddressesLoaded extends AddressesState {}
class GetAddressesLoading extends AddressesState {}
class GetAddressesError extends AddressesState {}

class OnSelectedAddressItemDefaultState extends AddressesState {}
class OnSelectedAddressItemDefaultError extends AddressesState {}
class DeleteAddressItemState extends AddressesState {}
