import 'package:bulk_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/whats_bots_screen_body.dart';

class WhatsBotsScreen extends StatelessWidget {
  const WhatsBotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyCustomAppBar(title: 'WhatsBots'),
      body: WhatsBotsBody(),
    );
  }
}
