part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class InitialTheme extends ThemeEvent {
  const InitialTheme();

  @override
  List<Object?> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final MyAppTheme appTheme;
  const ThemeChanged(this.appTheme);
  
  @override
  List<Object?> get props => [appTheme];
}

class GetTheme extends ThemeEvent {
  const GetTheme();

  @override
  List<Object?> get props => [];
}

class AddTheme extends ThemeEvent {
  final ThemeModel theme;
  const AddTheme(this.theme);

  @override
  List<Object?> get props => [theme];
}


