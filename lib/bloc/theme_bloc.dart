import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/global/theme/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeLoaded(event.appTheme));
    });
  }
}
