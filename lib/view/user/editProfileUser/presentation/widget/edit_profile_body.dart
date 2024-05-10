import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/user/editProfileUser/presentation/controller/edit_profile_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_enums.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import '../screen/change_password_screen.dart';
import 'delete_account_bottom_sheet.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) =>
          previous != current ||
          current is GetProfileLoaded ||
          current is SelectedImageProfile ||
          current is ChangeGenderProfile,
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.getProportionateScreenHeight(20),
                horizontal: AppSizes.getProportionateScreenWidth(30),
              ),
              child: Lottie.asset(AppAssets.loadingLottie),
            ),
          );
        } else {
          return Form(
            key: EditProfileCubit.of(context).formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.getProportionateScreenHeight(20),
                horizontal: AppSizes.getProportionateScreenWidth(30),
              ),
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      state is SelectedImageProfile
                          ? Container(
                              width: AppSizes.getProportionateScreenWidth(100),
                              height: AppSizes.getProportionateScreenWidth(100),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.GrayColor161,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(EditProfileCubit.of(context)
                                      .imageProfileFile!),
                                ),
                              ),
                            )
                          : Container(
                              width: AppSizes.getProportionateScreenWidth(100),
                              height: AppSizes.getProportionateScreenWidth(100),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.GrayColor161,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      EditProfileCubit.of(context)
                                              .imageProfileNetwork ??
                                          ''),
                                ),
                              ),
                            ),
                      PositionedDirectional(
                        bottom: 0,
                        start: 0,
                        child: InkWell(
                          onTap: () {
                            EditProfileCubit.of(context).selectedImageProfile();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SpaceH(inputHeigth: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InputFormField(
                        hint: AppStrings.firstName.translate(),
                        icon: Icons.person_outline,
                        fillColor: Colors.white,
                        validator: (v) => Validator.generalField(v),
                        controller:
                            EditProfileCubit.of(context).firstNameController,
                      ),
                    ),
                    SpaceW(inputWidth: 10),
                    Expanded(
                      flex: 1,
                      child: InputFormField(
                        hint: AppStrings.secondName.translate(),
                        icon: Icons.person_outline,
                        fillColor: Colors.white,
                        validator: (v) => Validator.generalField(v),
                        controller:
                            EditProfileCubit.of(context).lastNameController,
                      ),
                    ),
                  ],
                ),
                SpaceH(inputHeigth: 10),
                InputFormField(
                  hint: AppStrings.emailChoose.translate(),
                  icon: Icons.email_outlined,
                  fillColor: Colors.white,
                  controller: EditProfileCubit.of(context).emailController,
                ),
                SpaceH(inputHeigth: 10),
                InputFormField(
                  hint: AppStrings.phone.translate(),
                  icon: Icons.phone_android,
                  fillColor: Colors.white,
                  isNumber: true,
                  validator: (v) => Validator.phoneNumber(v),
                  controller: EditProfileCubit.of(context).phoneController,
                ),
                SpaceH(inputHeigth: 10),
                InkWell(
                  onTap: () {
                    MagicRouter.navigateTo(const ChangePasswordScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(10),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        SpaceW(inputWidth: 10),
                        const Icon(
                          Icons.lock_open,
                          color: AppColors.primaryColor,
                        ),
                        SpaceW(inputWidth: 10),
                        const Text(
                          '*******',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                SpaceH(inputHeigth: 10),
                InputFormField(
                  hint: AppStrings.birthday.translate(),
                  icon: Icons.calendar_month,
                  fillColor: Colors.white,
                  controller: EditProfileCubit.of(context).birthdayController,
                ),
                SpaceH(inputHeigth: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      SpaceW(inputWidth: 10),
                      const Icon(
                        Icons.accessibility_outlined,
                        color: AppColors.primaryColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                activeColor: AppColors.primaryColor,
                                value: Gender.M,
                                groupValue:
                                    EditProfileCubit.of(context).genderProfile,
                                onChanged: (v) {
                                  EditProfileCubit.of(context)
                                      .changeGenderProfile(v!);
                                },
                              ),
                              Text(AppStrings.male.translate())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                activeColor: AppColors.primaryColor,
                                value: Gender.F,
                                groupValue:
                                    EditProfileCubit.of(context).genderProfile,
                                onChanged: (v) {
                                  EditProfileCubit.of(context)
                                      .changeGenderProfile(v!);
                                },
                              ),
                              Text(AppStrings.female.translate())
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.getProportionateScreenHeight(50),
                ),
                BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    return state is EditProfileLoading
                        ? const LoadingIndicator()
                        : CustomButton(
                            text: AppStrings.save.translate(),
                            paddingVertical:
                                AppSizes.getProportionateScreenHeight(17),
                            onPress: () {
                              EditProfileCubit.of(context).updateProfileData();
                            },
                          );
                  },
                ),
                SpaceH(inputHeigth: 20),
                CustomButton(
                  text: AppStrings.deleteAccount.translate(),
                  paddingVertical: AppSizes.getProportionateScreenHeight(17),
                  buttonColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                  fontColor: AppColors.primaryColor,
                  onPress: () {
                    deleteAccountBottomSheet(
                      context: context,
                      editProfileCubit: EditProfileCubit.of(context),
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
