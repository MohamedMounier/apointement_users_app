part of 'uicontrol_cubit.dart';

@immutable
 class UiControlState {
  final bool isLoading;
  final String? snackBarMessage;
  final bool isSnackBarVisible;
  final bool isLightTheme;

  const UiControlState({
    required this.isLoading,
    this.snackBarMessage,
    required this.isLightTheme,
    required this.isSnackBarVisible,
  });

  // Initial state
  factory UiControlState.initial() {
    return const UiControlState(
      isLoading: false,
      snackBarMessage: null,
      isSnackBarVisible: false,
      isLightTheme: true,
    );
  }

  // Method to copy the state with new values
  UiControlState copyWith({
    bool? isLoading,
    String? snackBarMessage,
    bool? isSnackBarVisible,
    bool? isLightTheme,
  }) {
    return UiControlState(
      isLoading: isLoading ?? this.isLoading,
      isLightTheme: isLightTheme ?? this.isLightTheme,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      isSnackBarVisible: isSnackBarVisible ?? this.isSnackBarVisible,
    );
  }
}

