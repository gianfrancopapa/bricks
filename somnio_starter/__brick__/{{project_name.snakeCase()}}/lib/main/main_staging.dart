import 'package:{{project_name}}/main/main.dart';
import 'package:{{project_name}}/main/main_common.dart';

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
