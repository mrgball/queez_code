import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/config/extension.dart';
import 'package:flutter/material.dart';

class ChooseDifficultyScreen extends StatefulWidget {
  const ChooseDifficultyScreen({super.key});

  @override
  State<ChooseDifficultyScreen> createState() => _ChooseDifficultyScreenState();
}

class _ChooseDifficultyScreenState extends State<ChooseDifficultyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Choose Difficulty',
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.textDark,
          ),
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: DifficultyType.values.length,
          itemBuilder: (context, index) {
            final difficulty = DifficultyType.values[index];

            // Semakin tinggi index, semakin merah
            final color = Color.lerp(
              context.tealGreen,
              context.yellowSoft,
              index / (DifficultyType.values.length - 1),
            )!;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                tileColor: color.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  difficulty.name[0].toUpperCase() +
                      difficulty.name.substring(1),
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: ${difficulty.name}')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
