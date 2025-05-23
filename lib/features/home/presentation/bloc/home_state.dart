part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BlocStatus status;
  final List<Category> categories;

  const HomeState({
    this.status = BlocStatus.initial,
    this.categories = const [],
  });

  HomeState copyWith({
    BlocStatus? status,
    List<Category>? categories,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object> get props => [status, categories];
}
