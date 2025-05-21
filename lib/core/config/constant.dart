import 'package:code_queez/core/config/extension.dart';
import 'package:flutter/material.dart';

import '../../features/home/domain/entity/category.dart';

const List<String> listCategory = [
  'Linux',
  'DevOps',
  'Cloud',
  'Docker',
  'Kubernetes',
  'Programming',
  'Networking',
];

List<Color> getAppColors(BuildContext context) {
  return [
    context.tealGreen,
    context.pinkBubble,
    context.yellowSoft,
    context.mintGreen,
    context.pinkLight,
    context.textDark,
  ];
}

const List<Category> categories = [
  Category(
    name: 'Linux',
    description: 'Explore the world of Linux OS, commands, and tools.',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/226/226772.png',
  ),
  Category(
    name: 'DevOps',
    description: 'Learn CI/CD, automation, and modern DevOps practices.',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/8759/8759338.png',
  ),
  Category(
    name: 'Cloud',
    description: 'Understand cloud platforms like AWS, GCP, and Azure.',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/4144/4144459.png',
  ),
  Category(
    name: 'Docker',
    description: 'Containerization made easy with Docker concepts.',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/919/919853.png',
  ),
  Category(
    name: 'Kubernetes',
    description: 'Master container orchestration with Kubernetes.',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/873/873107.png',
  ),
  Category(
    name: 'Programming',
    description: 'Sharpen your coding skills in various languages.',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/4248/4248443.png',
  ),
  Category(
    name: 'Networking',
    description: 'Dive into protocols, IP addressing, and networking basics.',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/994/994928.png',
  ),
];
