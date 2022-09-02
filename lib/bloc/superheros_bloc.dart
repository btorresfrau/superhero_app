import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:superhero_app/models/models.dart';
import 'package:superhero_app/resources/resources.dart';

part 'superheros_event.dart';
part 'superheros_state.dart';

class SuperherosBloc extends Bloc<SuperherosEvent, SuperherosState> {
  SuperherosBloc() : super(SuperherosInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetSuperherosList>((event, emit) async {
      try {
        emit(SuperherosLoading());
        final mList = await apiRepository.fetchSuperheros();
        emit(SuperherosLoaded(mList));
      } catch (ex) {
        emit(const SuperherosError("Failed to fetch data"));
      }
    });
  }
}