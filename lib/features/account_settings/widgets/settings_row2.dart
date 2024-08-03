import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsRow2 extends StatelessWidget {
  SettingsRow2({
    super.key,
  });

  final List<String> list = ['En', 'Ar'];

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
            child: DropdownButton<String>(
              value: list.first,
              icon: Icon(Icons.keyboard_arrow_down_sharp,
                  color: ColorsManager.limeColor),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.white),
              dropdownColor: Colors.black,
              onChanged: (String? newValue) {
                // This is called when the user selects an item.
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
