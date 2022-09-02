part of 'superheros_bloc.dart';

abstract class SuperherosState extends Equatable {
  const SuperherosState();

  @override
  List<Object?> get props => [];
}

class SuperherosInitial extends SuperherosState {}

class SuperherosLoading extends SuperherosState {}

class SuperherosLoaded extends SuperherosState {
  final List<SuperheroModel> superheroeModels;
  const SuperherosLoaded(this.superheroeModels);
}

class SuperherosError extends SuperherosState {
  final String? message;
  const SuperherosError(this.message);
}