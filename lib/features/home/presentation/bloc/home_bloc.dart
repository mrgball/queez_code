import 'package:bloc/bloc.dart';
import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/utils/injector.dart';
import 'package:code_queez/features/home/data/model/category_model.dart';
import 'package:code_queez/features/home/domain/entity/category.dart';
import 'package:code_queez/features/home/domain/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetCategoriesEvent>(_onGetCategories);
  }

  Future<void> _onGetCategories(
    GetCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));

      final response = await locator<GetCategoriesUseCase>().call();

      if (response.isEmpty) {
        throw 'Data categories is empty';
      }

      List<Category> categories =
          response.map((item) => CategoryModel.fromJson(item)).toList();

      emit(state.copyWith(
        status: BlocStatus.loaded,
        categories: categories,
      ));
    } catch (e, s) {
      print('object: $e \n $s');
      emit(state.copyWith(status: BlocStatus.error));
    }
  }
}
