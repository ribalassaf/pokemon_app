import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:osos_test/data/sources/pokemons_service.dart';
import 'package:osos_test/domain/models/pokemon_model.dart';
import 'package:osos_test/domain/models/pokemon_view_model.dart';
import 'package:osos_test/util/data_state.dart';

class PokemonsRepository {
  late PokemonsService pokemonsService;
  PokemonsRepository({required this.pokemonsService});

  Future<DataState<List<PokemonModel>>> getPokemons() async {
    try {
      final getPokemonsResponse = await pokemonsService.getPokemons(limit: 5);
      if (getPokemonsResponse.statusCode == HttpStatus.ok) {
        var getPokemonsResponseBody = jsonDecode(getPokemonsResponse.body);
        List<PokemonModel> pokemons = [];
        for (var e in (getPokemonsResponseBody["results"] as List)) {
          pokemons.add(PokemonModel.fromMap(e));
        }
        return DataSuccess(data: pokemons);
      } else {
        throw HttpException(getPokemonsResponse.reasonPhrase!);
      }
    } catch (e) {
      return DataFailure(error: e.toString());
    }
  }

  Future<DataState<List<PokemonViewModel>>> getPokemonsData(
      {required List<PokemonModel> pokemonModels}) async {
    try {
      List<PokemonViewModel> pokemonsWithData = [];
      Response response;
      for (PokemonModel pokemonModel in pokemonModels) {
        response =
            await pokemonsService.getPokemonData(pokemonUrl: pokemonModel.url);
        if (response.statusCode == HttpStatus.ok) {
          var body = jsonDecode(response.body);
          pokemonsWithData.add(PokemonViewModel(
              name: pokemonModel.name,
              imageUrl: body['sprites']['other']['dream_world']
                  ['front_default']));
        } else {
          throw HttpException(response.reasonPhrase!);
        }
      }
      return DataSuccess(data: pokemonsWithData);
    } catch (e) {
      return DataFailure(error: e.toString());
    }
  }

  Future<DataState<List<PokemonViewModel>>> getPokemonsWithData() async {
    final DataState<List<PokemonModel>> response = await getPokemons();
    if (response is DataSuccess) {
      DataState<List<PokemonViewModel>> response2 =
          await getPokemonsData(pokemonModels: response.data!);
      if (response2 is DataSuccess) {
        return DataSuccess(data: response2.data);
      } else {
        return DataFailure(error: response2.error);
      }
    } else {
      return DataFailure(error: response.error);
    }
  }
}
