import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String inputText;
  final String outputText;
  const Display({super.key,required this.inputText,required this.outputText});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: Color(0xffCAD6F1),
          borderRadius: BorderRadius.circular(20)
      ),
      height: 150,
      width: 380,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Padding(
                  //padding: const EdgeInsets.all(20),
                   Flexible(
                    child: Text(
                       inputText , style: TextStyle(color: Color(0xff354970),fontSize: 30, fontWeight: FontWeight.bold
                      , shadows:[
                        BoxShadow(
                            color: Color(0xff354970).withOpacity(0.2),
                            offset: Offset(-2,-2),
                            blurRadius: 10
                        )
                      ],
                    ),
                    ),
                  //),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Flexible(
                    child: Text(
                      outputText , style: TextStyle(color: Color(0xff354970),fontSize: 40, fontWeight: FontWeight.bold
                      , shadows:[
                        BoxShadow(
                            color: Color(0xff354970).withOpacity(0.2),
                            offset: Offset(-2,-2),
                            blurRadius: 10
                        )
                      ],
                    ),
                    ),
                  ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
