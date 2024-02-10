import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/data/repository/theme_repository_impl.dart';
import 'package:todolist/utils/resources/data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepositoryImpl _repository;

  ThemeBloc(this._repository) : super(const ThemeInitial()) {
    on<GetTheme>((event, emit) async {
      final theme = await _repository.getTheme();
      emit(ThemeLoaded(theme!.theme));
    });

    on<AddTheme>((event, emit) {
      _repository.addTheme(event.theme);
    });

    on<ThemeChanged>((event, emit) {
      _repository.changeTheme(ThemeModel(getAppThemeFromName(event.appTheme.name)));
      emit(ThemeLoaded(event.appTheme));
    });
  }
}
