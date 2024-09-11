import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'whatsbots_cubit.freezed.dart';
part 'whatsbots_state.dart';

class WhatsbotsCubit extends Cubit<WhatsbotsState> {
  WhatsbotsCubit() : super(const WhatsbotsState.initial());
  bool welcomeMessageEnabled = false;
  bool whatsBotsEnabled = false;
  ExpansionTileController whatsBotsController = ExpansionTileController();
  ExpansionTileController welcomeMessageController = ExpansionTileController();

  final Set<String> selectedChoices = {};
  final List<String> options = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
}
