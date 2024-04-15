import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xbooks_store/core/di/dependency_injection.dart';
import 'package:xbooks_store/core/theming/app_colors.dart';
import 'package:xbooks_store/core/theming/styles.dart';
import 'package:xbooks_store/core/widgets/custom_elevated_button.dart';
import 'package:xbooks_store/features/profile/logic/profile_cubit.dart';
import 'package:xbooks_store/features/profile/logic/profile_state.dart';
import 'package:xbooks_store/features/profile/view/widgets/custom_curved_shape.dart';
import 'package:xbooks_store/features/profile/view/widgets/custom_profile_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>()..emitShowProfileStates(),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileCubit, ProfileState>(
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
                                right: 8.w,
                                left: 70.w,
                                top: 25.h,
                                bottom: 20.h),
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
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 80.r,
                                backgroundColor: Colors.white,
                                child: BlocBuilder<ProfileCubit, ProfileState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      imagePickingSuccess: (data) {
                                        return CircleAvatar(
                                          radius: 75.r,
                                          backgroundImage: (context
                                                      .watch<ProfileCubit>()
                                                      .imagePath !=
                                                  null)
                                              ? FileImage(File(context
                                                      .watch<ProfileCubit>()
                                                      .imagePath!))
                                                  as ImageProvider<Object>?
                                              : NetworkImage(
                                                      response.data!.image!)
                                                  as ImageProvider<Object>?,
                                        );
                                      },
                                      orElse: () {
                                        return CircleAvatar(
                                          radius: 75.r,
                                          backgroundImage: NetworkImage(
                                                  response.data!.image!)
                                              as ImageProvider<Object>?,
                                        );
                                      },
                                      imagePickingError: (error) {
                                        return Center(
                                          child: Text("error $error"),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 10.r,
                                right: 5.r,
                                child: Container(
                                  width: 35.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      context.read<ProfileCubit>().imagePath =
                                          await context
                                              .read<ProfileCubit>()
                                              .pickImage();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 22.0.r,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomProfileFormField(
                            readOnly: false,
                            name: context
                                .read<ProfileCubit>()
                                .nameController
                                .text,
                            nameController:
                                context.read<ProfileCubit>().nameController,
                            email: response.data!.email!,
                            emailController:
                                context.read<ProfileCubit>().emailController,
                            phone: response.data!.phone ?? "phone",
                            phoneController:
                                context.read<ProfileCubit>().phoneController,
                            city: response.data!.city ?? "City",
                            cityController:
                                context.read<ProfileCubit>().cityController,
                            address: response.data!.address ?? "Address",
                            addressController:
                                context.read<ProfileCubit>().addressController,
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              print(
                                  "name name name name name name ${context.read<ProfileCubit>().nameController.text}");

                              context
                                  .read<ProfileCubit>()
                                  .emitUpdateProfileStates();

                              //context.pushNamed(Routes.profileScreen);
                            },
                            width: MediaQuery.of(context).size.width * 0.92,
                            hight: 50.h,
                            text: "Confirm ",
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
        ),
      ),
    );
  }
}
