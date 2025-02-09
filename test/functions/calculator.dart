import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/functions/calculator.dart';

void main() {
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
  test("Check delimiters", () {
    String numbers = "//;\n1;2;3";

    int result = CreateCalculator().addString(numbers);
    expect(result, 6);
  });

  test("Add negative value throws exception", () {
    String numbers = "//;\n1;-2;3";

    expect(
      () => CreateCalculator().addString(numbers),
      throwsA(predicate((e) =>
          e is Exception &&
          e.toString().contains("Negative values are not allowed: -2"))),
    );
  });

  test("Add multiple negative value throw exception for all values", () {
    String numbers = "//;\n1;-2;-3";
    expect(
        () => CreateCalculator().addString(numbers),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString().contains("Negative values are not allowed: -2,-3"))));
  });

  test("Calculate how many times addString is called", () {
    CreateCalculator calculator = CreateCalculator();
    calculator.addString("1,2");
    calculator.addString("3,4");
    expect(calculator.getCalledCount(), 2);
  });

  test("Number above 1000 should be ignored", () {
    String numbers = "1,2,1000,1001";
    expect(CreateCalculator().addString(numbers), 3);
  });
}
