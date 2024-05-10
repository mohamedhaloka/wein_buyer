import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/utils/dynamic_link_provider.dart';
import 'package:wein_buyer/view/provider/market/presentation/widget/edit_title_bottom_sheet.dart';
import 'package:wein_buyer/view/provider/settingsMarket/presentation/controller/setting_market_cubit.dart';
import 'package:wein_buyer/view/provider/settingsMarket/presentation/screen/settings_market_screen.dart';
import 'package:wein_buyer/widgets/custom_button_with_icon.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../widgets/my_painter.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/market_cubit.dart';

class HeaderMarketWidget extends StatelessWidget {
  const HeaderMarketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight * 0.35,
      width: AppSizes.screenWidth,
      child: Stack(
        children: [
          MarketCubit.of(context).profileModel!.user!.header!.isEmpty
              ? Image.asset(
                  AppAssets.marketBackground,
                  width: AppSizes.screenWidth,
                  fit: BoxFit.fill,
                )
              : SizedBox(
                  width: AppSizes.screenWidth,
                  height: double.infinity,
                  child: (MarketCubit.of(context)
                                  .profileModel
                                  ?.user
                                  ?.localHeader
                                  ?.path ??
                              '')
                          .isNotEmpty
                      ? Image.file(
                          MarketCubit.of(context)
                              .profileModel!
                              .user!
                              .localHeader!,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: MarketCubit.of(context)
                                  .profileModel!
                                  .user!
                                  .header ??
                              '',
                          fit: BoxFit.cover,
                        ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: AppSizes.screenWidth,
              height: AppSizes.screenHeight * 0.22,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: CustomClip(),
                          child: Container(
                            width: AppSizes.screenWidth,
                            height: AppSizes.screenHeight * 0.15,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          right: AppSizes.getProportionateScreenWidth(30),
                          top: AppSizes.getProportionateScreenHeight(15),
                          child: InkWell(
                            onTap: () {
                              MarketCubit.of(context)
                                  .selectedHeaderMarket(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(253, 243, 243, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.primaryColor,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.screenWidth,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              SizedBox(
                                height:
                                    AppSizes.getProportionateScreenHeight(105),
                                width:
                                    AppSizes.getProportionateScreenHeight(105),
                              ),
                              if ((MarketCubit.of(context)
                                          .profileModel
                                          ?.user
                                          ?.localImage
                                          ?.path ??
                                      '')
                                  .isNotEmpty) ...[
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  height:
                                      AppSizes.getProportionateScreenHeight(95),
                                  width:
                                      AppSizes.getProportionateScreenHeight(95),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.file(
                                    MarketCubit.of(context)
                                        .profileModel!
                                        .user!
                                        .localImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ] else ...[
                                Container(
                                  height:
                                      AppSizes.getProportionateScreenHeight(95),
                                  width:
                                      AppSizes.getProportionateScreenHeight(95),
                                  decoration: MarketCubit.of(context)
                                          .profileModel!
                                          .user!
                                          .image!
                                          .isEmpty
                                      ? const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppAssets.imageProfile)))
                                      : BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  MarketCubit.of(context)
                                                          .profileModel!
                                                          .user!
                                                          .image ??
                                                      ''))),
                                ),
                              ],
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    MarketCubit.of(context)
                                        .selectedImageMarket(context);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(253, 243, 243, 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppColors.primaryColor,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(flex: 1),
                            Text(
                              MarketCubit.of(context)
                                      .profileModel!
                                      .user!
                                      .storeName ??
                                  '',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.fontColor,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: AppColors.primaryColor,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      builder: (BuildContext cont) {
                                        return BlocProvider.value(
                                          value: MarketCubit.of(context),
                                          child: const EditTitleBottomSheet(),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<SettingMarketCubit, SettingMarketState>(
                          buildWhen: (previous, current) =>
                              previous != current &&
                              current is ToggleOpenStatusState,
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      AppSizes.getProportionateScreenWidth(15),
                                  height:
                                      AppSizes.getProportionateScreenHeight(15),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppStorage.getOpenStatusInfo
                                        ? const Color.fromRGBO(42, 211, 55, 1)
                                        : Colors.red,
                                  ),
                                ),
                                SpaceW(inputWidth: 5),
                                AppStorage.getOpenStatusInfo
                                    ? Text(
                                        AppStrings.openHeaderMarketWidget
                                            .translate(),
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              42, 211, 55, 1),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        AppStrings.closedHeaderMarketWidget
                                            .translate(),
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: AppSizes.getProportionateScreenHeight(45),
            child: Container(
              width: AppSizes.screenWidth,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              String id = MarketCubit.of(context)
                                  .profileModel!
                                  .user!
                                  .id
                                  .toString();
                              DynamicLinkProvider()
                                  .createLink(pro: false, id: id)
                                  .then((value) {
                                Share.share(value);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                AppSizes.getProportionateScreenHeight(5),
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.share,
                                size: 20,
                                color: AppColors.fontColor,
                              ),
                            ),
                          ),
                          SpaceW(inputWidth: 10),
                          CustomButtonWithIcon(
                            text: AppStrings.settingHeaderMarketWidget
                                .translate(),
                            icon: Icons.settings,
                            radius: 25,
                            paddingHorizontal: 8,
                            colorIcon: AppColors.fontColor,
                            fontColor: AppColors.fontColor,
                            buttonColor: Colors.white,
                            paddingVertical: 5,
                            onPress: () {
                              MagicRouter.navigateTo(
                                const SettingsMarketScreen(),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
