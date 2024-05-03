import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/view/user/addresses/domain/repository/base_addresses_repository.dart';
import '../../../../../../../core/error/failure.dart';

class EditAddress {
  final BaseAddressesRepository baseAddressesRepository;

  EditAddress(this.baseAddressesRepository);

  Future<Either<Failure, Address>> execute({
    required int addressId,
    required double lat,
    required double lng,
    required String address,
    required String nearestAddress,
    required String recipientName,
    required String phone,
  }) async {
    return await baseAddressesRepository.editAddress(
        addressId ,lat, lng, address, nearestAddress, recipientName, phone);
  }
}
