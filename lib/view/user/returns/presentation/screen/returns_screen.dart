import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/returns/presentation/widget/done_return_list.dart';
import 'package:wein_buyer/view/user/returns/presentation/widget/ended_return_list.dart';
import 'package:wein_buyer/view/user/returns/presentation/widget/waiting_return_list.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class ReturnsScreen extends StatefulWidget {
  const ReturnsScreen({Key? key}) : super(key: key);

  @override
  State<ReturnsScreen> createState() => _ReturnsScreenState();
}

class _ReturnsScreenState extends State<ReturnsScreen>
    with SingleTickerProviderStateMixin {
  static  List<Tab> tabs = <Tab>[
    Tab(text: AppStrings.executionBed.translate()),
    Tab(text:AppStrings.productReceived.translate() ),
    Tab(text: AppStrings.exoplayer.translate()),
  ];

  List<Widget> screens = [
    WaitingReturnList(),
    DoneReturnList(),
    EndedReturnList(),
  ];

  TabController? _tabController;

  @override
  void initState() {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
            AppStrings.returns.translate(),
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
      body: Container(
        color: const Color.fromRGBO(251, 251, 251, 1),
        child: TabBarView(
          controller: _tabController,
          children: screens.map((e) => e).toList(),
        ),
      ),
    );
  }
}
