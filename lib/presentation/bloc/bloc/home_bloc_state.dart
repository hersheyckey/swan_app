import 'package:equatable/equatable.dart';
import 'package:swaan_app/data/model/fetch_data_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeData data;

  const HomeLoaded({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'HomeLoaded { data: $data }';
}


class HomeError extends HomeState {
  final String error;

  const HomeError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeError { error: $error }';
}
