import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_compress/video_compress.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';

import '../../widgets/custom_loading.dart';
import '../../widgets/snackBar.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AppFunc {
  static Future launchUrlFun(String url) async {
    Uri uri = Uri.parse(url);
    if (url.isNotEmpty) {
      if (!await launchUrl(uri)) {
        throw 'Could not launch $uri';
      }
    }
  }

  static shareImage(String imgUrl, String name, String price) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(imgUrl));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    final dir = await getTemporaryDirectory();
    File file = File('${dir.path}/$name.jpeg');
    await file.writeAsBytes(bytes);
    Share.shareFiles(
      [(file.path)],
      text: 'اسم المنج: $name\nسعر المنتح: $price',
    );
  }

  static shareText({String? text}) async {
    if (text != null) {
      await Share.share(
        text,
      );
    }
  }

  static Future<File?> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> getImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> result = await picker.pickMultiImage(imageQuality: 50);
    if (result != null) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  // static Future<List<File>> getMedias() async {
  //   final ImagePicker picker = ImagePicker();
  //   final List<XFile> result = await picker.pickMultipleMedia(
  //     imageQuality: 50,
  //   );
  //   List<File> files = [];
  //   if (result.isNotEmpty) {
  //     List<File> files = result.map((e) => File(e.path)).toList();
  //     return files;
  //   } else {
  //     return [];
  //   }
  // }

  static bool checkIsVideo({required String path}) {
    if (path.split('.').last == 'mp4' ||
        path.split('.').last == 'mov' ||
        path.split('.').last == 'avi' ||
        path.split('.').last == 'wmv' ||
        path.split('.').last == 'mkv' ||
        path.split('.').last == '264' ||
        path.split('.').last == 'HEVC') {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<File>> getMedias(BuildContext context) async {
    final GlobalKey<State> keyLoader = GlobalKey<State>();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.media,
    );
    if (result != null) {
      List<File> fileList = [];
      List<File> files = result.paths.map((path) => File(path!)).toList();
      for (var element in files) {
        if (element.path.split('.').last == 'jpg' ||
            element.path.split('.').last == 'jpeg' ||
            element.path.split('.').last == 'png' ||
            element.path.split('.').last == 'gif' ||
            element.path.split('.').last == 'bmp' ||
            element.path.split('.').last == 'mp4' ||
            element.path.split('.').last == 'mov' ||
            element.path.split('.').last == 'avi' ||
            element.path.split('.').last == 'wmv' ||
            element.path.split('.').last == 'mkv' ||
            element.path.split('.').last == '264' ||
            element.path.split('.').last == 'HEVC') {
          if (checkIsVideo(path: element.path)) {
            Dialogs.showLoadingDialog(context, keyLoader);
            File? file = await compressVideo(element.path);
            int sizeInBytes = file!.lengthSync();
            double sizeInMb = sizeInBytes / (1024 * 1024);
            if (sizeInMb < 20) {
              fileList.add(file);
              Navigator.of(keyLoader.currentContext!, rootNavigator: true)
                  .pop();
            } else {
              Navigator.of(keyLoader.currentContext!, rootNavigator: true)
                  .pop();
              showSnackBar(AppStrings.limitVideo.translate());
            }
          } else {
            fileList.add(element);
          }
        } else {
          showSnackBar(tr(context, AppStrings.mediaTypeMsg));
        }
      }
      return fileList;
    } else {
      return [];
    }
  }

  static Future<File?> compressVideo(String path) async {
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(
      path,
      quality: VideoQuality.LowQuality,
      deleteOrigin: false,
    );

    if (mediaInfo != null) {
      print('Compression successful');
      print('Compressed Size: ${mediaInfo.filesize}');
      print('Path of compressed video: ${mediaInfo.path}');
    }

    return mediaInfo!.file;
  }

  static Future<Position?> getCurrentLocation(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showSnackBar('Location Services Disconnected');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSnackBar('Location Services Disconnected');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showSnackBar(
          'Location permissions are permanently denied, we cannot request permissions');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

// static logoutFun() async{
//   await AppStorage.cacheUserInfo(null);
//   await AppStorage.cacheUserType(null);
// }
}
