import 'package:http/http.dart' as http;
import 'package:osos_test/util/constants.dart';

class PokemonsService {
  Future<http.Response> getPokemons({int? limit}) async {
    String url = (limit != null)
        ? '${baseUrl}pokemon?limit=$limit'
        : '${baseUrl}pokemon';
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> getPokemonData({required String pokemonUrl}) async {
    String url = pokemonUrl;
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
