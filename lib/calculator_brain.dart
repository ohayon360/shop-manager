import 'dart:math';

class CalculatorBrain {
  final String customerName;
  final String productName;
  final double quantity;
  final double productPrice;
  double totalPrice;

  CalculatorBrain(
      {this.customerName, this.productName, this.quantity, this.productPrice});

  String calculateAll() {
    totalPrice = 0;
    totalPrice = quantity * productPrice;
    return totalPrice.toStringAsFixed(1);
  }

  String getResult() {
    return customerName.toString();
  }

  String getInterpretation() {
    return 'hello world';
  }
}
