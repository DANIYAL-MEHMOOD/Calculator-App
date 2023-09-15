import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/my_button.dart';
import 'constant.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput ='';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          answer.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
             Expanded(
               flex: 3,
               child: Column(
                 children: [
                   Row(
                     children: [
                       MYButton(title: 'AC',
                         onpress: (){
                           userInput = '';
                           answer = '';
                           setState(() {

                           });
                         },
                       ),
                       MYButton(title: '+/-',onpress: (){
                         userInput += '+/-';
                         setState(() {

                         });
                       },),
                       MYButton(title: '%',onpress: (){
                         userInput += '%';
                         setState(() {

                         });
                       },),
                       MYButton(title: '/',color: Color(0xffffa00a),onpress: (){
                         userInput += '/';
                         setState(() {

                         });
                       },),
                     ],
                   ),
                   Row(
                     children: [
                       MYButton(title: '7',
                         onpress: (){
                           userInput += '7';
                           setState(() {

                           });
                         },
                       ),
                       MYButton(title: '8',onpress: (){
                         userInput += '8';
                         setState(() {

                         });
                       },),
                       MYButton(title: '9',onpress: (){
                         userInput += '9';
                         setState(() {

                         });
                       },),
                       MYButton(title: 'x',color: Color(0xffffa00a),onpress: (){
                         userInput += '*';
                         setState(() {

                         });
                       },),
                     ],
                   ),
                   Row(
                     children: [
                       MYButton(title: '4',
                         onpress: (){
                           userInput += '4';
                           setState(() {

                           });
                         },
                       ),
                       MYButton(title: '5',onpress: (){
                         userInput += '5';
                         setState(() {

                         });
                       },),
                       MYButton(title: '6',onpress: (){
                         userInput += '6';
                         setState(() {

                         });
                       },),
                       MYButton(title: '-',color: Color(0xffffa00a),onpress: (){
                         userInput += '-';
                         setState(() {

                         });
                       },),
                     ],
                   ),
                   Row(
                     children: [
                       MYButton(title: '1',
                         onpress: (){
                           userInput += '1';
                           setState(() {

                           });
                         },
                       ),
                       MYButton(title: '2',onpress: (){
                         userInput += '2';
                         setState(() {

                         });
                       },),
                       MYButton(title: '3',onpress: (){
                         userInput += '3';
                         setState(() {

                         });
                       },),
                       MYButton(title: '+',color: Color(0xffffa00a),onpress: (){
                         userInput += '+';
                         setState(() {

                         });
                       },),
                     ],
                   ),
                   Row(
                     children: [
                       MYButton(title: '0',
                         onpress: (){
                           userInput += '0';
                           setState(() {

                           });
                         },
                       ),
                       MYButton(title: '.',onpress: (){
                         userInput += '.';
                         setState(() {

                         });
                       },),
                       MYButton(title: 'DEL',onpress: (){
                         userInput = userInput.substring(0, userInput.length -1 );
                         setState(() {

                         });
                       },),
                       MYButton(title: '=',color: Color(0xffffa00a),onpress: (){
                         equalPress();
                         setState(() {

                         });
                       },),
                     ],
                   ),
                 ],
               ),
             ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput= userInput.replaceAll('x', '*');
    Parser p= Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();

  }
}
