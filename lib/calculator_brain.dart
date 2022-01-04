import 'dart:math';

class CalculatorBrain {
  final String customerName;
  final String productName;
  final double quantity;
  final double productPrice;
  double totalPrice;
  double totalPayment;

  CalculatorBrain(
      {this.customerName, this.productName, this.quantity, this.productPrice});

  String calculateAll() {
    totalPrice = 0;
    totalPrice = quantity * productPrice;
    return totalPrice.toStringAsFixed(1);
  }

String getCount(){
    return this.quantity.toStringAsFixed(1);
}

String getPrice(){
    return this.productPrice.toStringAsFixed(1);
}

String getCustomerName(){
    return this.customerName.toString();
}

  String getProductName(){
    return this.productName.toString();
  }

  double getCalcRes(){
    return totalPrice;
  }






  String getResult() {
    return customerName.toString();
  }

  String getInterpretation() {
    return 'hello world';
  }
}
