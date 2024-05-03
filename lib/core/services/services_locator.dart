import 'package:get_it/get_it.dart';
import 'package:wein_buyer/view/notification/data/datasource/notification_remote_datasource.dart';
import 'package:wein_buyer/view/notification/data/repository/notification_repository.dart';
import 'package:wein_buyer/view/notification/domain/repository/base_notification_repository.dart';
import 'package:wein_buyer/view/notification/domain/usecases/get_notification.dart';
import 'package:wein_buyer/view/notification/presentation/controller/notification_cubit.dart';
import 'package:wein_buyer/view/provider/account/domain/usecases/delete_account_provider.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/getProfileDataProvider.dart';
import 'package:wein_buyer/view/provider/product/domain/usecases/delete_image.dart';
import 'package:wein_buyer/view/provider/product/domain/usecases/edit_product.dart';
import 'package:wein_buyer/view/provider/register_provider/presentation/controller/register_cubit.dart';
import 'package:wein_buyer/view/provider/utils/domain/usecases/get_verified_status.dart';
import 'package:wein_buyer/view/user/addresses/data/datasource/addresses_remote_datasource.dart';
import 'package:wein_buyer/view/user/addresses/domain/repository/base_addresses_repository.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/add_address.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/delete_address.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/edit_address.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/get_addresses.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/make_default_address.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/cart/data/datasource/cart_remote_datasource.dart';
import 'package:wein_buyer/view/user/cart/domain/usecases/checkout.dart';
import 'package:wein_buyer/view/user/cart/domain/usecases/get_cart.dart';
import 'package:wein_buyer/view/user/cart/domain/usecases/remove_item.dart';
import 'package:wein_buyer/view/user/cart/domain/usecases/update_item_quantity.dart';
import 'package:wein_buyer/view/user/cart/presentation/controller/cart_cubit.dart';
import 'package:wein_buyer/view/user/editProfileUser/data/datasource/edit_profile_remote_datasource.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/usecases/delete_account.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/usecases/get_profile_data_user.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/usecases/update_password.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/usecases/update_profile_data.dart';
import 'package:wein_buyer/view/user/favorites/data/datasource/favorites_remote_datasource.dart';
import 'package:wein_buyer/view/user/favorites/domain/usecases/add_favorite_item.dart';
import 'package:wein_buyer/view/user/favorites/domain/usecases/remove_favorite_item.dart';
import 'package:wein_buyer/view/user/home/domain/usecases/get_home_data.dart';
import 'package:wein_buyer/view/user/myOrders/data/datasource/my_orders_remote_datasource.dart';
import 'package:wein_buyer/view/user/myOrders/domain/usecases/get_my_orders.dart';
import 'package:wein_buyer/view/user/myOrders/domain/usecases/rate_product.dart';
import 'package:wein_buyer/view/user/orderDetails/data/datasource/order_details_user_remote_datasource.dart';
import 'package:wein_buyer/view/user/orderDetails/data/repository/order_details_user_repository.dart';
import 'package:wein_buyer/view/user/orderDetails/domain/repository/base_order_details_user_repository.dart';
import 'package:wein_buyer/view/user/orderDetails/domain/usecases/cancel_order.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/view/user/pages/data/datasource/pages_remote_datasource.dart';
import 'package:wein_buyer/view/user/pages/domain/usecases/get_currencies.dart';
import 'package:wein_buyer/view/user/pages/domain/usecases/get_faqs.dart';
import 'package:wein_buyer/view/user/pages/domain/usecases/get_privacy_policy.dart';
import 'package:wein_buyer/view/user/pages/domain/usecases/get_terms.dart';
import 'package:wein_buyer/view/user/productDetails/data/datasource/product_details_remote_datasource.dart';
import 'package:wein_buyer/view/user/productDetails/data/repository/product_details_repository.dart';
import 'package:wein_buyer/view/user/productDetails/domain/usecases/add_to_cart.dart';
import 'package:wein_buyer/view/user/productDetails/domain/usecases/get_market_categories.dart';
import 'package:wein_buyer/view/user/productDetails/domain/usecases/get_market_details.dart';
import 'package:wein_buyer/view/user/productDetails/domain/usecases/get_market_products.dart';
import 'package:wein_buyer/view/user/productDetails/domain/usecases/get_product_details.dart';
import 'package:wein_buyer/view/user/productDetails/domain/usecases/get_related_products.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';
import 'package:wein_buyer/view/user/products/data/datasource/products_remote_datasource.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_all_free_delivery.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_all_offers.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_product_by_sort_filter.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_product_by_sort_max_and_min.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_product_by_sub_category.dart';
import 'package:wein_buyer/view/user/section/data/datasource/section_remote_datasource.dart';
import 'package:wein_buyer/view/user/section/data/repository/section_repository.dart';
import 'package:wein_buyer/view/user/section/domain/repository/base_section_repository.dart';
import 'package:wein_buyer/view/user/section/domain/usecases/get_main_cates.dart';
import 'package:wein_buyer/view/user/section/domain/usecases/get_sub_cates_and_top_rated_products.dart';
import 'package:wein_buyer/view/user/section/presentation/controller/section_cubit.dart';
import '../../view/provider/account/data/datasource/account_remote_datasource.dart';
import '../../view/provider/account/data/repository/account_repository.dart';
import '../../view/provider/account/domain/repository/base_account_repository.dart';
import '../../view/provider/account/domain/usecases/contactUs.dart';
import '../../view/provider/account/presentation/controller/account_cubit.dart';
import '../../view/provider/product/data/datasource/add_product_remote_datasource.dart';
import '../../view/provider/product/data/repository/add_product_repository.dart';
import '../../view/provider/product/domain/repository/base_add_product_repository.dart';
import '../../view/provider/product/domain/usecases/add_product.dart';
import '../../view/provider/product/presentation/controller/add_product_cubit.dart';
import '../../view/provider/deliveryCost/data/datasource/delivery_cost_datasource.dart';
import '../../view/provider/deliveryCost/data/repository/delivery_cost_repository.dart';
import '../../view/provider/deliveryCost/domain/repository/base_delivery_cost_repository.dart';
import '../../view/provider/deliveryCost/domain/usecases/get_delivery_cost.dart';
import '../../view/provider/deliveryCost/domain/usecases/update_delivery_cost.dart';
import '../../view/provider/deliveryCost/presentation/controller/delivery_cost_cubit.dart';
import '../../view/provider/forgetPassword/data/datasource/forget_password_remote_datasource.dart';
import '../../view/provider/forgetPassword/data/repository/forget_password_repository.dart';
import '../../view/provider/forgetPassword/domain/repository/base_forget_password_repository.dart';
import '../../view/provider/forgetPassword/domain/usecases/change_password.dart';
import '../../view/provider/forgetPassword/domain/usecases/forget_password.dart';
import '../../view/provider/forgetPassword/domain/usecases/verification_code.dart';
import '../../view/provider/forgetPassword/presentation/controller/forget_password_cubit.dart';
import '../../view/provider/login_provider/data/datasource/login_remote_datasource.dart';
import '../../view/provider/login_provider/data/repository/login_repository.dart';
import '../../view/provider/login_provider/domain/repository/base_login_repository.dart';
import '../../view/provider/login_provider/domain/usecases/login.dart';
import '../../view/provider/login_provider/presentation/controller/login_cubit.dart';
import '../../view/provider/market/data/datasource/market_remote_datasource.dart';
import '../../view/provider/market/data/repository/market_repository.dart';
import '../../view/provider/market/domain/repository/base_market_repository.dart';
import '../../view/provider/market/domain/usecases/delete_product.dart';
import '../../view/provider/market/domain/usecases/edit_market_details.dart';
import '../../view/provider/market/domain/usecases/getAllCategories.dart';
import '../../view/provider/market/domain/usecases/getProducts.dart';
import '../../view/provider/market/domain/usecases/getSubCategories.dart';
import '../../view/provider/market/domain/usecases/get_my_rates.dart';
import '../../view/provider/market/presentation/controller/market_cubit.dart';
import '../../view/provider/orderDetails/data/datasource/order_details_remote_datasource.dart';
import '../../view/provider/orderDetails/data/repository/oder_details_repository.dart';
import '../../view/provider/orderDetails/domain/repository/base_order_details_repository.dart';
import '../../view/provider/orderDetails/domain/usecases/accept_order.dart';
import '../../view/provider/orderDetails/domain/usecases/cancel_order.dart';
import '../../view/provider/orderDetails/domain/usecases/deliver_order.dart';
import '../../view/provider/orderDetails/domain/usecases/reject_order.dart';
import '../../view/provider/orderDetails/presentation/controller/order_details_cubit.dart';
import '../../view/provider/orders/data/datasource/orders_remote_datasource.dart';
import '../../view/provider/orders/data/repository/oders_repository.dart';
import '../../view/provider/orders/domain/repository/base_orders_repository.dart';
import '../../view/provider/orders/domain/usecases/get_orders.dart';
import '../../view/provider/orders/presentation/controller/orders_cubit.dart';
import '../../view/provider/register_provider/data/datasource/register_remote_datasource.dart';
import '../../view/provider/register_provider/data/repository/register_repository.dart';
import '../../view/provider/register_provider/domain/repository/base_register_repository.dart';
import '../../view/provider/register_provider/domain/usecases/register.dart';
import '../../view/provider/returnPolicy/data/datasource/return_policy_remote_datasource.dart';
import '../../view/provider/returnPolicy/data/repository/return_policy_repository.dart';
import '../../view/provider/returnPolicy/domain/repository/base_return_policy_repository.dart';
import '../../view/provider/returnPolicy/domain/usecases/get_return_policy.dart';
import '../../view/provider/returnPolicy/domain/usecases/update_return_policy.dart';
import '../../view/provider/returnPolicy/presentation/controller/return_policy_cubit.dart';
import '../../view/provider/settingsMarket/data/datasource/setting_market_remote_datasource.dart';
import '../../view/provider/settingsMarket/data/repository/setting_market_repository.dart';
import '../../view/provider/settingsMarket/domain/repository/base_setting_market_repository.dart';
import '../../view/provider/settingsMarket/domain/usecases/toggle_open_status.dart';
import '../../view/provider/settingsMarket/presentation/controller/setting_market_cubit.dart';
import '../../view/provider/sizeGuide/data/datasource/size_guide_remote_datasource.dart';
import '../../view/provider/sizeGuide/data/repository/size_guide_repository.dart';
import '../../view/provider/sizeGuide/domain/repository/base_size_guide_repository.dart';
import '../../view/provider/sizeGuide/domain/usecases/add_size_guide.dart';
import '../../view/provider/sizeGuide/domain/usecases/delete_size_guide.dart';
import '../../view/provider/sizeGuide/domain/usecases/edit_size_guide.dart';
import '../../view/provider/sizeGuide/domain/usecases/get_size_guide.dart';
import '../../view/provider/sizeGuide/presentation/controller/size_guide_cubit.dart';
import '../../view/provider/utils/data/datasource/utils_remote_datasource.dart';
import '../../view/provider/utils/data/repository/utils_repository.dart';
import '../../view/provider/utils/domain/repository/base_utils_repository.dart';
import '../../view/provider/utils/domain/usecases/get_sizes.dart';
import '../../view/provider/utils/presentation/controller/utils_cubit.dart';
import '../../view/user/addresses/data/repository/addresses_repository.dart';
import '../../view/user/cart/data/repository/cart_repository.dart';
import '../../view/user/cart/domain/repository/base_cart_repository.dart';
import '../../view/user/editProfileUser/data/repository/edit_profile_repository.dart';
import '../../view/user/editProfileUser/domain/repository/base_edit_profile_repository.dart';
import '../../view/user/editProfileUser/presentation/controller/edit_profile_cubit.dart';
import '../../view/user/favorites/data/repository/favorites_repository.dart';
import '../../view/user/favorites/domain/repository/base_favorites_repository.dart';
import '../../view/user/favorites/domain/usecases/get_favorites.dart';
import '../../view/user/favorites/presentation/controller/favorites_cubit.dart';
import '../../view/user/forgetPasswordUser/data/datasource/forget_password_remote_datasource.dart';
import '../../view/user/forgetPasswordUser/data/repository/forget_password_repository.dart';
import '../../view/user/forgetPasswordUser/domain/repository/base_forget_password_repository.dart';
import '../../view/user/forgetPasswordUser/domain/usecases/change_password.dart';
import '../../view/user/forgetPasswordUser/domain/usecases/forget_password.dart';
import '../../view/user/forgetPasswordUser/domain/usecases/verification_code.dart';
import '../../view/user/forgetPasswordUser/presentation/controller/forget_password_cubit.dart';
import '../../view/user/home/data/datasource/home_remote_datasource.dart';
import '../../view/user/home/data/repository/home_repository.dart';
import '../../view/user/home/domain/repository/base_home_repository.dart';
import '../../view/user/home/presentation/controller/home_cubit.dart';
import '../../view/user/login_user/data/datasource/login_remote_datasource.dart';
import '../../view/user/login_user/data/repository/login_repository.dart';
import '../../view/user/login_user/domain/repository/base_login_repository.dart';
import '../../view/user/login_user/domain/usecases/login.dart';
import '../../view/user/login_user/presentation/controller/login_cubit.dart';
import '../../view/user/myOrders/data/repository/my_orders_repository.dart';
import '../../view/user/myOrders/domain/repository/base_my_orders_repository.dart';
import '../../view/user/myOrders/presentation/controller/my_orders_cubit.dart';
import '../../view/user/pages/data/repository/pages_repository.dart';
import '../../view/user/pages/domain/repository/base_pages_repository.dart';
import '../../view/user/pages/view/controller/pages_cubit.dart';
import '../../view/user/productDetails/domain/repository/base_product_details_repository.dart';
import '../../view/user/products/data/repository/products_repository.dart';
import '../../view/user/products/domain/repository/base_products_repository.dart';
import '../../view/user/products/presentation/controller/products_cubit.dart';
import '../../view/user/register_user/data/datasource/register_remote_datasource.dart';
import '../../view/user/register_user/data/repository/register_repository.dart';
import '../../view/user/register_user/domain/repository/base_register_repository.dart';
import '../../view/user/register_user/domain/usecases/register.dart';
import '../../view/user/register_user/presentation/controller/register_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Notification
    sl.registerFactory(() => NotificationCubit(sl()));
    sl.registerLazySingleton(() => GetNotification(sl()));

    sl.registerLazySingleton<BaseNotificationRepository>(
            () => NotificationRepository(sl()));

    sl.registerLazySingleton<BaseNotificationRemoteDatasource>(
            () => NotificationRemoteDatasource());

    // Pages
    sl.registerFactory(() => PagesCubit(sl(), sl(), sl() , sl()));
    sl.registerLazySingleton(() => GetFaqs(sl()));
    sl.registerLazySingleton(() => GetTerms(sl()));
    sl.registerLazySingleton(() => GetPrivacyPolicy(sl()));
    sl.registerLazySingleton(() => GetCurrencies(sl()));

    sl.registerLazySingleton<BasePagesRepository>(
            () => PagesRepository(sl()));

    sl.registerLazySingleton<BasePagesRemoteDatasource>(
            () => PagesRemoteDatasource());

    // OrderDetails
    sl.registerFactory(() => OrderDetailsUserCubit(sl()));
    sl.registerLazySingleton(() => CancelOrderUser(sl()));

    sl.registerLazySingleton<BaseOrderDetailsUserRepository>(
            () => OrderDetailsUserRepository(sl()));

    sl.registerLazySingleton<BaseOrderDetailsUserRemoteDatasource>(
            () => OrderDetailsUserRemoteDatasource());

    // MyOrders
    sl.registerFactory(() => MyOrdersCubit(sl(), sl()));
    sl.registerLazySingleton(() => GetMyOrders(sl()));
    sl.registerLazySingleton(() => RateProduct(sl()));

    sl.registerLazySingleton<BaseMyOrdersRepository>(
        () => MyOrdersRepository(sl()));

    sl.registerLazySingleton<BaseMyOrdersRemoteDatasource>(
        () => MyOrdersRemoteDatasource());

    // ProductDetails
    sl.registerFactory(() => ProductDetailsCubit(sl(), sl() , sl(),sl(), sl() , sl()));
    sl.registerLazySingleton(() => GetProductDetails(sl()));
    sl.registerLazySingleton(() => GetRelatedProducts(sl()));
    sl.registerLazySingleton(() => AddToCart(sl()));
    sl.registerLazySingleton(() => GetMarketDetails(sl()));
    sl.registerLazySingleton(() => GetMarketCategories(sl()));
    sl.registerLazySingleton(() => GetMarketProducts(sl()));

    sl.registerLazySingleton<BaseProductDetailsRepository>(
        () => ProductDetailsRepository(sl()));

    sl.registerLazySingleton<BaseProductDetailsRemoteDatasource>(
        () => ProductDetailsRemoteDatasource());

    // Products
    sl.registerFactory(() => CartCubit(sl(),sl(),sl(),sl()));
    sl.registerLazySingleton(() => GetCart(sl()));
    sl.registerLazySingleton(() => UpdateItemQuantity(sl()));
    sl.registerLazySingleton(() => RemoveItem(sl()));
    sl.registerLazySingleton(() => Checkout(sl()));

    sl.registerLazySingleton<BaseCartRepository>(() => CartRepository(sl()));

    sl.registerLazySingleton<BaseCartRemoteDatasource>(
        () => CartRemoteDatasource());

    // Products
    sl.registerFactory(() => ProductsCubit(sl(), sl(), sl(), sl(), sl()));
    sl.registerLazySingleton(() => GetProductBySubCategory(sl()));
    sl.registerLazySingleton(() => GetProductBySortFilter(sl()));
    sl.registerLazySingleton(() => GetProductBySortMaxAndMin(sl()));
    sl.registerLazySingleton(() => GetAllOffers(sl()));
    sl.registerLazySingleton(() => GetAllFreeDelivery(sl()));

    sl.registerLazySingleton<BaseProductsRepository>(
        () => ProductsRepository(sl()));

    sl.registerLazySingleton<BaseProductsRemoteDatasource>(
        () => ProductsRemoteDatasource());

    // Categories
    sl.registerFactory(() => SectionCubit(sl(), sl()));
    sl.registerLazySingleton(() => GetMainCates(sl()));
    sl.registerLazySingleton(() => GetSubCatesAndTopRatedProducts(sl()));

    sl.registerLazySingleton<BaseSectionRepository>(
        () => SectionRepository(sl()));

    sl.registerLazySingleton<BaseSectionRemoteDatasource>(
        () => SectionRemoteDatasource());

    // Home
    sl.registerFactory(() => HomeCubit(sl()));
    sl.registerLazySingleton(() => GetHomeData(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    sl.registerLazySingleton<BaseHomeRemoteDatasource>(
        () => HomeRemoteDatasource());

    // Favorite
    sl.registerFactory(() => FavoritesCubit(sl(), sl(), sl()));
    sl.registerLazySingleton(() => GetFavorites(sl()));
    sl.registerLazySingleton(() => AddFavoriteItem(sl()));
    sl.registerLazySingleton(() => RemoveFavoriteItem(sl()));

    sl.registerLazySingleton<BaseFavoritesRepository>(
        () => FavoritesRepository(sl()));

    sl.registerLazySingleton<BaseFavoritesRemoteDatasource>(
        () => FavoritesRemoteDatasource());

    // Addresses
    sl.registerFactory(() => AddressesCubit(sl(), sl(), sl(), sl(), sl()));
    sl.registerLazySingleton(() => EditAddress(sl()));
    sl.registerLazySingleton(() => AddAddress(sl()));
    sl.registerLazySingleton(() => MakeDefaultAddress(sl()));
    sl.registerLazySingleton(() => DeleteAddress(sl()));
    sl.registerLazySingleton(() => GetAddresses(sl()));

    sl.registerLazySingleton<BaseAddressesRepository>(
        () => AddressesRepository(sl()));

    sl.registerLazySingleton<BaseAddressesRemoteDatasource>(
        () => AddressesRemoteDatasource());

    // profile
    sl.registerFactory(() => EditProfileCubit(sl(), sl(), sl() , sl()));
    sl.registerLazySingleton(() => GetProfileDataUser(sl()));
    sl.registerLazySingleton(() => UpdateProfileData(sl()));
    sl.registerLazySingleton(() => UpdatePassword(sl()));
    sl.registerLazySingleton(() => DeleteAccount(sl()));

    sl.registerLazySingleton<BaseEditProfileRepository>(
        () => EditProfileRepository(sl()));

    sl.registerLazySingleton<BaseEditProfileRemoteDatasource>(
        () => EditProfileRemoteDatasource());

    // forgetPassword
    sl.registerFactory(() => ForgetPasswordUserCubit(sl(), sl(), sl()));
    sl.registerLazySingleton(() => ForgetPasswordUser(sl()));
    sl.registerLazySingleton(() => VerificationCodeUser(sl()));
    sl.registerLazySingleton(() => ChangePasswordUser(sl()));

    sl.registerLazySingleton<BaseForgetPasswordUserRepository>(
        () => ForgetPasswordUserRepository(sl()));

    sl.registerLazySingleton<BaseForgetPasswordUserRemoteDatasource>(
        () => ForgetPasswordUserRemoteDatasource());

    // register
    sl.registerFactory(() => RegisterUserCubit(sl()));
    sl.registerLazySingleton(() => RegisterUser(sl()));

    sl.registerLazySingleton<BaseRegisterUserRepository>(
        () => RegisterUserRepository(sl()));

    sl.registerLazySingleton<BaseRegisterUserRemoteDatasource>(
        () => RegisterUserRemoteDatasource());

    // login
    sl.registerFactory(() => LoginUserCubit(sl()));
    sl.registerLazySingleton(() => LoginUser(sl()));

    sl.registerLazySingleton<BaseLoginUserRepository>(() => LoginUserRepository(sl()));

    sl.registerLazySingleton<BaseLoginUserRemoteDatasource>(
        () => LoginUserRemoteDatasource());

    /// Provider
    // Utils
    sl.registerFactory(() => UtilsCubit(sl() , sl()));
    sl.registerLazySingleton(() => GetSizes(sl()));
    sl.registerLazySingleton(() => GetVerifiedStatus(sl()));

    sl.registerLazySingleton<BaseUtilsRepository>(
            () => UtilsRepository(sl()));

    sl.registerLazySingleton<BaseUtilsRemoteDatasource>(
            () => UtilsRemoteDatasource());

    // Account
    sl.registerFactory(() => AccountCubit(sl() , sl()));
    sl.registerLazySingleton(() => ContactUs(sl()));
    sl.registerLazySingleton(() => DeleteAccountProvider(sl()));

    sl.registerLazySingleton<BaseAccountRepository>(
            () => AccountRepository(sl()));

    sl.registerLazySingleton<BaseAccountRemoteDatasource>(
            () => AccountRemoteDatasource());

    // OrderDetails
    sl.registerFactory(() => OrderDetailsCubit(sl(), sl(), sl(), sl()));
    sl.registerLazySingleton(() => AcceptOrder(sl()));
    sl.registerLazySingleton(() => RejectOrder(sl()));
    sl.registerLazySingleton(() => CancelOrder(sl()));
    sl.registerLazySingleton(() => DeliverOrder(sl()));

    sl.registerLazySingleton<BaseOrderDetailsRepository>(
            () => OrderDetailsRepository(sl()));

    sl.registerLazySingleton<BaseOrderDetailsRemoteDatasource>(
            () => OrderDetailsRemoteDatasource());

    // Orders
    sl.registerFactory(() => OrdersCubit(sl()));
    sl.registerLazySingleton(() => GetOrders(sl()));

    sl.registerLazySingleton<BaseOrdersRepository>(
            () => OrdersRepository(sl()));

    sl.registerLazySingleton<BaseOrdersRemoteDatasource>(
            () => OrdersRemoteDatasource());

    // SizeGuide
    sl.registerFactory(() => SizeGuideCubit(sl(), sl(), sl(), sl()));
    sl.registerLazySingleton(() => GetSizeGuides(sl()));
    sl.registerLazySingleton(() => AddSizeGuides(sl()));
    sl.registerLazySingleton(() => EditSizeGuides(sl()));
    sl.registerLazySingleton(() => DeleteSizeGuides(sl()));

    sl.registerLazySingleton<BaseSizeGuideRepository>(
            () => SizeGuidesRepository(sl()));

    sl.registerLazySingleton<BaseSizeGuideRemoteDatasource>(
            () => SizeGuideRemoteDatasource());

    // DeliveryCost
    sl.registerFactory(() => DeliveryCostCubit(sl(), sl()));
    sl.registerLazySingleton(() => GetDeliveryCost(sl()));
    sl.registerLazySingleton(() => UpdateDeliveryCost(sl()));

    sl.registerLazySingleton<BaseDeliveryCostRepository>(
            () => DeliveryCostRepository(sl()));

    sl.registerLazySingleton<BaseDeliveryCostRemoteDatasource>(
            () => DeliveryCostRemoteDatasource());

    // ReturnPolicy
    sl.registerFactory(() => ReturnPolicyCubit(sl(), sl()));
    sl.registerLazySingleton(() => GetReturnPolicy(sl()));
    sl.registerLazySingleton(() => UpdateReturnPolicy(sl()));

    sl.registerLazySingleton<BaseReturnPolicyRepository>(
            () => ReturnPolicyRepository(sl()));

    sl.registerLazySingleton<BaseReturnPolicyRemoteDatasource>(
            () => ReturnPolicyRemoteDatasource());

    // AddProduct
    sl.registerFactory(() => AddProductCubit(sl(), sl(), sl() , sl(), sl()));
    sl.registerLazySingleton(() => DeleteImage(sl()));
    sl.registerLazySingleton(() => EditProduct(sl()));
    sl.registerLazySingleton(() => AddProduct(sl()));
    // sl.registerLazySingleton(() => GetAllCategories(sl()));

    sl.registerLazySingleton<BaseAddProductRepository>(
            () => AddProductRepository(sl()));

    sl.registerLazySingleton<BaseAddProductRemoteDatasource>(
            () => AddProductRemoteDatasource());

    // SettingMarket
    sl.registerFactory(() => SettingMarketCubit(sl()));
    sl.registerLazySingleton(() => ToggleOpenStatus(sl()));

    sl.registerLazySingleton<BaseSettingMarketRepository>(
            () => SettingMarketRepository(sl()));

    sl.registerLazySingleton<BaseSettingMarketRemoteDatasource>(
            () => SettingMarketRemoteDatasource());

    // Market
    sl.registerFactory(() => MarketCubit(sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerLazySingleton(() => DeleteProduct(sl()));
    sl.registerLazySingleton(() => GetMyRates(sl()));
    sl.registerLazySingleton(() => GetProducts(sl()));
    sl.registerLazySingleton(() => GetAllCategories(sl()));
    sl.registerLazySingleton(() => GetSubCategories(sl()));
    sl.registerLazySingleton(() => EditMarketDetails(sl()));
    sl.registerLazySingleton(() => GetProfileData(sl()));

    sl.registerLazySingleton<BaseMarketRepository>(
            () => MarketRepository(sl()));

    sl.registerLazySingleton<BaseMarketRemoteDatasource>(
            () => MarketRemoteDatasource());

    // forgetPassword
    sl.registerFactory(() => ForgetPasswordCubit(sl(), sl(), sl()));
    sl.registerLazySingleton(() => ForgetPassword(sl()));
    sl.registerLazySingleton(() => VerificationCode(sl()));
    sl.registerLazySingleton(() => ChangePassword(sl()));

    sl.registerLazySingleton<BaseForgetPasswordRepository>(
            () => ForgetPasswordRepository(sl()));

    sl.registerLazySingleton<BaseForgetPasswordRemoteDatasource>(
            () => ForgetPasswordRemoteDatasource());

    // register
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerLazySingleton(() => Register(sl()));

    sl.registerLazySingleton<BaseRegisterRepository>(
            () => RegisterRepository(sl()));

    sl.registerLazySingleton<BaseRegisterRemoteDatasource>(
            () => RegisterRemoteDatasource());

    // login
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerLazySingleton(() => Login(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDatasource>(
            () => LoginRemoteDatasource());
  }
}