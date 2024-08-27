import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/market_details/presentation/screen/market_details_screen.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/product_details_screen.dart';

class DynamicLinkProvider {
  static bool checked = false;
  Future<String> createLink({required bool pro, required String id}) async {
    final String url = "https://com.ezygo?pro=$pro&id=$id";
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      androidParameters: const AndroidParameters(packageName: "com.user.hMart"),
      iosParameters: const IOSParameters(
        bundleId: "com.michael.weinUser",
        appStoreId: '1672873142',
      ),
      link: Uri.parse(url),
      uriPrefix: "https://ezygo.page.link",
    );

    final FirebaseDynamicLinks link = FirebaseDynamicLinks.instance;

    final refLink = await link.buildShortLink(parameters);
    return refLink.shortUrl.toString();
  }

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> initDynamicLink() async {
    dynamicLinks.getInitialLink().then(
      (value) {
        final Uri? uri = value?.link;
        if(uri == null) return;
        print("gkkkkkdjkkff: ${uri.queryParameters['pro']}");
        if (uri.queryParameters['pro'] == "true") {
          MagicRouter.navigateTo(ProductDetailsScreen(
            productId: int.parse(uri.queryParameters['id']!),
          ));
        } else {
          MagicRouter.navigateTo(MarketDetailsScreen(
            marketId: int.parse(uri.queryParameters['id']!),
          ));
        }
      },
    );

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      String pro = dynamicLinkData.link.query.substring(4).split('&').first;
      String id = dynamicLinkData.link.query.split('id=').last;
      if (pro == "true") {
        MagicRouter.navigateTo(ProductDetailsScreen(productId: int.parse(id)));
      } else {
        MagicRouter.navigateTo(MarketDetailsScreen(marketId: int.parse(id)));
      }
    }).onError((error) {
      // Handle errors
    });
  }
}
