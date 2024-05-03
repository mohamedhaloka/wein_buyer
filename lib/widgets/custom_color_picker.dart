import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';

import '../core/utils/app_strings.dart';

class CustomColorPicker extends StatelessWidget {
  CustomColorPicker({Key? key, required this.onChange}) : super(key: key);

  final Function(String) onChange;

  Color currentColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: currentColor,
          onColorChanged: (color) {
            currentColor = color;
            onChange(color.toString().replaceAll('0xff', '#').replaceAll('Color(', '').replaceAll(')', ''));
          },
          colorPickerWidth: 300.0,
          pickerAreaHeightPercent: 0.7,
          enableAlpha: true,
          displayThumbColor: true,
          paletteType: PaletteType.hsv,
        ),
      ),
      actions: [
        TextButton(
          child:  Text(AppStrings.confirm.translate()),
          onPressed: (){
            MagicRouter.pop();
          },
        ),
      ],
    );
  }
}
