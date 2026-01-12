import 'package:che_cucino/app/app.dart';
import 'package:che_cucino/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
