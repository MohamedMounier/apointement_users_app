// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_appointments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserAppointmentsState {
  UserAppointmentsSteps get step => throw _privateConstructorUsedError;
  RequestState get requestState => throw _privateConstructorUsedError;
  AppointmentStatus get filteredStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<AppointmentEntity> get userBookedAppointments =>
      throw _privateConstructorUsedError;
  List<AppointmentEntity> get filteredUserBookedAppointments =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAppointmentsStateCopyWith<UserAppointmentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAppointmentsStateCopyWith<$Res> {
  factory $UserAppointmentsStateCopyWith(
    UserAppointmentsState value,
    $Res Function(UserAppointmentsState) then,
  ) = _$UserAppointmentsStateCopyWithImpl<$Res, UserAppointmentsState>;
  @useResult
  $Res call({
    UserAppointmentsSteps step,
    RequestState requestState,
    AppointmentStatus filteredStatus,
    String errorMessage,
    List<AppointmentEntity> userBookedAppointments,
    List<AppointmentEntity> filteredUserBookedAppointments,
  });
}

/// @nodoc
class _$UserAppointmentsStateCopyWithImpl<
  $Res,
  $Val extends UserAppointmentsState
>
    implements $UserAppointmentsStateCopyWith<$Res> {
  _$UserAppointmentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? requestState = null,
    Object? filteredStatus = null,
    Object? errorMessage = null,
    Object? userBookedAppointments = null,
    Object? filteredUserBookedAppointments = null,
  }) {
    return _then(
      _value.copyWith(
            step:
                null == step
                    ? _value.step
                    : step // ignore: cast_nullable_to_non_nullable
                        as UserAppointmentsSteps,
            requestState:
                null == requestState
                    ? _value.requestState
                    : requestState // ignore: cast_nullable_to_non_nullable
                        as RequestState,
            filteredStatus:
                null == filteredStatus
                    ? _value.filteredStatus
                    : filteredStatus // ignore: cast_nullable_to_non_nullable
                        as AppointmentStatus,
            errorMessage:
                null == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String,
            userBookedAppointments:
                null == userBookedAppointments
                    ? _value.userBookedAppointments
                    : userBookedAppointments // ignore: cast_nullable_to_non_nullable
                        as List<AppointmentEntity>,
            filteredUserBookedAppointments:
                null == filteredUserBookedAppointments
                    ? _value.filteredUserBookedAppointments
                    : filteredUserBookedAppointments // ignore: cast_nullable_to_non_nullable
                        as List<AppointmentEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserAppointmentsStateImplCopyWith<$Res>
    implements $UserAppointmentsStateCopyWith<$Res> {
  factory _$$UserAppointmentsStateImplCopyWith(
    _$UserAppointmentsStateImpl value,
    $Res Function(_$UserAppointmentsStateImpl) then,
  ) = __$$UserAppointmentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserAppointmentsSteps step,
    RequestState requestState,
    AppointmentStatus filteredStatus,
    String errorMessage,
    List<AppointmentEntity> userBookedAppointments,
    List<AppointmentEntity> filteredUserBookedAppointments,
  });
}

/// @nodoc
class __$$UserAppointmentsStateImplCopyWithImpl<$Res>
    extends
        _$UserAppointmentsStateCopyWithImpl<$Res, _$UserAppointmentsStateImpl>
    implements _$$UserAppointmentsStateImplCopyWith<$Res> {
  __$$UserAppointmentsStateImplCopyWithImpl(
    _$UserAppointmentsStateImpl _value,
    $Res Function(_$UserAppointmentsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? requestState = null,
    Object? filteredStatus = null,
    Object? errorMessage = null,
    Object? userBookedAppointments = null,
    Object? filteredUserBookedAppointments = null,
  }) {
    return _then(
      _$UserAppointmentsStateImpl(
        step:
            null == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                    as UserAppointmentsSteps,
        requestState:
            null == requestState
                ? _value.requestState
                : requestState // ignore: cast_nullable_to_non_nullable
                    as RequestState,
        filteredStatus:
            null == filteredStatus
                ? _value.filteredStatus
                : filteredStatus // ignore: cast_nullable_to_non_nullable
                    as AppointmentStatus,
        errorMessage:
            null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String,
        userBookedAppointments:
            null == userBookedAppointments
                ? _value._userBookedAppointments
                : userBookedAppointments // ignore: cast_nullable_to_non_nullable
                    as List<AppointmentEntity>,
        filteredUserBookedAppointments:
            null == filteredUserBookedAppointments
                ? _value._filteredUserBookedAppointments
                : filteredUserBookedAppointments // ignore: cast_nullable_to_non_nullable
                    as List<AppointmentEntity>,
      ),
    );
  }
}

/// @nodoc

class _$UserAppointmentsStateImpl implements _UserAppointmentsState {
  const _$UserAppointmentsStateImpl({
    this.step = UserAppointmentsSteps.none,
    this.requestState = RequestState.none,
    this.filteredStatus = AppointmentStatus.confirmed,
    this.errorMessage = '',
    final List<AppointmentEntity> userBookedAppointments = const [],
    final List<AppointmentEntity> filteredUserBookedAppointments = const [],
  }) : _userBookedAppointments = userBookedAppointments,
       _filteredUserBookedAppointments = filteredUserBookedAppointments;

  @override
  @JsonKey()
  final UserAppointmentsSteps step;
  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final AppointmentStatus filteredStatus;
  @override
  @JsonKey()
  final String errorMessage;
  final List<AppointmentEntity> _userBookedAppointments;
  @override
  @JsonKey()
  List<AppointmentEntity> get userBookedAppointments {
    if (_userBookedAppointments is EqualUnmodifiableListView)
      return _userBookedAppointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userBookedAppointments);
  }

  final List<AppointmentEntity> _filteredUserBookedAppointments;
  @override
  @JsonKey()
  List<AppointmentEntity> get filteredUserBookedAppointments {
    if (_filteredUserBookedAppointments is EqualUnmodifiableListView)
      return _filteredUserBookedAppointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredUserBookedAppointments);
  }

  @override
  String toString() {
    return 'UserAppointmentsState(step: $step, requestState: $requestState, filteredStatus: $filteredStatus, errorMessage: $errorMessage, userBookedAppointments: $userBookedAppointments, filteredUserBookedAppointments: $filteredUserBookedAppointments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAppointmentsStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.filteredStatus, filteredStatus) ||
                other.filteredStatus == filteredStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(
              other._userBookedAppointments,
              _userBookedAppointments,
            ) &&
            const DeepCollectionEquality().equals(
              other._filteredUserBookedAppointments,
              _filteredUserBookedAppointments,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    requestState,
    filteredStatus,
    errorMessage,
    const DeepCollectionEquality().hash(_userBookedAppointments),
    const DeepCollectionEquality().hash(_filteredUserBookedAppointments),
  );

  /// Create a copy of UserAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAppointmentsStateImplCopyWith<_$UserAppointmentsStateImpl>
  get copyWith =>
      __$$UserAppointmentsStateImplCopyWithImpl<_$UserAppointmentsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _UserAppointmentsState implements UserAppointmentsState {
  const factory _UserAppointmentsState({
    final UserAppointmentsSteps step,
    final RequestState requestState,
    final AppointmentStatus filteredStatus,
    final String errorMessage,
    final List<AppointmentEntity> userBookedAppointments,
    final List<AppointmentEntity> filteredUserBookedAppointments,
  }) = _$UserAppointmentsStateImpl;

  @override
  UserAppointmentsSteps get step;
  @override
  RequestState get requestState;
  @override
  AppointmentStatus get filteredStatus;
  @override
  String get errorMessage;
  @override
  List<AppointmentEntity> get userBookedAppointments;
  @override
  List<AppointmentEntity> get filteredUserBookedAppointments;

  /// Create a copy of UserAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAppointmentsStateImplCopyWith<_$UserAppointmentsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
