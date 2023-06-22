import 'package:equatable/equatable.dart';

class PokemonViewModel extends Equatable {
  final String name;
  final String imageUrl;
  const PokemonViewModel({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [name, imageUrl];
}
