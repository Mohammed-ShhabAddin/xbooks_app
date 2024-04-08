import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xbooks_store/core/di/dependency_injection.dart';
import 'package:xbooks_store/core/helper/extension.dart';
import 'package:xbooks_store/core/routing/routes.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';
import 'package:xbooks_store/core/theming/styles.dart';
import 'package:xbooks_store/features/profile/data/model/profile_model.dart';
import 'package:xbooks_store/features/profile/logic/profile_cubit.dart';
import 'package:xbooks_store/features/profile/logic/profile_state.dart';
import 'package:xbooks_store/features/profile/view/widgets/custom_profile_form_field.dart';

import '../../../core/widgets/custom_elevated_button.dart';
import 'widgets/custom_curved_shape.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..emitShowProfileStates(),
      child: BlocBuilder<ProfileCubit, ProfileState<Profile>>(
        builder: (context, state) {
          return state.maybeWhen(
            profileLoading: () => Center(
              child: Text(
                "LOADING...",
                style: TextStyles.font16BlueBold,
              ),
            ),
            profileSuccess: (response) {
              return Stack(
                children: [
                  CurvedShape(
                    height: 150.h,
                    color: AppColors.teal,
                    curveHeight: 50.h,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 8.w, left: 70.w, top: 25.h, bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Text(
                              "Profile",
                              style: TextStyles.font32WhiteBold,
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.logout,
                                    color: Colors.white, size: 30))
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 80.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 75.r,
                          backgroundImage: NetworkImage(
                            response.data!.image!,
                          ),
                        ),
                      ),
                      CustomProfileFormField(
                        name: response.data!.name!,
                        email: response.data!.email!,
                        phone: response.data!.phone ?? "phone",
                        city: response.data!.city ?? "City",
                        address: response.data!.address ?? "Address",
                        readOnly: true,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          context.pushNamed(Routes.editingProfileScreen);
                        },
                        width: MediaQuery.of(context).size.width * 0.92,
                        hight: 50.h,
                        text: "Edite ",
                      )
                    ],
                  ),
                ],
              );
            },
            profileError: (error) {
              return Center(child: Text('Error: $error'));
            },
            orElse: () {
              return const Text('something get wrong');
            },
          );
        },
      ),
    );
  }
}
