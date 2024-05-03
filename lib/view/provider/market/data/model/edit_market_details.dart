import 'dart:io';

import 'package:dio/dio.dart';

class EditMarketDetailsModel {
  String? storeName;
  File? image;
  File? header;
  String? address;
  String? location;
  String? description;
  int? currencyId;

  EditMarketDetailsModel({
    this.storeName,
    this.image,
    this.header,
    this.address,
    this.location,
    this.description,
    this.currencyId,
  });

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_name'] = storeName;
    data['image'] = image == null
        ? null
        : await MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last);
    data['header'] = header == null
        ? null
        : await MultipartFile.fromFile(header!.path,
            filename: header!.path.split('/').last);
    data['address'] = address;
    data['location'] = location;
    data['description'] = description;
    data['currency_id'] = currencyId;
    return data;
  }
}
