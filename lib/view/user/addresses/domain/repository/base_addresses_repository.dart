import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/addresses_model.dart';
import '../../../../../core/error/exception.dart';

abstract class BaseAddressesRepository {
  Future<Either<Failure, bool>> deleteAddress(int addressId);
  Future<Either<Failure, Address>> makeDefaultAddress(int addressId);
  Future<Either<Failure, Address>> addAddress(double lat , double lng , String address, String nearestAddress, String recipientName , String phone);
  Future<Either<Failure, Address>> editAddress(int addressId ,double lat , double lng , String address, String nearestAddress, String recipientName , String phone);
  Future<Either<ServerException, AddressesModel>> getAddress();
}
