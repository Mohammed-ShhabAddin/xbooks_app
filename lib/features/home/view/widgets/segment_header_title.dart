import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const HeaderTitle({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          " $title",
          style: TextStyles.font20BlackBold,
        ),
        //TODO change it to be Icon Button
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 35.sp,
          ),
          onPressed: onPressed,
        )
      ],
    );
  }
}
