import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/favorites/presentation/controller/favorites_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/product_item.dart';
import '../../../../../core/utils/app_strings.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state is GetFavoritesLoading
            ? const LoadingIndicator()
            : FavoritesCubit.of(context).listOfFavorites.isEmpty
                ? Center(
                  child: Text(
                      AppStrings.favoritesBody.translate(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.fontColor,
                      ),
                    ),
                )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(15),
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent:
                            AppSizes.getProportionateScreenHeight(270),
                      ),
                      itemCount:
                          FavoritesCubit.of(context).listOfFavorites.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ProductItem(
                          product:
                              FavoritesCubit.of(context).listOfFavorites[index],
                        );
                      },
                    ),
                  );
      },
    );
  }
}
