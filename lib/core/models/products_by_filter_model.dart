class ProductsByFilterModel {
  String? maxPrice;
  String? minPrice;
  String? sortBy;
  String? minDistance;
  String? maxDistance;

  ProductsByFilterModel(
      {this.maxPrice,
      this.minPrice,
      this.sortBy,
      this.minDistance,
      this.maxDistance});

  Future<Map<String, dynamic>> toJson() async{
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max_price'] = maxPrice;
    data['min_price'] = minPrice;
    data['sortBy'] = sortBy;
    data['min_distance'] = minDistance;
    data['max_distance'] = maxDistance;

    return data;
  }
}
