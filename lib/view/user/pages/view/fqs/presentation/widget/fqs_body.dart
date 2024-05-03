import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/pages/view/controller/pages_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'fqs_card.dart';

class FqsBody extends StatelessWidget {
  const FqsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesCubit, PagesState>(
      builder: (context, state) {
        return state is GetFaqsLoading
            ? const LoadingIndicator()
            : ListView.builder(
                itemCount: PagesCubit.of(context).fqsModel!.body!.length,
                itemBuilder: (context, index) {
                  return FqsCard(
                    title: PagesCubit.of(context)
                            .fqsModel!
                            .body![index]
                            .question ??
                        '',
                    desc:
                        PagesCubit.of(context).fqsModel!.body![index].answer ??
                            '',
                  );
                },
              );
      },
    );
  }
}
