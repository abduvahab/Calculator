import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => MyBodyState();
}

class MyBodyState extends State<MyBody> {

  String expre = '';
  String result = '';

  void onbuttonpressed(String buttonText){
    setState(() {
      if (buttonText == "AC"){
        expre = '';
        result = '';
      }
      else if(buttonText == "C"){
          if(expre.length == 1){
            expre = "";
          }
          else if(expre.length > 1){
            expre = expre.substring(0,expre.length -1);
          }
      }
      else if(buttonText == "="){
        try{
            // debugPrint(expre);
            Parser p = Parser();
            Expression exp = p.parse(expre);
            ContextModel cm = ContextModel();
            // result = '${exp.evaluate(EvaluationType.REAL, cm)}';
            double resultValue = exp.evaluate(EvaluationType.REAL, cm);
    
            // Check if the result is too large
            if (resultValue.isInfinite) {
              throw Exception('Result is too large');
            }
            
            // Check if division by zero occurred
            if (resultValue.isNaN) {
              throw Exception('Division by zero');
            }
            
            result = resultValue.toString();

        }catch(e){
          result = "Error";
        }
      }
      else{
        if(result != ""){
          result = "";
          expre = "";
        }
        expre += buttonText;
        // debugPrint(expre);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch, 
      children: [
          Number(
            expre: expre,
          ),
          // Resulte(),
          Expanded(
            child:Resulte(
              result: result,
            ),
          ),
          KeyBoard(
            expre:expre,
            result: result,
            onbuttonpressed: onbuttonpressed,
          )
      ],

    );
  }
}

class KeyBoard extends StatelessWidget {
  
  final String expre ;
  final String result ;
  final void Function(String buttonText) onbuttonpressed;
  
  
   const KeyBoard({
    super.key,
    required this.expre,
    required this.result,
    required this.onbuttonpressed,
    });

  @override
  Widget build(BuildContext context) {
    return  Column (
      // alignment: Alignment.bottomLeft,
        children: [
          Row(
            children: [
                CalculatorButton(
                    text: "7",
                    expre: expre,
                    result: result,
                    onbuttonpressed: onbuttonpressed,
                  ),
                  CalculatorButton(
                    text: "8",
                    expre: expre,
                    result: result,
                    onbuttonpressed: onbuttonpressed,
                  ),
                  CalculatorButton(
                    text: "9",
                    expre: expre,
                    result: result,
                    onbuttonpressed: onbuttonpressed,
                  ),
                  CalculatorButton(
                    text: "C",
                    expre: expre,
                    result: result,
                    onbuttonpressed: onbuttonpressed,
                    color: Colors.red,
                  ),
                  CalculatorButton(
                    text: "AC",
                    expre: expre,
                    result: result,
                    onbuttonpressed: onbuttonpressed,
                    color: Colors.red,
                  ),
            ],
          ),
          Row(
            children: [
               CalculatorButton(
                  text: "4",
                  expre: expre,
                  result: result,
                  onbuttonpressed: onbuttonpressed,
                ),
                CalculatorButton(
                  text: "5",
                  expre: expre,
                  result: result,
                  onbuttonpressed: onbuttonpressed,
                ),
                CalculatorButton(
                  text: "6",
                  expre: expre,
                  result: result,
                  onbuttonpressed: onbuttonpressed,
                ),
                CalculatorButton(
                  text: "+",
                  expre: expre,
                  result: result,
                  onbuttonpressed: onbuttonpressed,
                  color: Colors.white,
                ),
                CalculatorButton(
                  text: "-",
                  expre: expre,
                  result: result,
                  onbuttonpressed: onbuttonpressed,
                  color: Colors.white,
                ),
            ],
          ),
          Row( 
             children: [
               CalculatorButton(
                text: "1",
                expre: expre,
                result: result,
                onbuttonpressed: onbuttonpressed,
              ),
              CalculatorButton(
                text: "2",
                expre: expre,
                result: result,
                onbuttonpressed: onbuttonpressed,
              ),
              CalculatorButton(
                text: "3",
                expre: expre,
                result: result,
                onbuttonpressed: onbuttonpressed,
              ),
              CalculatorButton(
                text: "*",
                expre: expre,
                result: result,
                onbuttonpressed: onbuttonpressed,
                color: Colors.white,
              ),
              CalculatorButton(
                text: "/",
                expre: expre,
                result: result,
                onbuttonpressed: onbuttonpressed,
                color: Colors.white,
              ),
            ]
          ),
          Row(
            children: [
            CalculatorButton(
              text: "0",
              expre: expre,
              result: result,
              onbuttonpressed: onbuttonpressed,
            ),
            CalculatorButton(
              text: ".",
              expre: expre,
              result: result,
              onbuttonpressed: onbuttonpressed,
            ),
            CalculatorButton(
              text: "00",
              expre: expre,
              result: result,
              onbuttonpressed: onbuttonpressed,
            ),
            CalculatorButton(
              text: "=",
              expre: expre,
              result: result,
              onbuttonpressed: onbuttonpressed,
              color: Colors.white,
            ),
            CalculatorButton(
              text: "",
              expre: expre,
              result: result,
              onbuttonpressed: onbuttonpressed,
            ),

          ],
        ),
    ]
    );
  } 
}

class  CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
    final String expre ;
  final String result ;
  final void Function(String buttonText) onbuttonpressed;
   const CalculatorButton({
    super.key,
    required this.expre,
    required this.result,
    required this.onbuttonpressed,
    required this.text, 
    this.color =Colors.black
    });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Container(
      color: const Color.fromARGB(197, 95, 140, 159),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(color: color),
          ),
        onPressed: (){
          if(text != ""){
            // debugPrint(text);
            onbuttonpressed(text);
          }
        },
      ),
    )
    );
  }
}


class Resulte extends StatelessWidget{

  final String result;
  const Resulte({super.key, required this.result});
  @override
  Widget build(BuildContext context){
    return Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              result,
              textDirection: TextDirection.ltr,
              style:const  TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  ),
                ),
              );
  }
}

class Number extends StatelessWidget{

  final String expre;
  const Number({
    super.key,
    required this.expre
    });
  @override
  Widget build(BuildContext context){
    return Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child:  Text(
              expre,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                ),
              ),
        );
  }
}