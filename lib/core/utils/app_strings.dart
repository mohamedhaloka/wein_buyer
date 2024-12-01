import 'package:flutter/material.dart';
import 'package:wein_buyer/view/user/myAccount/data/model/account_item_model.dart';

class AppStrings {

  static const String baseurl = 'https://ezygo.org/api/client/';
  static const String baseurlImg = 'https://ezygo.org/uploads';
  static const String facebookURL = 'https://www.facebook.com/ezygoeg/';
  static const String tiktokURL = 'https://www.tiktok.com/@ezygoeg';

  // Home
  static const String endpointHome = 'home';
  static const String endpointAllOffers = 'products/all_offers';
  static const String endpointAllFreeDelivery = 'products/all_free_delivery';

  // Addresses
  static const String endpointAddresses = 'addresses';

  // Auth
  static const String endpointLogin = 'auth/login';
  static const String endpointRegister = 'auth/register';
  static const String endpointForgetPassword = 'auth/password/email';
  static const String endpointVerificationCode = 'auth/password/code/check';
  static const String endpointChangePassword = 'auth/password/reset';

  // Profile
  static const String endpointProfile = 'profile';
  static const String endpointUpdateProfile = 'profile/update';
  static const String endpointUpdatePassword = 'profile/update_password';
  static const String endpointDeleteAccount = 'profile/delete';

  // Favorites
  static const String endpointFavorites = 'favorites';

  // Categories
  static const String endpointCategories = 'categories';
  static const String endpointProductsBySubCategories =
      'products/by_sub_categories';

  // Cart
  static const String endpointCart = 'cart';
  static const String endpointUpdateItemQuantity = 'cart/update_item_quantity';
  static const String endpointRemoveItem = 'cart/remove_item';

  // Orders
  static const String endpointOrders = 'orders';
  static const String endpointRates = 'rates';
  static const String endpointCheckout = 'orders/checkout';

  // ProductDetails
  static const String endpointProducts = 'products';
  static const String endpointMerchant = 'merchant';

  //pages
  static const String endpointFaqs = 'pages/faqs';
  static const String endpointTerms = 'pages/terms_and_conditions';
  static const String endpointPrivacyPolicy = 'pages/privacy_policy';
  static const String endpointNotifications = 'notifications';
  static const String endpointCurrencies = 'currencies';

  /// provider
  // Auth
  static const String baseurlMerchant = 'https://ezygo.org/api/merchant/';
  static const String endpointLoginMerchant = 'auth/login';
  static const String endpointRegisterMerchant = 'auth/register';
  static const String endpointForgetPasswordMerchant = 'auth/password/email';
  static const String endpointVerificationCodeMerchant =
      'auth/password/code/check';
  static const String endpointChangePasswordMerchant = 'auth/password/reset';

  // Categories
  static const String endpointCategoriesMerchant = 'categories';

  // products
  static const String endpointProductsMerchant = 'products/me';
  static const String endpointAddProduct = 'products/me/store';
  static const String endpointDeleteProduct = 'products/me/';

  // market
  static const String endpointMyRates = 'store/rates';
  static const String endpointToggleOpenStatus = 'store/toggle-open-status';
  static const String endpointEditMarketDetails = 'store/update';
  static const String endpointEditProfileData = 'store/profile';

  // size_guides
  static const String endpointSizeGuides = 'size_guides';
  static const String endpointAddSizeGuides = 'size_guides';
  static const String endpointUpdateSizeGuides = 'size_guides/';
  static const String endpointDeleteSizeGuides = 'size_guides/';

  // Utils
  static const String endpointSizes = 'products/sizes';
  static const String endpointReturnPolicy = 'pages/return_policy';
  static const String endpointUpdateReturnPolicy = 'pages/return_policy/update';
  static const String endpointDeliveryCost = 'pages/delivery_cost_new';
  static const String endpointUpdateDeliveryCost = 'pages/delivery_cost_new/update';
  static const String endpointGetVerifiedStatus = 'get-verified-status';

  // Orders
  static const String endpointOrdersMerchant = 'orders';
  static const String endpointContactUs = 'contact-us';

  static const String endpointNotificationsMerchant =
      'http://multi-vendor-app.point7host.com/api/client/notifications';

  ////////////////////////////////////////////////////////////////

