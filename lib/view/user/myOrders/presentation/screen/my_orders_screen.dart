import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/controller/my_orders_cubit.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/widget/cancelled_list.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/widget/ended_list.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/widget/rejected_list.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/widget/waiting_list.dart';

import '../../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../widgets/visitor_screen.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/ongoing_list.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [
    const WaitingList(),
    const OngoingList(),
    const CancelledList(),
    const RejectedList(),
    const EndedList(),
  ];

  List<Tab> tabs = [];

  TabController? _tabController;

  @override
  void initState() {
    tabs = <Tab>[
      Tab(
          text: tr(navigatorKey.currentState!.context,
              AppStrings.loadingOrdersScreen)),
      Tab(
          text:
              tr(navigatorKey.currentState!.context, AppStrings.loadingStart)),
      Tab(
          text: tr(navigatorKey.currentState!.context,
              AppStrings.regretOrdersScreen)),
      Tab(
          text: tr(navigatorKey.currentState!.context,
              AppStrings.RegretOrdersScreen)),
      Tab(
          text: tr(
              navigatorKey.currentState!.context, AppStrings.exitOrdersScreen)),
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
      create: (context) => MyOrdersCubit(sl(), sl()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            AppStrings.myOrder.translate(),
            style: TextStyle(
              color: AppColors.fontColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: AppColors.primaryColor,
            indicatorColor: AppColors.primaryColor,
            indicatorWeight: 5,
            unselectedLabelColor: Colors.grey,
            onTap: (v) {
              print(v);
            },
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: tabs,
          ),
        ),
        body: AppStorage.isLogged
            ? Container(
                color: const Color.fromRGBO(251, 251, 251, 1),
                child: TabBarView(
                  controller: _tabController,
                  children: screens.map((e) => e).toList(),
                ),
              )
            : VisitorScreen(),
      ),
    );
  }
}
