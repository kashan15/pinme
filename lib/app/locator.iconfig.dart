import 'package:get_it/get_it.dart';
import 'package:pinme/viewmodels/main_viewmodel.dart';

Future<void> $initGetIt(GetIt g, {String? environment}) async{
  g.registerLazySingleton<MainViewModel>(() => MainViewModel());
}

Future<void> $initGetItAppLanguage(GetIt g, {String? environment}) async{}