import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:osos_test/data/sources/pokemons_service.dart';
import 'package:osos_test/domain/models/pokemon_view_model.dart';
import 'package:osos_test/domain/repositories/pokemons_repo.dart';
import 'package:osos_test/presentation/app_theme.dart';
import 'package:osos_test/presentation/blocs/get_pokemons_cubit/get_pokemons_cubit.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokemons',
          style: AppTheme.interRegular,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) => GetPokemonsCubit(
              pokemonsRepository:
                  PokemonsRepository(pokemonsService: PokemonsService()))
            ..getPokemons(),
          child: BlocConsumer<GetPokemonsCubit, GetPokemonsState>(
            listener: (context, state) {
              if (state is GetPokemonsFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.reason)));
              }
            },
            builder: (context, state) {
              if (state is GetPokemonsInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetPokemonsSuccess) {
                return ListView.builder(
                    itemCount: state.pokemons.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListCard(
                              pokemonViewModel:
                                  state.pokemons.elementAt(index)),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    });
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final PokemonViewModel pokemonViewModel;
  const ListCard({super.key, required this.pokemonViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                spreadRadius: 3,
                blurRadius: 4),
          ],
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 138,
            height: 138,
            decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(14)),
            child: SvgPicture.network(
              pokemonViewModel.imageUrl,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            pokemonViewModel.name,
            style: AppTheme.interRegular,
          )
        ],
      ),
    );
  }
}
