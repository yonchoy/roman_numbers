import 'package:flutter/material.dart';

import 'dart:core';

import './flash_page.dart';

class ConvertionPage extends StatelessWidget {

  final bool direction;
  final String number;

  ConvertionPage({this.direction, this.number});

 /// function convert decimal number to roman one
  String decimalToRoman(var number){
        if (number>=1000) return "M"  + decimalToRoman(number - 1000);
        if (number>=900) return "CM"  + decimalToRoman(number - 900);
        if (number >= 500) return "D" + decimalToRoman(number - 500);
        if (number >= 400) return "CD"+ decimalToRoman(number - 400);
        if (number >= 100) return "C" + decimalToRoman(number - 100);
        if (number >= 90) return "XC" + decimalToRoman(number - 90);
        if (number >= 50) return "L"  + decimalToRoman(number - 50);
        if (number >= 40) return "XL" + decimalToRoman(number - 40);
        if (number >= 10) return "X"  + decimalToRoman(number - 10);
        if (number >= 9) return "IX"  + decimalToRoman(number - 9);
        if (number >= 5) return "V"   + decimalToRoman(number - 5);
        if (number >= 4) return "IV"  + decimalToRoman(number - 4);
        if (number >= 1) return "I"   + decimalToRoman(number - 1);
        return "";
  }

  /// function convert roman number to decimal one
  int romanToDecimal(var number) {
    if(!isRomanNumber(number)) return -1;
    if (number.startsWith("M"))  return 1000 + romanToDecimal(number.substring(1));
    if (number.startsWith("CM")) return 900  + romanToDecimal(number.substring(2));
    if (number.startsWith("D"))  return 500  + romanToDecimal(number.substring(1));
    if (number.startsWith("CD")) return 400  + romanToDecimal(number.substring(2));
    if (number.startsWith("C"))  return 100  + romanToDecimal(number.substring(1));
    if (number.startsWith("XC")) return 90   + romanToDecimal(number.substring(2));
    if (number.startsWith("L"))  return 50   + romanToDecimal(number.substring(1));
    if (number.startsWith("XL")) return 40   + romanToDecimal(number.substring(2));
    if (number.startsWith("X"))  return 10   + romanToDecimal(number.substring(1));
    if (number.startsWith("IX")) return 9    + romanToDecimal(number.substring(2));
    if (number.startsWith("V"))  return 5    + romanToDecimal(number.substring(1));
    if (number.startsWith("IV")) return 4    + romanToDecimal(number.substring(2));
    if (number.startsWith("I"))  return 1    + romanToDecimal(number.substring(1));
    if (number.isEmpty) return 0;
    return 0;
  } 

  /// @direction determines if convertor is roman to decimal or decimal to roman
  /// @number is used to hold the number representation  
  String convertor(bool direction, var number){
    return direction? romanToDecimal(isRomanNumber(number)?number:""):decimalToRoman(int.parse(number));
  }

  /// regular expression magic, check if the roman number is properly constructed
  bool isRomanNumber(var v){
    RegExp exp = new RegExp(r"M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})");
    return exp.hasMatch(number);
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.blueAccent,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(convertor(this.direction, this.number), style:new TextStyle(color: Colors.white, fontSize: 50.0,fontWeight: FontWeight.bold)),
            new IconButton(
              icon: new Icon(Icons.arrow_right),
              color: Colors.white,
              iconSize: 50.0,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(builder: (BuildContext context)=>new FlashPage()),
                (Route route) =>route == null
              ),
            )
          ],
        ),
      );
    }
}