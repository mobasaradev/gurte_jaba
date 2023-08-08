part of 'app_cubit.dart';

abstract class AppState extends Equatable {}

class InitialState extends AppState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
  LoadedState(this.places);
  final List<DataResponse> places;

  @override
  List<Object> get props => [places];
}

class DetailState extends AppState {
  DetailState(this.place);
  final DataResponse place;

  @override
  List<Object> get props => [place];
}
