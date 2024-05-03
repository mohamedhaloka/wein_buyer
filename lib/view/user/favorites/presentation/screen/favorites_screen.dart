import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/favorites/presentation/controller/favorites_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/favorites_body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(sl(), sl(), sl())..getFavorites(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.favoritesScreen.translate(),
        ),
        body: const FavoritesBody(),
      ),
    );
  }
}
