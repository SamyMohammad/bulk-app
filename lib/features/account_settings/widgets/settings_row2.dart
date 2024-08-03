import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/account_settings/logic/cubit/account_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsRow2 extends StatelessWidget {
  const SettingsRow2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Language",
          style: TextStyles.font15whiteMedium.copyWith(
            color: ColorsManager.limeColor,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.saerchTextFieldHintColor),
          ),
          child: DropdownButtonHideUnderline(
            child: BlocBuilder<AccountSettingsCubit, AccountSettingsState>(
              builder: (context, state) {
                return DropdownButton<String>(
                  value:
                      BlocProvider.of<AccountSettingsCubit>(context).language,
                  icon: const Icon(Icons.keyboard_arrow_down_sharp,
                      color: ColorsManager.limeColor),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: Colors.black,
                  onChanged: (String? newValue) {
                    BlocProvider.of<AccountSettingsCubit>(context)
                        .updateLanguage(newValue!);
                  },
                  items: BlocProvider.of<AccountSettingsCubit>(context)
                      .languages
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
