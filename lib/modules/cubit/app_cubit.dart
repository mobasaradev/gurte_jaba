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
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getDataResponse();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataResponse data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
