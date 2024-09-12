import 'package:bulk_app/features/whats_bots/ui/widgets/welcome_message_sction/welcome_mesage_expansion_tile.dart';
import 'package:bulk_app/features/whats_bots/ui/widgets/whats_bots_section/whats_bots_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/whatsbots_cubit.dart';

class WhatsBotsBody extends StatefulWidget {
  const WhatsBotsBody({super.key});

  @override
  State<WhatsBotsBody> createState() => _WhatsBotsBodyState();
}

class _WhatsBotsBodyState extends State<WhatsBotsBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WhatsbotsCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            20.verticalSpace,
            const WelcomeMesageExpansionTile(),
            20.verticalSpace,
            const WhatsBotsExpansionTile()
          ],
        ),
      ),
    );
  }
}
