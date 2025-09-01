/// Enum to manage the state of a form
enum FormStatus {
  /// Used when all the inputs are pure
  pure,

  /// Used when all the inputs are valid
  valid,

  /// Used when one or more inputs are invalid
  invalid,

  /// Used when one or more inputs are dirty
  submissionInProgress,

  /// Used when form is waiting for an external process
  submissionLoading,

  /// Used when form is valid and all external process finished
  submissionLoaded,
}
