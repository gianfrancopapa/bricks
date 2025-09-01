/// Utility class for the API client.
class Utils {
  /// Converts a list of strings to a single string, separated by commas.
  static String? tryToListStringToString(List<String>? value) {
    if (value == null) return null;
    return value.map((e) => e).join(',');
  }
}
