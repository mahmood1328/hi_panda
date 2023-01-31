import 'package:flutter/material.dart';

import 'res/colors.dart';

class FunkyOverlay extends StatelessWidget {
  const FunkyOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child:  Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(color: ColorsApp.primary,),
            )
        ),
      ),
    );
  }
}
