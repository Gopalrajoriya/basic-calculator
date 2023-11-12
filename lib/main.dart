import 'package:flutter/material.dart';
import 'package:learning/display.dart';
import 'package:learning/mycontainer.dart';
import 'package:math_expressions/math_expressions.dart';


void main(){
  runApp(MaterialApp(
    home: Calci(),
  ));
}

class Calci extends StatefulWidget {
    const Calci({super.key});



  @override
  State<Calci> createState() => _CalciState();
}

class _CalciState extends State<Calci> {
  String userInput ="";
  String result = "";
  void inputHundle(String input){
   try{
     if(input == "⌫"){
       setState(() {
         userInput = userInput.substring(0,userInput.length-1);
       });
     }
     else if(input == "C"){
       setState(() {
         userInput="";
         result ="";
       });
     }
     else if(input == "="){
       Parser parser = Parser();
       Expression expression = parser.parse(userInput);
       ContextModel contextModel = ContextModel();
       setState(() {
         result = expression.evaluate(EvaluationType.REAL, contextModel).toString();
       });
     }
     else{
       setState(() {
         userInput = userInput + input;
       });
     }
   }
   catch(ex){
     result = ex.toString();
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("BASIC CALCULATOR",style: TextStyle(fontWeight:FontWeight.bold),)),
      ),
      body:SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Display(inputText: userInput, outputText:result)

                  ],
                ),
                SizedBox(height:40),
                Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                       MyCon(text: "C",isFun: true,onTap: (){inputHundle("C");},),
                        MyCon(text: "⌫",isFun: true,onTap: (){inputHundle("⌫");}),
                        MyCon(text: "%",isFun: true,onTap: (){inputHundle("%");}),
                        MyCon(text: "/",isFun: true,onTap: (){inputHundle("/");})
                      ],
                    ),
                    SizedBox(height:15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        MyCon(text: "7",onTap: (){inputHundle("7");}),
                        MyCon(text: "8",onTap: (){inputHundle("8");}),
                        MyCon(text: "9",onTap: (){inputHundle("9");}),
                        MyCon(text: "*",isFun: true,onTap: (){inputHundle("*");})
                      ],
                    ),
                    SizedBox(height:15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        MyCon(text: "4",onTap: (){inputHundle("4");}),
                        MyCon(text: "5",onTap: (){inputHundle("5");}),
                        MyCon(text: "6",onTap: (){inputHundle("6");}),
                        MyCon(text: "+",isFun: true,onTap: (){inputHundle("+");})
                      ],
                    ),
                    SizedBox(height:15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        MyCon(text: "1",onTap: (){inputHundle("1");}),
                        MyCon(text: "2",onTap: (){inputHundle("2");}),
                        MyCon(text: "3",onTap: (){inputHundle("3");}),
                        MyCon(text: "-",isFun: true,onTap: (){inputHundle("-");})
                      ],
                    ),
                    SizedBox(height:15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        MyCon(text: "0",onTap: (){inputHundle("0");}),
                        MyCon(text: ".",onTap: (){inputHundle(".");}),

                        MyCon(text: "=",isFun: true,isEqual: true,onTap: (){
                          inputHundle("=");
                        })
                      ],
                    ),

                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
