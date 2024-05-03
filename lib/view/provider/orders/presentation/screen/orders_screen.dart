import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/notification/presentation/screen/notification_screen.dart';
import 'package:wein_buyer/view/provider/orders/presentation/controller/orders_cubit.dart';
import 'package:wein_buyer/view/provider/utils/presentation/controller/utils_cubit.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/services/services_locator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/cancelled_list.dart';
import '../widget/coming_list.dart';
import '../widget/ended_list.dart';
import '../widget/ongoing_list.dart';
import '../widget/rejected_list.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [];

  List<Widget> screens = [
    const ComingList(),
    const OngoingList(),
    const CancelledList(),
    const RejectedList(),
    const EndedList(),
  ];

  TabController? _tabController;

  @override
  void initState() {
    tabs = <Tab>[
      Tab(text: AppStrings.ordersScreen.translate()),
      Tab(text: AppStrings.loadingOrdersScreen.translate()),
      Tab(text: AppStrings.regretOrdersScreen.translate()),
      Tab(text: AppStrings.RegretOrdersScreen.translate()),
      Tab(text: AppStrings.exitOrdersScreen.translate()),
    ];
    _tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(sl()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            AppStrings.orders.translate(),
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                MagicRouter.navigateTo(const NotificationScreen());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getProportionateScreenWidth(20),
                  vertical: AppSizes.getProportionateScreenHeight(5),
                ),
                child: Container(
                  padding:
                      EdgeInsets.all(AppSizes.getProportionateScreenWidth(12)),
                  decoration: BoxDecoration(
                    color: AppColors.GrayColor239,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            labelColor: AppColors.primaryColor,
            indicatorColor: AppColors.primaryColor,
            indicatorWeight: 5,
            unselectedLabelColor: Colors.grey,
            onTap: (v) {
            },
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: tabs,
          ),
        ),
        body: Container(
          color: const Color.fromRGBO(251, 251, 251, 1),
          child: TabBarView(
            controller: _tabController,
            children: screens.map((e) => e).toList(),
          ),
        ),
      ),
    );
  }
}
