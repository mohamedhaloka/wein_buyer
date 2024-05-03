import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/account/presentation/controller/account_cubit.dart';
import '../../../../../../core/services/services_locator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/contact_us_body.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(sl(), sl()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(AppStrings.contactUsTitle.translate()),
          leading: IconButton(
            icon: const Icon (
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const ContactUsBody(),
      ),
    );
  }
}
