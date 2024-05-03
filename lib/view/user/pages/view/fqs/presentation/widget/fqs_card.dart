import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';

class FqsCard extends StatelessWidget {
  const FqsCard({Key? key, required this.title, required this.desc})
      : super(key: key);

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.fontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                desc,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.GrayColor112,
                ),
              ),
              expanded: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    desc,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  )),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
