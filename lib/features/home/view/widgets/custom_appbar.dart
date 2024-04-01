import 'package:flutter/material.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';

import '../../../../core/theming/styles.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  const XAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 50,
      leadingWidth: 30, // Reduce the space for leading widget
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO:handel this to come from api " NAME " and the profile PIC⏬↙↙
          Text(
            'Hi mohammed',
            style: TextStyles.font20BlackBold,
          ),
          Text(
            'What are you reading today?',
            style: TextStyles.font16GrayMedium,
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.blueTurquoise,
            //PIC⏬↘↘↘
            //backgroundImage: AssetImage(' '),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
