import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/app_local_storage.dart';
import '../data/model/profile_model.dart';
import '../data/model/update_profile_request_body.dart';
import '../data/repo/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState<Profile>> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitUpdateProfileStates() async {
    emit(const ProfileState.profileLoading());
    var storedToken = await AppLocal.getCachedDataX(AppLocal.token) ?? "";
    final response = await _profileRepo.updateProfile(
      token: "Bearer $storedToken",
      body: UpdateProfileRequestBody(
          name: nameController.text,
          phone: phoneController.text,
          address: addressController.text,
          city: cityController.text,
          files: []),
    );
    response.when(success: (profileResponse) {
      emit(ProfileState.profileSuccess(profileResponse));
    }, failure: (error) {
      emit(ProfileState.profileError(error: error.apiErrorModel.message ?? ""));
    });
  }

  void emitShowProfileStates() async {
    emit(const ProfileState.profileLoading());
    String storedToken = await AppLocal.getCachedDataX(AppLocal.token) ?? "";
    print(" Token is  $storedToken");
    final response = await _profileRepo.showProfile(
      token: "Bearer $storedToken",
    );
    response.when(success: (profileResponse) {
      emit(ProfileState.profileSuccess(profileResponse));
    }, failure: (error) {
      emit(ProfileState.profileError(error: error.apiErrorModel.message ?? ""));
    });
  }
}
