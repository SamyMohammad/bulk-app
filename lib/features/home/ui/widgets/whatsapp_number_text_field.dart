import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatsAppNumberTextField extends StatelessWidget {
  const WhatsAppNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .055,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Enter WhatsApp number',
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.sp)),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
