// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_appointment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookAppointmentState {
  BookAppointmentSteps get step => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<String>? get availableTimes => throw _privateConstructorUsedError;
  String? get selectedTime => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  SpecialistEntity? get selectedSpecialist =>
      throw _privateConstructorUsedError;
  AppointmentEntity? get bookedAppointment =>
      throw _privateConstructorUsedError;

  /// Create a copy of BookAppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookAppointmentStateCopyWith<BookAppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookAppointmentStateCopyWith<$Res> {
  factory $BookAppointmentStateCopyWith(
    BookAppointmentState value,
    $Res Function(BookAppointmentState) then,
  ) = _$BookAppointmentStateCopyWithImpl<$Res, BookAppointmentState>;
  @useResult
  $Res call({
    BookAppointmentSteps step,
    bool isLoading,
    String? errorMessage,
    List<String>? availableTimes,
    String? selectedTime,
    DateTime? selectedDate,
    SpecialistEntity? selectedSpecialist,
    AppointmentEntity? bookedAppointment,
  });
}

/// @nodoc
class _$BookAppointmentStateCopyWithImpl<
  $Res,
  $Val extends BookAppointmentState
>
    implements $BookAppointmentStateCopyWith<$Res> {
  _$BookAppointmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookAppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? availableTimes = freezed,
    Object? selectedTime = freezed,
    Object? selectedDate = freezed,
    Object? selectedSpecialist = freezed,
    Object? bookedAppointment = freezed,
  }) {
    return _then(
      _value.copyWith(
            step:
                null == step
                    ? _value.step
                    : step // ignore: cast_nullable_to_non_nullable
                        as BookAppointmentSteps,
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
            availableTimes:
                freezed == availableTimes
                    ? _value.availableTimes
                    : availableTimes // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            selectedTime:
                freezed == selectedTime
                    ? _value.selectedTime
                    : selectedTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            selectedDate:
                freezed == selectedDate
                    ? _value.selectedDate
                    : selectedDate // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            selectedSpecialist:
                freezed == selectedSpecialist
                    ? _value.selectedSpecialist
                    : selectedSpecialist // ignore: cast_nullable_to_non_nullable
                        as SpecialistEntity?,
            bookedAppointment:
                freezed == bookedAppointment
                    ? _value.bookedAppointment
                    : bookedAppointment // ignore: cast_nullable_to_non_nullable
                        as AppointmentEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookAppointmentStateImplCopyWith<$Res>
    implements $BookAppointmentStateCopyWith<$Res> {
  factory _$$BookAppointmentStateImplCopyWith(
    _$BookAppointmentStateImpl value,
    $Res Function(_$BookAppointmentStateImpl) then,
  ) = __$$BookAppointmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BookAppointmentSteps step,
    bool isLoading,
    String? errorMessage,
    List<String>? availableTimes,
    String? selectedTime,
    DateTime? selectedDate,
    SpecialistEntity? selectedSpecialist,
    AppointmentEntity? bookedAppointment,
  });
}

/// @nodoc
class __$$BookAppointmentStateImplCopyWithImpl<$Res>
    extends _$BookAppointmentStateCopyWithImpl<$Res, _$BookAppointmentStateImpl>
    implements _$$BookAppointmentStateImplCopyWith<$Res> {
  __$$BookAppointmentStateImplCopyWithImpl(
    _$BookAppointmentStateImpl _value,
    $Res Function(_$BookAppointmentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookAppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? availableTimes = freezed,
    Object? selectedTime = freezed,
    Object? selectedDate = freezed,
    Object? selectedSpecialist = freezed,
    Object? bookedAppointment = freezed,
  }) {
    return _then(
      _$BookAppointmentStateImpl(
        step:
            null == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                    as BookAppointmentSteps,
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
        availableTimes:
            freezed == availableTimes
                ? _value._availableTimes
                : availableTimes // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        selectedTime:
            freezed == selectedTime
                ? _value.selectedTime
                : selectedTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        selectedDate:
            freezed == selectedDate
                ? _value.selectedDate
                : selectedDate // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        selectedSpecialist:
            freezed == selectedSpecialist
                ? _value.selectedSpecialist
                : selectedSpecialist // ignore: cast_nullable_to_non_nullable
                    as SpecialistEntity?,
        bookedAppointment:
            freezed == bookedAppointment
                ? _value.bookedAppointment
                : bookedAppointment // ignore: cast_nullable_to_non_nullable
                    as AppointmentEntity?,
      ),
    );
  }
}

/// @nodoc

class _$BookAppointmentStateImpl implements _BookAppointmentState {
  const _$BookAppointmentStateImpl({
    this.step = BookAppointmentSteps.none,
    this.isLoading = false,
    this.errorMessage,
    final List<String>? availableTimes,
    this.selectedTime,
    this.selectedDate,
    this.selectedSpecialist,
    this.bookedAppointment,
  }) : _availableTimes = availableTimes;

  @override
  @JsonKey()
  final BookAppointmentSteps step;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  final List<String>? _availableTimes;
  @override
  List<String>? get availableTimes {
    final value = _availableTimes;
    if (value == null) return null;
    if (_availableTimes is EqualUnmodifiableListView) return _availableTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? selectedTime;
  @override
  final DateTime? selectedDate;
  @override
  final SpecialistEntity? selectedSpecialist;
  @override
  final AppointmentEntity? bookedAppointment;

  @override
  String toString() {
    return 'BookAppointmentState(step: $step, isLoading: $isLoading, errorMessage: $errorMessage, availableTimes: $availableTimes, selectedTime: $selectedTime, selectedDate: $selectedDate, selectedSpecialist: $selectedSpecialist, bookedAppointment: $bookedAppointment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookAppointmentStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(
              other._availableTimes,
              _availableTimes,
            ) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedSpecialist, selectedSpecialist) ||
                other.selectedSpecialist == selectedSpecialist) &&
            (identical(other.bookedAppointment, bookedAppointment) ||
                other.bookedAppointment == bookedAppointment));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    isLoading,
    errorMessage,
    const DeepCollectionEquality().hash(_availableTimes),
    selectedTime,
    selectedDate,
    selectedSpecialist,
    bookedAppointment,
  );

  /// Create a copy of BookAppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookAppointmentStateImplCopyWith<_$BookAppointmentStateImpl>
  get copyWith =>
      __$$BookAppointmentStateImplCopyWithImpl<_$BookAppointmentStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BookAppointmentState implements BookAppointmentState {
  const factory _BookAppointmentState({
    final BookAppointmentSteps step,
    final bool isLoading,
    final String? errorMessage,
    final List<String>? availableTimes,
    final String? selectedTime,
    final DateTime? selectedDate,
    final SpecialistEntity? selectedSpecialist,
    final AppointmentEntity? bookedAppointment,
  }) = _$BookAppointmentStateImpl;

  @override
  BookAppointmentSteps get step;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  List<String>? get availableTimes;
  @override
  String? get selectedTime;
  @override
  DateTime? get selectedDate;
  @override
  SpecialistEntity? get selectedSpecialist;
  @override
  AppointmentEntity? get bookedAppointment;

  /// Create a copy of BookAppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookAppointmentStateImplCopyWith<_$BookAppointmentStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
