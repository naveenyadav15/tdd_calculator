import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/functions/calculator.dart';

void main() {
  test("Add integer numbers", () {
    List<int> numbers = [1, 2, 3, 4, 5, 6];
    int result = CreateCalculator().add(numbers);
    expect(result, 21);
  });

  test("Add String numbers with comma", () {
    String numbers = "1,2,3,4,5";
    int result = CreateCalculator().addString(numbers);
    expect(result, 15);
  });
  test("Add String numbers with new line", () {
    String numbers = "1\n2,3,4,5";
    int result = CreateCalculator().addString(numbers);
    expect(result, 15);
  });
}