  /// translation
  static const String arabic = 'arabic';
  static const String phone = 'phone';
  static const String email = 'email';
  static const String name = 'name';
  static const String msg = 'msg';
  static const String send = 'send';
  static const String pound = 'pound';
  static const String add = 'add';
  static const String cate = 'cate';
  static const String subCate = 'subCate';
  static const String size = 'size';
  static const String color = 'color';
  static const String quantity = 'quantity';
  static const String orders = 'orders';
  static const String myMarket = 'myMarket';
  static const String myAccount = 'myAccount';
  static const String edit = 'edit';
  static const String saveEdits = 'saveEdits';
  static const String showAll = 'showAll';
  static const String pleaseLogin = 'pleaseLogin';
  static const String favourite = 'favourite';
  static const String myAddresses = 'myAddresses';
  static const String myReturns = 'myReturns';
  static const String lang = 'lang';
  static const String fqs = 'fqs';
  static const String share = 'share';
  static const String editProfile = 'editProfile';
  static const String deleteAccount = 'deleteAccount';
  static const String selectLang = 'selectLang';
  static const String logoutMsg = 'logoutMsg';
  static const String deleteAccountMsg = 'deleteAccountMsg';
  static const String contactUsMsg = 'contactUsMsg';
  static const String addProductMsg = 'addProductMsg';
  static const String editProductMsg = 'editProductMsg';
  static const String detailsProductValidation = 'detailsProductValidation';
  static const String sizeGuideValidation = 'sizeGuideValidation';
  static const String cateProductValidation = 'cateProductValidation';
  static const String infoProductValidation = 'infoProductValidation';
  static const String deliveryCostMsg = 'deliveryCostMsg';
  static const String deleteProductMsg = 'deleteProductMsg';
  static const String returnPolicyMsg = 'returnPolicyMsg';
  static const String deleteAddressMsg = 'deleteAddressMsg';
  static const String editAccountMsg = 'editAccountMsg';
  static const String pleaseCompleteInfoMsg = 'pleaseCompleteInfoMsg';
  static const String latest = 'latest';
  static const String nearest = 'nearest';
  static const String topRated = 'top_rated';
  static const String lowestPrice = 'lowest_price';
  static const String highestPrice = 'highest_price';
  static const String confirmOrder = 'confirm_order';
  static const String all = 'all';
  static const String changeLang = 'change_lang';
  static const String emptyField = 'emptyField';
  static const String productDetailsValidator = 'productDetailsValidator';
  static const String productTitleValidator = 'productTitleValidator';
  static const String reportValidator = 'reportValidator';
  static const String commentValidator = 'commentValidator';
  static const String wrongContent = 'wrongContent';
  static const String addressValidator = 'addressValidator';
  static const String enquiryValidator = 'enquiryValidator';
  static const String nameValidator = 'nameValidator';
  static const String confirmPasswordValidator = 'confirmPasswordValidator';
  static const String confirmPasswordMismatchValidator = 'confirmPasswordMismatchValidator';
  static const String passwordValidator = 'passwordValidator';
  static const String pinCodeValidator = 'pinCodeValidator';
  static const String deleteImageMsg = 'deleteImageMsg';

  // Notifications
  static const String notificationTitle = 'notificationTitle';
  static const String noNotification = 'noNotification';

  // SelectUser
  static const String selectUserTitle = 'selectUserTitle';
  static const String selectUserProvider = 'selectUserProvider';
  static const String selectUserUser = 'selectUserUser';
  static const String selectUserBTN = 'selectUserBTN';

  // Provider Account
  static const String contactUsTitle = 'contactUsTitle';
  static const String logo = 'logo';
  static const String logout = 'logout';
  static const String accountData = 'accountData';
  static const String orderNumber = 'orderNumber';
  static const String costOrderCash = 'costOrderCash';
  static const String costOrderOnline = 'costOrderOnline';
  static const String vendorName = 'vendorName';
  static const String storeName = 'storeName';
  static const String shopDescribeInfo = 'shopDescribeInfo';
  static const String cateInfo = 'cateInfo';
  static const String subCateInfo = 'subCateInfo';
  static const String nameProductInfo = 'nameProductInfo';
  static const String descProductInfo = 'descProductInfo';
  static const String productPriceInfo = 'productPriceInfo';

  // AddProduct
  static const String addProduct = 'addProduct';
  static const String productName = 'productName';
  static const String productDesc = 'productDesc';
  static const String productPrice = 'productPrice';
  static const String discountValue = 'discountValue';
  static const String productAfterPrice = 'productAfterPrice';
  static const String addSizeGuide = 'addSizeGuide';
  static const String addImages = 'addImages';
  static const String productDetails = 'productDetails';
  static const String addOtherDetails = 'addOtherDetails';
  static const String mainCateHide = 'mainCateHide';
  static const String subCateHide = 'subCateHide';

