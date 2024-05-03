import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/view/user/home/presentation/controller/home_cubit.dart';
import 'package:wein_buyer/view/user/home/presentation/widget/free_delivery_section_widget.dart';
import 'package:wein_buyer/view/user/home/presentation/widget/section_slider_widget.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/visitor_screen.dart';

import 'home_app_bar_widget.dart';
import 'image_slider_widget.dart';
import 'offer_section_widget.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeAppBarWidget(),
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is GetHomeDataLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageSliderWidget(
                        slider: HomeCubit.of(context).homeModel!.slider ?? [],
                      ),
                      SectionSliderWidget(
                        categories:
                            HomeCubit.of(context).homeModel!.categories ?? [],
                      ),
                      if(HomeCubit.of(context).homeModel!.offers!.isNotEmpty)
                      OfferSectionWidget(
                        offers: HomeCubit.of(context).homeModel!.offers ?? [],
                      ),
                      if(HomeCubit.of(context).homeModel!.freeDelivery!.isNotEmpty)
                      FreeDeliverySectionWidget(
                        freeDelivery:
                            HomeCubit.of(context).homeModel!.freeDelivery ?? [],
                      ),
                    ],
                  ),
                );
              } else {
                return const LoadingIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}
