part of 'get_pokemons_cubit.dart';

abstract class GetPokemonsState extends Equatable {
  const GetPokemonsState();

  @override
  List<Object> get props => [];
}

class GetPokemonsInitial extends GetPokemonsState {}

class GetPokemonsInProgress extends GetPokemonsState {}

class GetPokemonsSuccess extends GetPokemonsState {
  final List<PokemonViewModel> pokemons;
  const GetPokemonsSuccess({
    required this.pokemons,
  });
  @override
  List<Object> get props => [pokemons];
}

class GetPokemonsFailure extends GetPokemonsState {
  final String reason;
  const GetPokemonsFailure({
    required this.reason,
  });
  @override
  List<Object> get props => [reason];
}
