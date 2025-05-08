// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  UserEntity? get currentUser => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  RequestState? get requestState => throw _privateConstructorUsedError;
  UserSteps? get userSteps => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    UserEntity? currentUser,
    bool isLoading,
    String? errorMessage,
    RequestState? requestState,
    UserSteps? userSteps,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? requestState = freezed,
    Object? userSteps = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentUser:
                freezed == currentUser
                    ? _value.currentUser
                    : currentUser // ignore: cast_nullable_to_non_nullable
                        as UserEntity?,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            requestState:
                freezed == requestState
                    ? _value.requestState
                    : requestState // ignore: cast_nullable_to_non_nullable
                        as RequestState?,
            userSteps:
                freezed == userSteps
                    ? _value.userSteps
                    : userSteps // ignore: cast_nullable_to_non_nullable
                        as UserSteps?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserEntity? currentUser,
    bool isLoading,
    String? errorMessage,
    RequestState? requestState,
    UserSteps? userSteps,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? requestState = freezed,
    Object? userSteps = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        currentUser:
            freezed == currentUser
                ? _value.currentUser
                : currentUser // ignore: cast_nullable_to_non_nullable
                    as UserEntity?,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        requestState:
            freezed == requestState
                ? _value.requestState
                : requestState // ignore: cast_nullable_to_non_nullable
                    as RequestState?,
        userSteps:
            freezed == userSteps
                ? _value.userSteps
                : userSteps // ignore: cast_nullable_to_non_nullable
                    as UserSteps?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.currentUser,
    this.isLoading = false,
    this.errorMessage,
    this.requestState,
    this.userSteps,
  });

  @override
  final UserEntity? currentUser;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final RequestState? requestState;
  @override
  final UserSteps? userSteps;

  @override
  String toString() {
    return 'HomeState(currentUser: $currentUser, isLoading: $isLoading, errorMessage: $errorMessage, requestState: $requestState, userSteps: $userSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.userSteps, userSteps) ||
                other.userSteps == userSteps));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentUser,
    isLoading,
    errorMessage,
    requestState,
    userSteps,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final UserEntity? currentUser,
    final bool isLoading,
    final String? errorMessage,
    final RequestState? requestState,
    final UserSteps? userSteps,
  }) = _$HomeStateImpl;

  @override
  UserEntity? get currentUser;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  RequestState? get requestState;
  @override
  UserSteps? get userSteps;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
