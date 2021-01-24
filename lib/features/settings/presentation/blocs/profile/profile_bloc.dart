import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/settings/domain/repositories/i_user_repository.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

part 'profile_bloc.freezed.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._userRepository)
      : super(const ProfileInitial(
          user: null,
        ));

  final IUserRepository _userRepository;

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield* event.map(
      started: _startedToState,
    );
  }

  Stream<ProfileState> _startedToState(ProfileStarted event) async* {
    yield ProfileInProgress(
      user: state.user,
    );

    final response = await _userRepository.getCurrentUser();

    yield response.fold(
      (error) => ProfileFailure(
        user: state.user,
        error: error,
      ),
      (user) => ProfileSuccess(
        user: user,
      ),
    );
  }
}

extension ProfileBlocBuildContextX on BuildContext {
  ProfileBloc get profileBloc => BlocProvider.of<ProfileBloc>(this);
}
