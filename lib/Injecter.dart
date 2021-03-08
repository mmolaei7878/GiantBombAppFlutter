import 'package:get_it/get_it.dart';
import './BLoC/AuthModeBloc.dart';
import './BLoC/SearchBloc.dart';
import './BLoC/Authenthication.dart';
import './BLoC/GameBloc.dart';
import './BLoC/ThemeBloc.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<ThemeBloc>(ThemeBloc());
  locator.registerSingleton<AuthModeBloc>(AuthModeBloc());
  locator.registerSingleton<Authentecation>(Authentecation());
  locator.registerSingleton<GameBloc>(GameBloc());
  locator.registerSingleton<SearchBloc>(SearchBloc());
}
