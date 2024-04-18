import 'package:apapa/main/main.dart';
import 'package:apapa/main/main_common.dart';

void main() {
  bootstrap(
    () {
      const apiUrl = 'https://api.example.com';

      return mainCommon(
        apiUrl: apiUrl,
      );
    },
  );
}
