/// A class representing the result of a calculation.
///
/// This class holds the output of an arithmetic operation, specifically the
/// result of adding, subtracting, multiplying, or dividing two numbers.
class Result {
  /// The answer obtained from the calculation.
  final double answer;

  /// Creates a [Result] instance with the given [answer].
  ///
  /// The [answer] parameter is required and must be provided when creating a
  /// [Result] object.
  Result({required this.answer});
}
