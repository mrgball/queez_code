import 'package:code_queez/core/config/extension.dart';
import 'package:code_queez/core/config/global.dart';
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
  ),
  Category(
    name: 'DevOps',
    description: 'Learn CI/CD, automation, and modern DevOps practices.',
  ),
  Category(
    name: 'Cloud',
    description: 'Understand cloud platforms like AWS, GCP, and Azure.',
  ),
  Category(
    name: 'Docker',
    description: 'Containerization made easy with Docker concepts.',
  ),
  Category(
    name: 'Kubernetes',
    description: 'Master container orchestration with Kubernetes.',
  ),
  Category(
    name: 'Programming',
    description: 'Sharpen your coding skills in various languages.',
  ),
  Category(
    name: 'Networking',
    description: 'Dive into protocols, IP addressing, and networking basics.',
  ),
];
