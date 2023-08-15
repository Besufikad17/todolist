import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/theme.dart';
import 'package:todolist/repository/theme_repository.dart';
import 'package:todolist/utils/utils.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository _repository;

  ThemeBloc(this._repository) : super(ThemeInitial()) {
    on<GetTheme>((event, emit) async {
      final theme = await _repository.getTheme();
      emit(ThemeLoaded(theme!.theme));
    });

    on<AddTheme>((event, emit) {
      _repository.addTheme(event.theme);
    });

    on<ThemeChanged>((event, emit) {
      _repository.changeTheme(Theme(getAppThemeFromName(event.appTheme.name)));
      emit(ThemeLoaded(event.appTheme));
    });
  }
}
