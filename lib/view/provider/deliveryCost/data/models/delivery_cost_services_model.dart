class DeliveryCostServicesModel {
  final num aroundMeMin;
  final num aroundMeMax;
  final num aroundMePrice;
  final num localeMin;
  final num localeMax;
  final num localePrice;
  final num domesticMin;
  final num domesticMax;
  final num domesticPrice;

  DeliveryCostServicesModel({
    required this.aroundMeMin,
    required this.aroundMeMax,
    required this.aroundMePrice,
    required this.localeMin,
    required this.localeMax,
    required this.localePrice,
    required this.domesticMin,
    required this.domesticMax,
    required this.domesticPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      "around_me": {
        "min": aroundMeMin,
        "max": aroundMeMax,
        "price": aroundMePrice,
      },
      "locale": {
        "min": localeMin,
        "max": localeMax,
        "price": localePrice,
      },
      "domestic": {
        "min": domesticMin,
        "max": domesticMax,
        "price": domesticPrice,
      },
    };
  }
}
