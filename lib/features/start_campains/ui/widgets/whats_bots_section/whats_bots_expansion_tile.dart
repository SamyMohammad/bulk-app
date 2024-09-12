import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/whats_bots/ui/widgets/custom_container.dart';
import 'package:bulk_app/features/whats_bots/ui/widgets/custom_expansion_tile.dart';
import 'package:bulk_app/features/whats_bots/ui/widgets/whats_bots_section/bots_templates_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/whatsbots_cubit.dart';

class WhatsBotsExpansionTile extends StatefulWidget {
  const WhatsBotsExpansionTile({super.key});

  @override
  State<WhatsBotsExpansionTile> createState() => _WhatsBotsExpansionTileState();
}

class _WhatsBotsExpansionTileState extends State<WhatsBotsExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        widget: CustomExpansionTile(
      title: 'Whats Bot',
      isEnabled: context.read<WhatsbotsCubit>().whatsBotsEnabled,
      controller: context.read<WhatsbotsCubit>().whatsBotsController,
      children: [
        SizedBox(
            height: context.height * 0.5, child: const BotsTemplatesListView()),
      ],
    ));
  }
}
