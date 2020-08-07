import 'package:math_expressions/math_expressions.dart';

String getConcreateNumString(String value) => num.parse(value).toString();

String getDisplayOperation(String operation) {
  try {
    if (operation != null || operation.isNotEmpty) {
      List<String> operations = operation.split(" ");
      for (int i in operations.asMap().keys) {
        if (i.isEven) operations[i] = getConcreateNumString(operations[i]);
      }
      return operations.join(" ");
    }
  } catch (e) {
    print(" getDisplayMethod : $e");
  }
  return (operation == null) ? '' : operation;
}

Map<String, String> createHistory(String operation, result) =>
    {'operation': operation, 'result': result};

operate(String operation) {
  operation = operation.replaceAll('×', '*');
  operation = operation.replaceAll('÷', '/');
  try {
    Parser parser = Parser();
    ContextModel cm = ContextModel();
    var expression = parser.parse(operation);

    var result = expression.evaluate(EvaluationType.REAL, cm);
    num resNum = num.parse('$result');
    return '$resNum';
  } catch (e) {
    print(e);
  }
}

List op = ['×', '÷', '+', '-'];
bool isOperator(String str) {
  for (String i in op) {
    if (i == str) return true;
  }
  return false;
}

addOperation(String operation, String mOperator) {
  try {
    if (operation.length < 3) {
      if (mOperator == ' - ') operation += mOperator;
    } else if (!isOperator(operation[operation.length - 2])) {
      operation += mOperator;
    }
  } catch (e) {
    print(e);
  }
  return operation;
}
