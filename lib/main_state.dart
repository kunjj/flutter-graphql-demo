abstract class MainEvents{}

class FetchCountriesEvent extends MainEvents{}

class UpdateMainState extends MainEvents{
  final MainState mainState;

  UpdateMainState(this.mainState);
}

enum ScreenState { initial, loading, loaded, error }

class MainState {
  final ScreenState screenState;
  final String? errorMessage;

  MainState({required this.screenState, this.errorMessage});

  MainState copyWith({ScreenState? screenState, String? errorMessage}) {
    return MainState(
        screenState: screenState ?? this.screenState,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}