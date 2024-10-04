import 'package:temp/main/main.dart';
import 'package:temp/main/main_common.dart';

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
