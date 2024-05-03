import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/addresses_model.dart';
import '../../domain/repository/base_addresses_repository.dart';
import '../datasource/addresses_remote_datasource.dart';

class AddressesRepository extends BaseAddressesRepository {
  final BaseAddressesRemoteDatasource baseLoginRemoteDatasource;

  AddressesRepository(this.baseLoginRemoteDatasource);

  @override
  Future<Either<Failure, Address>> makeDefaultAddress(addressId) async {
    try {
      final res = await baseLoginRemoteDatasource.makeDefaultAddress(addressId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAddress(addressId) async {
    try {
      final res = await baseLoginRemoteDatasource.deleteAddress(addressId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, Address>> editAddress(addressId , lat , lng , address, nearestAddress, recipientName , phone) async {
    try {
      final res = await baseLoginRemoteDatasource.editAddress(addressId ,lat, lng, address, nearestAddress, recipientName , phone);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, Address>> addAddress(lat , lng , address, nearestAddress, recipientName , phone) async {
    try {
      final res = await baseLoginRemoteDatasource.addAddress(lat, lng, address, nearestAddress, recipientName , phone);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<ServerException, AddressesModel>> getAddress() async{
    try {
      final res = await baseLoginRemoteDatasource.getAddresses();
      return Right(res);
    } on ServerException catch (e) {
      // String? err;
      // e.errorMessageModel.errors!.forEach((e) {
      //   err = '$e -';
      // });
      return Left(e);
    }
  }
}
