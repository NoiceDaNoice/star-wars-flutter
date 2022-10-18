import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/model/species.dart';

import '../../api/api.dart';

part 'species_event.dart';
part 'species_state.dart';

class SpeciesBloc extends Bloc<SpeciesEvent, SpeciesState> {
  SpeciesBloc() : super(SpeciesInitial()) {
    int page = 0;
    List<SpeciesResult>? list = [];
    bool max = false;
    on<LoadSpecies>((event, emit) async {
      emit(SpeciesLoading());
      try {
        if (max == true) {
          return;
        }
        page++;
        final species = await Api().getSpecies(
          page: page,
        );
        if (species.next != null) {
          list.addAll(species.results!);
          emit(SpeciesSuccess(list, max));
        } else {
          max = true;
          list.addAll(species.results!);
          emit(SpeciesSuccess(list, max));
          page--;
        }
      } catch (e) {
        page--;
        emit(SpeciesFailed(e.toString()));
      }
    });
  }
}
