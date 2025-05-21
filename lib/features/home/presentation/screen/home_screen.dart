import 'package:code_queez/core/config/constant.dart';
import 'package:code_queez/core/config/extension.dart';
import 'package:code_queez/core/config/route.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  late final List<Map<String, dynamic>> quizList;

  @override
  void initState() {
    super.initState();
    quizList = List.generate(categories.length, (i) {
      final category = categories[i];
      return {
        'title': category.name,
        'description': category.description,
        'hp': 100,
        'color': getAppColors(context)[i % getAppColors(context).length],
        'icon': Icons.question_mark,
        'imageUrl': category.imageUrl,
      };
    });
  }

  double getRotationAngle(int index) {
    if (index == selectedIndex.value) {
      return 0.0;
    } else if (index == selectedIndex.value - 1) {
      return -0.07;
    } else if (index == selectedIndex.value + 1) {
      return 0.07;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'Pick a card to play quiz',
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: context.textDark,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Select the category you want to play',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            _buildListQuiz(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                height: context.screenHeight * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.textDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      MyRouter.chooseDifficulty,
                      arguments: {
                        'category': categories[selectedIndex.value],
                      },
                    );
                  },
                  child: Text(
                    'Play Quiz',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildListQuiz() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.1,
          vertical: context.screenHeight * 0.03,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: quizList.length,
        itemBuilder: (context, index) {
          final item = quizList[index];

          return ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: VisibilityDetector(
                  key: Key('quiz-$index'),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.6) {
                      selectedIndex.value = index;
                    }
                  },
                  child: Transform.rotate(
                    angle: getRotationAngle(index),
                    child: _quizCard(
                      title: item['title'],
                      imageUrl: item['imageUrl'] ?? '',
                      description: item['description'],
                      hp: item['hp'],
                      color: item['color'],
                      image: item['icon'],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _quizCard({
    required String title,
    required String description,
    required int hp,
    required Color color,
    required IconData image,
    required String imageUrl,
  }) {
    return Container(
      width: context.screenWidth * 0.7,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.textTheme.headlineSmall?.copyWith(
              color: color,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.textDark,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Image.network(
            imageUrl,
            width: context.screenWidth * 0.2,
          ),
        ],
      ),
    );
  }
}
