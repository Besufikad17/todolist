part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final MyAppTheme appTheme;
  const ThemeState(this.appTheme);
  
  @override
  List<Object> get props => [appTheme];
}

final class ThemeInitial extends ThemeState { 
  const ThemeInitial(): super(MyAppTheme.lightGruvBox);

  @override
  List<Object> get props => [];
}

final class ThemeLoaded extends ThemeState {
  final MyAppTheme loadedAppTheme;
  const ThemeLoaded(this.loadedAppTheme): super(loadedAppTheme);
}