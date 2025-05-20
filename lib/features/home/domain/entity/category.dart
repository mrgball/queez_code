import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String? imageUrl;
  final String description;

  const Category({
    required this.name,
    required this.description,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl, description];
}
