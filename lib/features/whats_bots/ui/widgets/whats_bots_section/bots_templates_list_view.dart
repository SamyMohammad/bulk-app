import 'package:bulk_app/features/whats_bots/ui/widgets/whats_bots_section/bot_template_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BotsTemplatesListView extends StatefulWidget {
  const BotsTemplatesListView({super.key});

  @override
  State<BotsTemplatesListView> createState() => _BotsTemplatesListViewState();
}

class _BotsTemplatesListViewState extends State<BotsTemplatesListView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList.separated(
        separatorBuilder: (context, index) => 18.verticalSpace,
        itemBuilder: (BuildContext context, int index) {
          return const BotTemplateItem();
        },
        itemCount: 20, // Number of list items
      )
    ]);
  }
}
