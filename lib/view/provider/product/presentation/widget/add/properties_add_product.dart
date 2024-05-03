import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/property_model.dart';
import 'package:wein_buyer/view/provider/utils/presentation/controller/utils_cubit.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../../../widgets/custom_color_picker.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../controller/add_product_cubit.dart';

class PropertiesAddProduct extends StatelessWidget {
  const PropertiesAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.productDetails.translate(),
              style: TextStyle(
                color: AppColors.fontColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            InkWell(
              onTap: () => AddProductCubit.of(context).addAnotherProperty(),
              child: Padding(
                padding: EdgeInsets.all(
                  AppSizes.getProportionateScreenWidth(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_circle,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      AppStrings.addOtherDetails.translate(),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SpaceH(inputHeigth: 5),
        BlocBuilder<AddProductCubit, AddProductState>(
          buildWhen: (previous, current) =>
              previous != current && current is AddAnotherProperty,
          builder: (context, state) {
            List<PropertyModel> listOfProperty =
                AddProductCubit.of(context).listOfProperty;
            if (state is AddAnotherProperty) {
              return Column(
                children: List.generate(
                  listOfProperty.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(5),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownSearch<String>(
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                hintText: AppStrings.size.translate(),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(12, 0, 10, 0),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                hintStyle: const TextStyle(color: Colors.black),
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                              ),
                            ),
                            items: UtilsCubit.of(context).listOfSizes,
                            // selectedItem: AddProductCubit.of(context).selectedSize,
                            itemAsString: (data) => data!,
                            // mode: Mode.MENU,
                            onChanged: (data) {
                              AddProductCubit.of(context)
                                  .onChangeSizes(index, data!);
                            },
                          ),
                        ),
                        SpaceW(inputWidth: 3),
                        Expanded(
                          child: BlocBuilder<AddProductCubit, AddProductState>(
                            buildWhen: (previous, current) =>
                                current is OnChangeColors,
                            builder: (context, state) {
                              return InputFormField(
                                hint: AppStrings.color.translate(),
                                clickable: true,
                                textColor:
                                    const Color.fromRGBO(161, 147, 147, 1),
                                fillColor: Color(int.parse(
                                    '0xff${listOfProperty[index].colorController!.text.replaceAll('#', '')}')),
                                verticalMargin: 0,
                                controller:
                                    listOfProperty[index].colorController,
                                validator: (v) {},
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext cxt) {
                                      return CustomColorPicker(
                                        onChange: (color) {
                                          AddProductCubit.of(context)
                                              .onChangeColors(index, color);
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SpaceW(inputWidth: 3),
                        Expanded(
                          child: InputFormField(
                            hint: AppStrings.quantity.translate(),
                            isNumber: true,
                            textColor: const Color.fromRGBO(161, 147, 147, 1),
                            fillColor: Colors.white,
                            verticalMargin: 0,
                            controller:
                                listOfProperty[index].quantityController,
                            validator: (v) {},
                          ),
                        ),
                        SpaceW(inputWidth: 5),
                        InkWell(
                          onTap: () {
                            AddProductCubit.of(context).clearProperty(index);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.06,
                            height: MediaQuery.of(context).size.width * 0.06,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
