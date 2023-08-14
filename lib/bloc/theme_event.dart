part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme appTheme;
  const ThemeChanged(this.appTheme);
  
  @override
  List<Object?> get props => [appTheme];
}


