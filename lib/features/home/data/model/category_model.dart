import 'package:code_queez/features/home/domain/entity/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.name,
    required super.description,
    super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '-',
      description: json['description'] ?? '-',
      imageUrl: json['imageUrl'],
    );
  }
}
