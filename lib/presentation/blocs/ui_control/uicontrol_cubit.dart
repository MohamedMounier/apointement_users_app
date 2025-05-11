import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'uicontrol_state.dart';

class UiControlCubit extends Cubit<UiControlState> {
  UiControlCubit()
      : super(UiControlState.initial());

  void showLoading() {
    emit(state.copyWith(isLoading: true,isSnackBarVisible: false));
  }

  void hideLoading() {
    emit(state.copyWith(isLoading: false,isSnackBarVisible: false));
  }

  void showSnackBar(String message) {
    emit(state.copyWith(snackBarMessage: message, isSnackBarVisible: true));
  }

void changeTheme(){
    emit(state.copyWith(isLightTheme: !state.isLightTheme,isSnackBarVisible: false,isLoading: false));

}


// Additional UI-related methods can be added as needed.
}
