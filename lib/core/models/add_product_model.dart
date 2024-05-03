import 'dart:io';
import 'package:dio/dio.dart';
import 'property_model.dart';

class AddProductModel {
  final int categoryId;
  final String name;
  final String description;
  final List<File> images;
  final num price;
  num? discount;
  final List<PropertyModel> listOfProperties;

  AddProductModel({
    required this.categoryId,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.discount,
    required this.listOfProperties,
  });

  List<MultipartFile> listOfMultipartFile = [];

  Future<Map<String, dynamic>> toJson() async{
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['description'] = description;
    for (var element in images) {
      data['images[${images.indexOf(element)}]'] = await MultipartFile.fromFile(element.path,
          filename: element.path.split('/').last);
    }
    data['price'] = price;
    data['discount'] = discount;
    for (var element in listOfProperties) {
      data['properties[${listOfProperties.indexOf(element)}][color]'] =
          element.colorController!.text;
      data['properties[${listOfProperties.indexOf(element)}][quantity]'] =
          element.quantityController!.text;
      data['properties[${listOfProperties.indexOf(element)}][size]'] =
          element.size;
    }
    return data;
  }
}
