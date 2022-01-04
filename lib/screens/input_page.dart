import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flash_chat/widgets/icon_content.dart';
import 'package:flash_chat/widgets/reusable_card.dart';
import 'package:flash_chat/widgets/calc_ design.dart';
import 'package:flash_chat/screens/results_screen.dart';
import 'package:flash_chat/widgets/bottom_button.dart';
import 'package:flash_chat/widgets/round_icon_button.dart';
import 'package:flash_chat/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  static String id = 'input_screen';

  const InputPage(
      {@required this.name, @required this.price, @required this.customerName});
  final String name;
  final double price;
  final String customerName;
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double count = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      //selectedGender = Gender.male;
                    });
                  },
                  colour: Colors.green,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.personBooth,
                    label: widget.customerName,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      // selectedGender = Gender.female;
                    });
                  },
                  colour: Colors.blueAccent,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: widget.name,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'מחיר',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        widget.price.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'ש"ח',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'כמות',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          count.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    count -= 0.5;
                                    if (count < 0) {
                                      count = 0;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  count += 0.5;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                customerName: widget.customerName,
                productName: widget.name,
                quantity: count,
                productPrice: widget.price,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateAll(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
