// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wein_buyer/core/extentions/translate_ext.dart';
// import 'package:wein_buyer/core/utils/app_sizes.dart';
// import 'package:wein_buyer/widgets/space_width.dart';
//
// import '../../../../../../../core/models/product.dart';
// import '../../../../../../../core/models/product_details.dart';
// import '../../../../../../../core/utils/app_colors.dart';
// import '../../../../../../../widgets/space_height.dart';
// import '../../../../../core/utils/app_strings.dart';
//
// class ShippingDetailsWidget extends StatelessWidget {
//   const ShippingDetailsWidget({Key? key, required this.product})
//       : super(key: key);
//
//   final ProductDetails product;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color.fromRGBO(251, 251, 251, 1),
//       padding: EdgeInsets.symmetric(
//         horizontal: AppSizes.getProportionateScreenWidth(25),
//         vertical: AppSizes.getProportionateScreenHeight(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             AppStrings.describeDilaver.translate(),
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.bold,
//               color: AppColors.fontColor,
//             ),
//           ),
//           SpaceH(inputHeigth: 10),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(
//                 Icons.local_shipping,
//                 color: Colors.grey,
//               ),
//               SpaceW(inputWidth: 5),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                       '${AppStrings.addressIn.translate()} ${product.shippingDetails!.deliveryRadius} ${AppStrings.kilo.translate()}'),
//                   SpaceH(inputHeigth: 5),
//                   product.shippingDetails!.canDeliverToUserLocation!
//                       ? const SizedBox()
//                       : Row(
//                           children: [
//                             const Icon(
//                               Icons.error_outline,
//                               color: Colors.red,
//                             ),
//                             SpaceW(inputWidth: 5),
//                              Text(
//                               AppStrings.addressOut.translate(),
//                               style: const TextStyle(
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                 ],
//               ),
//             ],
//           ),
//           SpaceH(inputHeigth: 15),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(
//                 Icons.money,
//                 color: Colors.grey,
//               ),
//               SpaceW(inputWidth: 5),
//               Expanded(
//                 child: Text(
//                     '${AppStrings.howMuchDelivery.translate()}${product.shippingDetails!.deliveryCost} ${AppStrings.pound.translate()}'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
