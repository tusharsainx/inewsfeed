import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenericErrorScreen extends StatelessWidget {
  const GenericErrorScreen({
    super.key,
    required this.description,
    required this.imagePath,
    required this.title,
  });
  final String title;
  final String description;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    final infTheme = Theme.of(context);
    return Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: ColoredBox(
            color: infTheme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: infTheme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Got it",
                    style: TextStyle(
                        color: infTheme.colorScheme.surface,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: infTheme.colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset(imagePath),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ));
  }
}
