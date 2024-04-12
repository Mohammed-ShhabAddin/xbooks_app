import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xbooks_store/core/helper/extension.dart';
import 'package:xbooks_store/core/routing/routes.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';

import '../../../../core/theming/styles.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  const XAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: kToolbarHeight + 50,
      leadingWidth: 30, // Reduce the space for leading widget
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.menu,
      //   ),
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      //),
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

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.teal,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.blueTurquoise,
                  //PIC⏬↘↘↘
                  //backgroundImage: AssetImage(' '),
                ),
                SizedBox(height: 10.h),
                Text('User Name', style: TextStyles.font18WhiteBold),
                const SizedBox(height: 5.0),
                Text(
                  'user@example.com',
                  style: TextStyles.font16WhiteSemiBold,
                ),
              ],
            ),
          ),
          buildDrawerItem(
              Icons.history, AppColors.greyTaupe, 'Order History', () {}),
          buildDrawerItem(Icons.edit, AppColors.greyTaupe, 'Edit Profile', () {
            context.pushReplacementNamed(Routes.editingProfileScreen);
          }),
          buildDrawerItem(Icons.change_circle, AppColors.greyTaupe,
              'Change Password', () {}),
          buildDrawerItem(Icons.logout, Colors.red, 'Log Out', () {}),
        ],
      ),
    );
  }

  Widget buildDrawerItem(
      IconData icon, Color iconColor, String title, void Function()? onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: iconColor,
          ),
          title: Text(
            title,
            style: TextStyles.font18GrayBold,
          ),
          onTap: onTap,
        ),
        Divider(
          indent: 20.w,
          endIndent: 20.w,
          thickness: 2,
        ),
      ],
    );
  }
}
