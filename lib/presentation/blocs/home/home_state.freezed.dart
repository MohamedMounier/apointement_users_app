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
  UserSteps? get userSteps =>
      throw _privateConstructorUsedError; // Specializations Categories
  List<SpecializationCategoryEntity> get categories =>
      throw _privateConstructorUsedError;
  SpecializationCategoryEntity? get chosenCategory =>
      throw _privateConstructorUsedError;
  bool get isLoadingCategories => throw _privateConstructorUsedError;
  int get currentIndex =>
      throw _privateConstructorUsedError; // Specialists & Pagination
  List<SpecialistEntity> get specialists => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastSpecialistDoc =>
      throw _privateConstructorUsedError;
  bool get hasMoreSpecialists => throw _privateConstructorUsedError;
  bool get isLoadingSpecialists => throw _privateConstructorUsedError;

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
    List<SpecializationCategoryEntity> categories,
    SpecializationCategoryEntity? chosenCategory,
    bool isLoadingCategories,
    int currentIndex,
    List<SpecialistEntity> specialists,
    DocumentSnapshot<Object?>? lastSpecialistDoc,
    bool hasMoreSpecialists,
    bool isLoadingSpecialists,
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
    Object? categories = null,
    Object? chosenCategory = freezed,
    Object? isLoadingCategories = null,
    Object? currentIndex = null,
    Object? specialists = null,
    Object? lastSpecialistDoc = freezed,
    Object? hasMoreSpecialists = null,
    Object? isLoadingSpecialists = null,
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
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<SpecializationCategoryEntity>,
            chosenCategory:
                freezed == chosenCategory
                    ? _value.chosenCategory
                    : chosenCategory // ignore: cast_nullable_to_non_nullable
                        as SpecializationCategoryEntity?,
            isLoadingCategories:
                null == isLoadingCategories
                    ? _value.isLoadingCategories
                    : isLoadingCategories // ignore: cast_nullable_to_non_nullable
                        as bool,
            currentIndex:
                null == currentIndex
                    ? _value.currentIndex
                    : currentIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            specialists:
                null == specialists
                    ? _value.specialists
                    : specialists // ignore: cast_nullable_to_non_nullable
                        as List<SpecialistEntity>,
            lastSpecialistDoc:
                freezed == lastSpecialistDoc
                    ? _value.lastSpecialistDoc
                    : lastSpecialistDoc // ignore: cast_nullable_to_non_nullable
                        as DocumentSnapshot<Object?>?,
            hasMoreSpecialists:
                null == hasMoreSpecialists
                    ? _value.hasMoreSpecialists
                    : hasMoreSpecialists // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoadingSpecialists:
                null == isLoadingSpecialists
                    ? _value.isLoadingSpecialists
                    : isLoadingSpecialists // ignore: cast_nullable_to_non_nullable
                        as bool,
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
    List<SpecializationCategoryEntity> categories,
    SpecializationCategoryEntity? chosenCategory,
    bool isLoadingCategories,
    int currentIndex,
    List<SpecialistEntity> specialists,
    DocumentSnapshot<Object?>? lastSpecialistDoc,
    bool hasMoreSpecialists,
    bool isLoadingSpecialists,
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
    Object? categories = null,
    Object? chosenCategory = freezed,
    Object? isLoadingCategories = null,
    Object? currentIndex = null,
    Object? specialists = null,
    Object? lastSpecialistDoc = freezed,
    Object? hasMoreSpecialists = null,
    Object? isLoadingSpecialists = null,
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
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<SpecializationCategoryEntity>,
        chosenCategory:
            freezed == chosenCategory
                ? _value.chosenCategory
                : chosenCategory // ignore: cast_nullable_to_non_nullable
                    as SpecializationCategoryEntity?,
        isLoadingCategories:
            null == isLoadingCategories
                ? _value.isLoadingCategories
                : isLoadingCategories // ignore: cast_nullable_to_non_nullable
                    as bool,
        currentIndex:
            null == currentIndex
                ? _value.currentIndex
                : currentIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        specialists:
            null == specialists
                ? _value._specialists
                : specialists // ignore: cast_nullable_to_non_nullable
                    as List<SpecialistEntity>,
        lastSpecialistDoc:
            freezed == lastSpecialistDoc
                ? _value.lastSpecialistDoc
                : lastSpecialistDoc // ignore: cast_nullable_to_non_nullable
                    as DocumentSnapshot<Object?>?,
        hasMoreSpecialists:
            null == hasMoreSpecialists
                ? _value.hasMoreSpecialists
                : hasMoreSpecialists // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoadingSpecialists:
            null == isLoadingSpecialists
                ? _value.isLoadingSpecialists
                : isLoadingSpecialists // ignore: cast_nullable_to_non_nullable
                    as bool,
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
    final List<SpecializationCategoryEntity> categories = const [],
    this.chosenCategory,
    this.isLoadingCategories = false,
    this.currentIndex = 0,
    final List<SpecialistEntity> specialists = const [],
    this.lastSpecialistDoc,
    this.hasMoreSpecialists = false,
    this.isLoadingSpecialists = false,
  }) : _categories = categories,
       _specialists = specialists;

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
  // Specializations Categories
  final List<SpecializationCategoryEntity> _categories;
  // Specializations Categories
  @override
  @JsonKey()
  List<SpecializationCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final SpecializationCategoryEntity? chosenCategory;
  @override
  @JsonKey()
  final bool isLoadingCategories;
  @override
  @JsonKey()
  final int currentIndex;
  // Specialists & Pagination
  final List<SpecialistEntity> _specialists;
  // Specialists & Pagination
  @override
  @JsonKey()
  List<SpecialistEntity> get specialists {
    if (_specialists is EqualUnmodifiableListView) return _specialists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialists);
  }

  @override
  final DocumentSnapshot<Object?>? lastSpecialistDoc;
  @override
  @JsonKey()
  final bool hasMoreSpecialists;
  @override
  @JsonKey()
  final bool isLoadingSpecialists;

  @override
  String toString() {
    return 'HomeState(currentUser: $currentUser, isLoading: $isLoading, errorMessage: $errorMessage, requestState: $requestState, userSteps: $userSteps, categories: $categories, chosenCategory: $chosenCategory, isLoadingCategories: $isLoadingCategories, currentIndex: $currentIndex, specialists: $specialists, lastSpecialistDoc: $lastSpecialistDoc, hasMoreSpecialists: $hasMoreSpecialists, isLoadingSpecialists: $isLoadingSpecialists)';
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
                other.userSteps == userSteps) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.chosenCategory, chosenCategory) ||
                other.chosenCategory == chosenCategory) &&
            (identical(other.isLoadingCategories, isLoadingCategories) ||
                other.isLoadingCategories == isLoadingCategories) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality().equals(
              other._specialists,
              _specialists,
            ) &&
            (identical(other.lastSpecialistDoc, lastSpecialistDoc) ||
                other.lastSpecialistDoc == lastSpecialistDoc) &&
            (identical(other.hasMoreSpecialists, hasMoreSpecialists) ||
                other.hasMoreSpecialists == hasMoreSpecialists) &&
            (identical(other.isLoadingSpecialists, isLoadingSpecialists) ||
                other.isLoadingSpecialists == isLoadingSpecialists));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentUser,
    isLoading,
    errorMessage,
    requestState,
    userSteps,
    const DeepCollectionEquality().hash(_categories),
    chosenCategory,
    isLoadingCategories,
    currentIndex,
    const DeepCollectionEquality().hash(_specialists),
    lastSpecialistDoc,
    hasMoreSpecialists,
    isLoadingSpecialists,
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
    final List<SpecializationCategoryEntity> categories,
    final SpecializationCategoryEntity? chosenCategory,
    final bool isLoadingCategories,
    final int currentIndex,
    final List<SpecialistEntity> specialists,
    final DocumentSnapshot<Object?>? lastSpecialistDoc,
    final bool hasMoreSpecialists,
    final bool isLoadingSpecialists,
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
  UserSteps? get userSteps; // Specializations Categories
  @override
  List<SpecializationCategoryEntity> get categories;
  @override
  SpecializationCategoryEntity? get chosenCategory;
  @override
  bool get isLoadingCategories;
  @override
  int get currentIndex; // Specialists & Pagination
  @override
  List<SpecialistEntity> get specialists;
  @override
  DocumentSnapshot<Object?>? get lastSpecialistDoc;
  @override
  bool get hasMoreSpecialists;
  @override
  bool get isLoadingSpecialists;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
