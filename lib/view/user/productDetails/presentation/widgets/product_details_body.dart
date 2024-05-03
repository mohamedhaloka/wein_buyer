import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/img_name_price_product_details_widget.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/return_policy_btn.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/shipping_details_widget.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/similar_products_widget.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/size_guide_btn.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import 'add_to_cart_btn.dart';
import 'colors_sizes_product_details_widget.dart';
import 'general_description_widget.dart';
import 'list_of_reviews_widget.dart';
import 'market_widget.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if(state is GetProductDetailsLoading ||
            ProductDetailsCubit.of(context).productDetailsModel == null){
          return const LoadingIndicator();
        }else{
         return Padding(
           padding: EdgeInsets.symmetric(
             vertical: AppSizes.getProportionateScreenHeight(15),
           ),
           child: Column(
             children: [
               Expanded(
                 child: SingleChildScrollView(
                   child: Center(
                     child: Column(
                       children: [
                         Column(
                           children: [
                             ImgNamePriceProductDetailsWidget(
                               product: ProductDetailsCubit.of(context)
                                   .productDetailsModel!,
                             ),
                             ProductDetailsCubit.of(context)
                                 .productDetailsModel!
                                 .product!
                                 .propertiesMap!
                                 .size!
                                 .isEmpty &&
                                 ProductDetailsCubit.of(context)
                                     .productDetailsModel!
                                     .product!
                                     .propertiesMap!
                                     .color!
                                     .isEmpty
                                 ? const SizedBox()
                                 : Container(
                               height: AppSizes
                                   .getProportionateScreenHeight(40),
                               color: const Color.fromRGBO(
                                   251, 251, 251, 1),
                             ),
                             ProductDetailsCubit.of(context)
                                 .productDetailsModel!.product!.propertiesMap!.size!.isEmpty && ProductDetailsCubit.of(context)
                                 .productDetailsModel!.product!.propertiesMap!.color!.isEmpty
                                 ? const SizedBox()
                                 :  ColorsSizesProductDetailsWidget(
                               product: ProductDetailsCubit.of(context)
                                   .productDetailsModel!,
                             ),
                             // ShippingDetailsWidget(
                             //   product: ProductDetailsCubit.of(context)
                             //       .productDetailsModel!,
                             // ),
                             // SpaceH(inputHeigth: 20),
                             SizeGuideBTN(
                               product: ProductDetailsCubit.of(context)
                                   .productDetailsModel!,
                             ),
                             SpaceH(inputHeigth: 20),
                             ReturnPolicyBTN(
                               product: ProductDetailsCubit.of(context)
                                   .productDetailsModel!,
                             ),
                             SpaceH(inputHeigth: 30),
                             GeneralDescriptionWidget(
                               product: ProductDetailsCubit.of(context)
                                   .productDetailsModel!,
                             ),
                             ProductDetailsCubit.of(context)
                                 .productDetailsModel!
                                 .rates!
                                 .isEmpty
                                 ? const SizedBox()
                                 : Container(
                               height: AppSizes
                                   .getProportionateScreenHeight(30),
                               color: const Color.fromRGBO(
                                   251, 251, 251, 1),
                             ),
                             ProductDetailsCubit.of(context)
                                 .productDetailsModel!
                                 .rates!
                                 .isEmpty
                                 ? const SizedBox()
                                 : ListOfReviewsWidget(
                               product:
                               ProductDetailsCubit.of(context)
                                   .productDetailsModel!,
                             ),
                             Container(
                               height:
                               AppSizes.getProportionateScreenHeight(
                                   30),
                               color:
                               const Color.fromRGBO(251, 251, 251, 1),
                             ),
                             MarketWidget(
                               product: ProductDetailsCubit.of(context)
                                   .productDetailsModel!,
                             ),
                             Container(
                               height:
                               AppSizes.getProportionateScreenHeight(
                                   30),
                               color:
                               const Color.fromRGBO(251, 251, 251, 1),
                             ),
                           ],
                         ),
                         BlocBuilder<ProductDetailsCubit,
                             ProductDetailsState>(
                           builder: (context, state) {
                             return state is GetRelatedProductsLoading
                                 ? const SizedBox()
                                 : SimilarProductsWidget(
                               listOfProduct:
                               ProductDetailsCubit.of(context)
                                   .listOfProduct,
                             );
                           },
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                 builder: (context, state) {
                   return state is GetProductDetailsLoading
                       ? const SizedBox()
                       : AddToCartBTN(
                     productDetailsModel:
                     ProductDetailsCubit.of(context)
                         .productDetailsModel!,
                   );
                 },
               ),
             ],
           ),
         );
        }
      },
    );
  }
}
