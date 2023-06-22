import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osos_test/domain/models/pokemon_view_model.dart';
import 'package:osos_test/domain/repositories/pokemons_repo.dart';
import 'package:osos_test/util/data_state.dart';

part 'get_pokemons_state.dart';

class GetPokemonsCubit extends Cubit<GetPokemonsState> {
  PokemonsRepository pokemonsRepository;
  GetPokemonsCubit({required this.pokemonsRepository})
      : super(GetPokemonsInitial());
  Future<void> getPokemons() async {
    emit(GetPokemonsInProgress());
    final DataState<List<PokemonViewModel>> response =
        await pokemonsRepository.getPokemonsWithData();
    if (response is DataSuccess) {
      emit(GetPokemonsSuccess(pokemons: response.data!));
    } else {
      emit(GetPokemonsFailure(reason: response.error!));
    }
  }
}
