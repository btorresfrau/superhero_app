part of 'superheros_bloc.dart';

abstract class SuperherosEvent extends Equatable {
  const SuperherosEvent();

  @override
  List<Object> get props => [];
}

class GetSuperherosList extends SuperherosEvent {}