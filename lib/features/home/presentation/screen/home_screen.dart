import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/config/extension.dart';
import 'package:code_queez/core/config/route.dart';
import 'package:code_queez/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  final List<Color> colorPalette = [
    Colors.redAccent,
    Colors.green,
    Colors.blueAccent,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const GetCategoriesEvent());
  }

  double getRotationAngle(int index) {
    if (index == _selectedIndex.value) {
      return 0.0;
    } else if (index == _selectedIndex.value - 1) {
      return -0.07;
    } else if (index == _selectedIndex.value + 1) {
      return 0.07;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, HomeState>(
      selector: (state) => state,
      builder: (context, state) {
        if (state.status == BlocStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BlocStatus.error) {
          return const Center(child: Text('Error loading categories'));
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.screenHeight * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      'Pick a card to play quiz',
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: context.textDark,
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
                if (state.categories.isNotEmpty) _buildCategories(state),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategories(HomeState state) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.1,
          vertical: context.screenHeight * 0.03,
        ),
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          final item = state.categories[index];
          final color = colorPalette[index % colorPalette.length];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRouter.chooseDifficulty,
                arguments: {
                  'category': item,
                  'withAnimation': true,
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              alignment: Alignment.center,
              width: context.screenWidth * 0.7,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: color,
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.12),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.name,
                    style: context.textTheme.displaySmall?.copyWith(
                      color: context.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
