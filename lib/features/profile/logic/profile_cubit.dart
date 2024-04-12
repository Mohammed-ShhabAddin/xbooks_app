import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/storage/app_local_storage.dart';
import '../data/model/profile_model.dart';
import '../data/model/update_profile_request_body.dart';
import '../data/repo/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState<Profile>> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? imagePath;
  final formkey = GlobalKey<FormState>();

  void emitUpdateProfileStates() async {
    print("Updating profile...");
    print("name controller ${nameController.text} ");

    emit(const ProfileState.profileUpdateLoading());
    var storedToken = await AppLocal.getCachedDataX(AppLocal.token) ?? "";
    var oldImagePath = await AppLocal.getCachedDataX(AppLocal.imageKey) ?? "";
    var file = await MultipartFile.fromFile(
      imagePath ?? oldImagePath,
      filename: imagePath ?? oldImagePath,
    );

    final response = await _profileRepo.updateProfile(
      token: "Bearer $storedToken",
      body: UpdateProfileRequestBody(
        name: nameController.text,
        phone: phoneController.text,
        address: addressController.text,
        city: cityController.text,
        files: [file],
      ),
    );
    response.when(success: (profileResponse) {
      print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
      emit(ProfileState.profileUpdateSuccess(profileResponse));
      print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
    }, failure: (error) {
      print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");

      emit(ProfileState.profileUpdateError(
          error: error.apiErrorModel.message ?? ""));
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

  Future<String?> uploadImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheDataX(AppLocal.imageKey, pickedImage.path);
      debugPrint("Image get picked ${pickedImage.path}");
      return pickedImage.path;
    } else {
      return null;
    }
  }
}
