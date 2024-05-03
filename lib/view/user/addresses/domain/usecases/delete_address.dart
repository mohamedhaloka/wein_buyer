import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/view/user/addresses/domain/repository/base_addresses_repository.dart';
import '../../../../../../../core/error/failure.dart';

class DeleteAddress {
  final BaseAddressesRepository baseAddressesRepository;

  DeleteAddress(this.baseAddressesRepository);

  Future<Either<Failure, bool>> execute({
    required int addressId,
  }) async {
    return await baseAddressesRepository.deleteAddress(addressId);
  }
}
