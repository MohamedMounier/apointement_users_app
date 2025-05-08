part of 'uicontrol_cubit.dart';

@immutable
 class UiControlState {
  final bool isLoading;
  final String? snackBarMessage;
  final bool isSnackBarVisible;

  const UiControlState({
    required this.isLoading,
    this.snackBarMessage,
    required this.isSnackBarVisible,
  });

  // Initial state
  factory UiControlState.initial() {
    return const UiControlState(
      isLoading: false,
      snackBarMessage: null,
      isSnackBarVisible: false,
    );
  }

  // Method to copy the state with new values
  UiControlState copyWith({
    bool? isLoading,
    String? snackBarMessage,
    bool? isSnackBarVisible,
  }) {
    return UiControlState(
      isLoading: isLoading ?? this.isLoading,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      isSnackBarVisible: isSnackBarVisible ?? this.isSnackBarVisible,
    );
  }
}

