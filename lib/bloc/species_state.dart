part of 'species_bloc.dart';

abstract class SpeciesState extends Equatable {
  const SpeciesState();

  @override
  List<Object> get props => [];
}

class SpeciesInitial extends SpeciesState {}

class SpeciesLoading extends SpeciesState {}

class SpeciesSuccess extends SpeciesState {
  final List<SpeciesResult> listSpecies;
  final bool hasReachedMax;
  const SpeciesSuccess(this.listSpecies, this.hasReachedMax);
  @override
  List<Object> get props => [listSpecies, hasReachedMax];
}

class SpeciesFailed extends SpeciesState {
  final String message;
  const SpeciesFailed(this.message);

  @override
  List<Object> get props => [message];
}
