import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/view/user/addresses/domain/repository/base_addresses_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../core/error/exception.dart';

class GetAddresses {
  final BaseAddressesRepository baseAddressesRepository;

  GetAddresses(this.baseAddressesRepository);

  Future<Either<ServerException, AddressesModel>> execute() async {
    return await baseAddressesRepository.getAddress();
  }
}
