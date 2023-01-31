

import 'package:flutter/material.dart';

class Tools{

  static Future showDialogData(BuildContext contextPage , Widget dialog){
    return showDialog(context: contextPage , builder: (context) {
      return dialog;
    },);
  }

  static bool isNumber(String number){
    bool num = false;
    if (number.startsWith('0') && number.length  == 11) {
      num = true;
    }else if(number.startsWith('9') && number.length == 10){
      num = true;
    }

    return num;
  }

  static dateToStandardString(DateTime date , {bool showTime = false}){
    String result = date.year.toString() + "-" +
    date.month.toString() + "-" + date.day.toString();
    if (showTime) {
      result += " " + date.hour.toString() + ":" + date.minute.toString();
    }
    return result;
  }

  static String  secondToTimer(int recordTimeVoice){
    String result = '';
    int minute = recordTimeVoice ~/ 60;
    int second = recordTimeVoice % 60;
    if (minute < 10) {
      result += '0';
    }
    result += minute.toString();
    result += " : ";
    if (second < 10) {
      result += '0';
    }
    result += second.toString();

    return result;
  }


}