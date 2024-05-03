import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/editProfileUser/presentation/controller/edit_profile_cubit.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(20),
        horizontal: AppSizes.getProportionateScreenWidth(30),
      ),
      child: Form(
        key: EditProfileCubit.of(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputFormField(
              hint: AppStrings.oldPassword.translate(),
              icon: Icons.lock_open,
              fillColor: Colors.white,
              secure: true,
              controller: EditProfileCubit.of(context).oldPassController,
              validator: Validator.password,
            ),
            SpaceH(inputHeigth: 10),
            InputFormField(
              hint: AppStrings.newPassword.translate(),
              icon: Icons.lock_open,
              fillColor: Colors.white,
              secure: true,
              controller: EditProfileCubit.of(context).newPassController,
              validator: Validator.password,
            ),
            SpaceH(inputHeigth: 10),
            InputFormField(
              hint: AppStrings.confirmPassword.translate(),
              icon: Icons.lock_open,
              fillColor: Colors.white,
              secure: true,
              controller: EditProfileCubit.of(context).confirmPassController,
              validator: (value)=> Validator.confirmPassword(
                  value, EditProfileCubit.of(context).newPassController.text),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: AppSizes.getProportionateScreenHeight(50),
                  child: CustomButton(
                    text: AppStrings.save.translate(),
                    onPress: () {
                      EditProfileCubit.of(context).updatePassword(context);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
