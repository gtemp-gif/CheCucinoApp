import 'package:che_cucino/app/app.dart';
import 'package:che_cucino/bootstrap.dart';
import 'package:che_cucino/core/di/injector.dart';

Future<void> main() async {
  setupInjector();
  await bootstrap(() => const App());
}
