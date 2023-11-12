import 'package:flutter/material.dart';
import 'package:learning/colors.dart';

class MyCon extends StatelessWidget {
  final String text;
  final bool isFun;
  final bool isEqual;
  final VoidCallback onTap;
  const MyCon({super.key,required this.text,this.isFun=false,this.isEqual=false,required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: isEqual ? 180 : 80,
        decoration: BoxDecoration(
            color: isFun ? ogColor : btColor,
            borderRadius: BorderRadius.circular(30)
        ),

        child: Center(child: Text(
          text, style: TextStyle(color: isFun ? Colors.white : Color(0xff354970),fontSize: 40, fontWeight: FontWeight.bold
        , shadows:[
          BoxShadow(
            color: Color(0xff354970).withOpacity(0.2),
            offset: Offset(-2,-2),
            blurRadius: 10
          )
          ],
        ),
           )),

      ),
    );
  }
}
