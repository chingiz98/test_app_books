part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    @required @nullable User user,
  }) = ProfileInitial;

  const factory ProfileState.inProgress({
    @required @nullable User user,
  }) = ProfileInProgress;

  const factory ProfileState.success({
    @required User user,
  }) = ProfileSuccess;

  const factory ProfileState.failure({
    @required AppError error,
    @required @nullable User user,
  }) = ProfileFailure;
}
