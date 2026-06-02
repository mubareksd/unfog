import 'package:unfog/app/app.dart';
import 'package:unfog/main/bootstrap/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    (sharedPreferences) => App(sharedPreferences: sharedPreferences),
  );
}
