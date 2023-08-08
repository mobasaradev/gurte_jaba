import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gurte_jaba/shared/shared.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final RepositoryImpl data;
  late final places;

  // get data
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getDataResponse();
      emit(LoadedState(places));
    } catch (e) {
      emit(LoadingState());
    }
  }

  // detail page data
  detailPage(DataResponse data) {
    emit(DetailState(data));
  }

  // home back route
  goHome() {
    emit(LoadedState(places));
  }
}
