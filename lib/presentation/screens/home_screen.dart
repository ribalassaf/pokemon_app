import 'package:flutter/material.dart';
import 'package:osos_test/presentation/app_theme.dart';
import 'package:osos_test/presentation/screens/animations_page.dart';
import 'package:osos_test/presentation/screens/pokemons_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: AppTheme.interRegular,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (20 / 428),
              vertical: screenHeight * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: nameController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(hintText: 'Enter your name'),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Text(nameController.text),
              SizedBox(
                height: screenHeight * 0.4,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      nameController.clear();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Text(
                          'Clear text',
                          style:
                              AppTheme.interRegular.copyWith(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimationsPage(
                                    name: nameController.text,
                                  )));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      width: screenWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppTheme.heavyBlue),
                      child: Center(
                          child: Text(
                        'Go to page 1',
                        style:
                            AppTheme.interRegular.copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PokemonsScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppTheme.lightBlue),
                      child: Center(
                          child: Text(
                        'Go to page 2',
                        style:
                            AppTheme.interRegular.copyWith(color: Colors.white),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
