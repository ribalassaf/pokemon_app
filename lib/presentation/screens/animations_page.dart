import 'package:flutter/material.dart';
import 'package:osos_test/presentation/app_theme.dart';
import 'package:osos_test/presentation/screens/components/shape.dart';

class AnimationsPage extends StatefulWidget {
  final String? name;
  const AnimationsPage({super.key, this.name});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  double chosenRadius = 0;
  Color chosenColor = AppTheme.heavyBlue;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Animations',
        style: AppTheme.interRegular,
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (widget.name != null)
              ? Center(child: Text(widget.name!))
              : Container(),
          AnimatedContainer(
            width: screenWidth * 0.9,
            height: screenWidth * 0.9,
            decoration: BoxDecoration(
                color: chosenColor,
                borderRadius: BorderRadius.circular(chosenRadius)),
            duration: const Duration(milliseconds: 300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Shape(
                color: AppTheme.heavyBlue,
                onTap: () {
                  setState(() {
                    chosenRadius = 0;
                    chosenColor = AppTheme.heavyBlue;
                  });
                },
              ),
              Shape(
                color: AppTheme.lightBlue,
                radius: 15,
                onTap: () {
                  setState(() {
                    chosenRadius = 15;
                    chosenColor = AppTheme.lightBlue;
                  });
                },
              ),
              Shape(
                color: AppTheme.red,
                radius: 50,
                onTap: () {
                  setState(() {
                    chosenRadius = (screenWidth * 0.9) / 2;
                    chosenColor = AppTheme.red;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
