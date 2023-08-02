part of 'welcome_cubit.dart';

enum WelcomeStatus { initial, success }

class WelcomeState extends Equatable {
  const WelcomeState({this.status = WelcomeStatus.initial});

  final WelcomeStatus status;

  @override
  List<Object> get props => [status];

  WelcomeState copyWith({
    WelcomeStatus? status,
  }) {
    return WelcomeState(
      status: status ?? this.status,
    );
  }
}
