import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.profileLoading() = ProfileLoading;
  const factory ProfileState.profileSuccess(T data) = ProfileSuccess<T>;
  const factory ProfileState.profileError({required String error}) =
      ProfileError;

  const factory ProfileState.profileUpdateLoading() = ProfileUpdateLoading;
  const factory ProfileState.profileUpdateSuccess(T data) =
      ProfileUpdateSuccess<T>;
  const factory ProfileState.profileUpdateError({required String error}) =
      ProfileUpdateError;
}
