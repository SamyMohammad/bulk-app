import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
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
    AppStrings.sunday.tr(),
    AppStrings.monday.tr(),
    AppStrings.tuesday.tr(),
    AppStrings.wednesday.tr(),
    AppStrings.thursday.tr(),
    AppStrings.friday.tr(),
    AppStrings.saturday.tr()
  ];
}
