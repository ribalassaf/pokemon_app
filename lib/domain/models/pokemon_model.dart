import 'package:equatable/equatable.dart';

class PokemonModel extends Equatable {
  final String name;
  final String url;
  const PokemonModel({
    required this.name,
    required this.url,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  @override
  List<Object> get props => [name, url];
}