  // ReviewAccount
  static const String reviewAccountTitle = 'reviewAccountTitle';
  static const String reviewAccountDesc = 'reviewAccountDesc';

  // DeliveryCost
  static const String deliveryCostTitle = 'deliveryCostTitle';
  static const String addDeliveryCost = 'addDeliveryCost';
  static const String changePasswordBody = 'changePasswordBody';
  static const String pleaseChangePasswordBody = 'pleaseChangePasswordBody';
  static const String newChangePasswordBody = 'newChangePasswordBody';
  static const String confirmChangePasswordBody = 'confirmChangePasswordBody';
  static const String confirm = 'confirm';
  static const String forgetPasswordBody = 'forgetPasswordBody';
  static const String enterEmailForgetPasswordBody =
      'enterEmailForgetPasswordBody';
  static const String emailForgetPasswordBody = 'emailForgetPasswordBody';
  static const String sendForgetPasswordBody = 'sendForgetPasswordBody';
  static const String confirmVerificationCodeBody =
      'confirmVerificationCodeBody';
  static const String emailConfirmVerificationCodeBody =
      'emailConfirmVerificationCodeBody';
  static const String replayVerificationCodeBody = 'replayVerificationCodeBody';
  static const String loginProviderBody = 'loginProviderBody';
  static const String emailLoginProviderBody = 'emailLoginProviderBody';
  static const String passwordLoginProviderBody = 'passwordLoginProviderBody';
  static const String forgetPasswordLoginProviderBody =
      'forgetPasswordLoginProviderBody';
  static const String enterLoginProviderBody = 'enterLoginProviderBody';
  static const String notLoginProviderBody = 'notLoginProviderBody';
  static const String newLoginProviderBody = 'newLoginProviderBody';
  static const String addMarketScreen = 'addMarketScreen';
  static const String aboutUsWidget = 'aboutUsWidget';
  static const String editAboutUsBottomSheet = 'editAboutUsBottomSheet';
  static const String editMarketDetailsBottomSheet =
      'editMarketDetailsBottomSheet';
  static const String nameEditTitleBottomSheet = 'nameEditTitleBottomSheet';
  static const String openHeaderMarketWidget = 'openHeaderMarketWidget';
  static const String closedHeaderMarketWidget = 'closedHeaderMarketWidget';
  static const String settingHeaderMarketWidget = 'settingHeaderMarketWidget';
  static const String deleteMoreForProductItem = 'deleteMoreForProductItem';
  static const String ourLocationWidget = 'ourLocationWidget';
  static const String showOurLocationWidget = 'showOurLocationWidget';
  static const String ourRatingWidget = 'ourRatingWidget';
  static const String sectionsAndProductsWidget = 'sectionsAndProductsWidget';
  static const String tabSectionsWidget = 'tabSectionsWidget';
  static const String proudestTabSectionsWidget = 'proudestTabSectionsWidget';
  static const String orderDetailsScreen = 'orderDetailsScreen';
  static const String acceptOrRejectCommingOrderBTN =
      'acceptOrRejectCommingOrderBTN';
  static const String regretOrRejectCommingOrderBTN =
      'regretOrRejectCommingOrderBTN';
  static const String acceptOrRejectOngoingOrderBTN =
      'acceptOrRejectOngoingOrderBTN';
  static const String sendAcceptOrRejectOngoingOrderBTN =
      'sendAcceptOrRejectOngoingOrderBTN';
  static const String deleteAcceptOrRejectOngoingOrderBTN =
      'deleteAcceptOrRejectOngoingOrderBTN';
  static const String nearAddressOrderWidget = 'nearAddressOrderWidget';
  static const String addressOrderWidget = 'addressOrderWidget';
  static const String costOrderWidget = 'costOrderWidget';
  static const String driveCostOrderWidget = 'driveCostOrderWidget';
  static const String priceCostOrderWidget = 'priceCostOrderWidget';
  static const String poundCostOrderWidget = 'poundCostOrderWidget';
  static const String totalCostOrderWidget = 'totalCostOrderWidget';
  static const String taxesCostOrderWidget = 'taxesCostOrderWidget';
  static const String detailsOrderWidget = 'detailsOrderWidget';
  static const String doneReceivedAmountBottomSheet =
      'doneReceivedAmountBottomSheet';
  static const String doneReturnOrderBottomSheet = 'doneReturnOrderBottomSheet';
  static const String reasonCancelBottomSheet = 'reasonCancelBottomSheet';
  static const String chooseReasonCancelBottomSheet =
      'chooseReasonCancelBottomSheet';
  static const String writeReasonCancelBottomSheet =
      'writeReasonCancelBottomSheet';
  static const String reasonForReturnWidget = 'reasonForReturnWidget';
  static const String regretReasonForReturnWidget =
      'regretReasonForReturnWidget';
  static const String ReasonForReturnWidget = 'ReasonForReturnWidget';
  static const String reasonRejectBottomSheet = 'reasonRejectBottomSheet';
  static const String receivedAmountBottomSheet = 'receivedAmountBottomSheet';
  static const String receivedAmountBottomSheetHere =
      'receivedAmountBottomSheetHere';
  static const String ordersScreen = 'ordersScreen';
  static const String loadingOrdersScreen = 'loadingOrdersScreen';
  static const String regretOrdersScreen = 'regretOrdersScreen';
  static const String RegretOrdersScreen = 'RegretOrdersScreen';
  static const String exitOrdersScreen = 'exitOrdersScreen';
  static const String logoOrdersScreen = 'logoOrdersScreen';
  static const String cancelledList = 'cancelledList';
  static const String emptyCancelledList = 'emptyCancelledList';
  static const String registerBody = 'registerBody';
  static const String shopNameRegisterBody = 'shopNameRegisterBody';
  static const String shopDescribeRegisterBody = 'shopDescribeRegisterBody';
  static const String nameRegisterBody = 'nameRegisterBody';
  static const String emailRegisterBody = 'emailRegisterBody';
  static const String addressRegisterBody = 'addressRegisterBody';
  static const String driveRegisterBody = 'driveRegisterBody';
  static const String okRegisterBody = 'okRegisterBody';
  static const String registerRegisterBody = 'registerRegisterBody';
  static const String loginRegisterBody = 'loginRegisterBody';
  static const String haveLoginRegisterBody = 'haveLoginRegisterBody';
  static const String returnPolicyScreen = 'returnPolicyScreen';
  static const String enterReturnPolicyScreen = 'enterReturnPolicyScreen';
  static const String saveEdite = 'saveEdite';
  static const String settingsMarketBody = 'settingsMarketBody';
  static const String invalidDiscount = 'invalidDiscount';
  static const String invalid = 'invalid';
  static const String costDeliveryMarketBody = 'costDeliveryMarketBody';
  static const String mapMarketBody = 'mapMarketBody';
  static const String addMap = 'addMap';
  static const String namedMap = 'namedMap';
  static const String namedMapImage = 'namedMapImage';
  static const String addAddSizeGuideBottomSheet = 'addAddSizeGuideBottomSheet';
  static const String editeMap = 'editeMap';
  static const String newAdd = 'newAdd';
  static const String noNewAdd = 'noNewAdd';
  static const String addAddress = 'addAddress';
  static const String saveAddress = 'saveAddress';
  static const String addressesScreen = 'addressesScreen';
  static const String editeAddressesScreen = 'editeAddressesScreen';
  static const String chooseAddress = 'chooseAddress';
  static const String userName = 'userName';
  static const String addNewAddress = 'addNewAddress';
  static const String notAddNewAddress = 'notAddNewAddress';
  static const String mainScreen = 'mainScreen';
  static const String rubbishScreen = 'rubbishScreen';
  static const String myOrder = 'myOrder';
  static const String confirmationOrderWidget = 'confirmationOrderWidget';
  static const String driveAddress = 'driveAddress';
  static const String emptyRubbish = 'emptyRubbish';
  static const String noDeliveryAddressWidget = 'noDeliveryAddressWidget';
  static const String paymentMethodWidget = 'paymentMethodWidget';
  static const String nextWidget = 'nextWidget';
  static const String connectWithUsScreen = 'connectWithUsScreen';
  static const String message = 'message';
  static const String receiveName = 'receiveName';
  static const String emailChoose = 'emailChoose';
  static const String connectWithUsBottomSheet = 'connectWithUsBottomSheet';
  static const String followUs = 'followUs';
  static const String accountDetails = 'accountDetails';
  static const String oldPassword = 'oldPassword';
  static const String newPassword = 'newPassword';
  static const String confirmPassword = 'confirmPassword';
  static const String save = 'save';
  static const String changePasswordBottomSheet = 'changePasswordBottomSheet';
  static const String firstName = 'firstName';
  static const String secondName = 'secondName';
  static const String birthday = 'birthday';
  static const String male = 'male';
  static const String female = 'female';
  static const String favoritesScreen = 'favoritesScreen';
  static const String favoritesBody = 'favoritesBody';
  static const String newAndChangePasswordBody = 'newAndChangePasswordBody';
  static const String enterPhone = 'enterPhone';
  static const String nearestAddress = 'nearestAddress';
  static const String addresses = 'addresses';
  static const String freeShipping = 'freeShipping';
  static const String deliveryTo = 'deliveryTo';
  static const String addANewAddress = 'addANewAddress';
  static const String whaaaatASearch = 'whaaaatASearch';
  static const String section = 'section';
  static const String offers = 'offers';
  static const String skip = 'skip';
  static const String login = 'login';
  static const String noLogin = 'noLogin';
  static const String newAccount = 'newAccount';
  static const String howMuch = 'howMuch';
  static const String radius = 'radius';
  static const String howEverLocation = 'howEverLocation';
  static const String noProtects = 'noProtects';
  static const String noOrders = 'noOrders';
  static const String dataFromStore = 'dataFromStore';
  static const String language = 'language';
  static const String loadingStart = 'loadingStart';
  static const String note = 'note';
  static const String productRating = 'productRating';
  static const String resion = 'resion';
  static const String endedOrderBTN = 'endedOrderBTN';
  static const String showResion = 'showResion';
  static const String storeAddress = 'storeAddress';
  static const String shutDown = 'shutDown';
  static const String cancelOrder = 'cancelOrder';
  static const String areSureCansel = 'areSureCansel';
  static const String questionCommon = 'questionCommon';
  static const String privacy = 'privacy';
  static const String termsAndConditionsScreen = 'termsAndConditionsScreen';
  static const String addToBasket = 'addToBasket';
  static const String returnPrivacy = 'returnPrivacy';
  static const String colors = 'colors';
  static const String sized = 'sized';
  static const String generalDescription = 'generalDescription';
  static const String ratings = 'ratings';
  static const String showMore = 'showMore';
  static const String store = 'store';
  static const String showStore = 'showStore';
  static const String detailsProduct = 'detailsProduct';
  static const String describeDilaver = 'describeDilaver';
  static const String addressOut = 'addressOut';
  static const String addressIn = 'addressIn';
  static const String kilo = 'kilo';
  static const String howMuchDelivery = 'howMuchDelivery';
  static const String similarProductsWidget = 'similarProductsWidget';
  static const String sizeGuideBTN = 'sizeGuideBTN';
  static const String products = 'products';
  static const String allOffers = 'allOffers';
  static const String noOffers = 'noOffers';
  static const String filter = 'filter';
  static const String searchInSide = 'searchInSide';
  static const String deleteFilter = 'deleteFilter';
  static const String bottomSheetSortByWidget = 'bottomSheetSortByWidget';
  static const String createAccount = 'createAccount';
  static const String silerLogin = 'silerLogin';
  static const String buyerLogin = 'buyerLogin';
  static const String confirmTermsAndConditions = 'confirmTermsAndConditions';
  static const String executionBed = 'executionBed';
  static const String productReceived = 'productReceived';
  static const String exoplayer = 'exoplayer';
  static const String returns = 'returns';
  static const String shopping = 'shopping';
  static const String resionOfReturn = 'resionOfReturn';
  static const String text = 'text';
  static const String comments = 'comments';
  static const String recent = 'recent';
  static const String subSectionWidget = 'subSectionWidget';
  static const String topRateWidget = 'topRateWidget';
  static const String seeAll = 'seeAll';
  static const String addGuide = 'addGuide';
  static const String nameGuide = 'nameGuide';
  static const String addImageForGuide = 'addImageForGuide';
  static const String guideFor = 'guideFor';
  static const String logInFirst = 'logInFirst';
  static const String product = 'product';
  static const String changeCurrency = 'changeCurrency';
  static const String aroundMeTitle = 'aroundMeTitle';
  static const String localShippingTitle = 'localShippingTitle';
  static const String domesticShippingTitle = 'domesticShippingTitle';
  static const String aroundMe = 'aroundMe';
  static const String localShipping = 'localShipping';
  static const String domesticShipping = 'domesticShipping';
  static const String min = 'min';
  static const String max = 'max';
  static const String price = 'price';
  static const String aroundMeMaxValidation = 'aroundMeMaxValidation';
  static const String localeMinValidation = 'localeMinValidation';
  static const String localeMaxValidation = 'localeMaxValidation';
  static const String domesticMinValidation = 'domesticMinValidation';
  static const String domesticMaxValidation = 'domesticMaxValidation';
  static const String deleteAccountDesc = 'delete_account_desc';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String limitVideo = 'limit_video';
  static const String pleaseWait = 'please_wait';
  static const String mediaTypeMsg = 'media_type_msg';
}
