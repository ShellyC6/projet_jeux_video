import 'package:flutter/material.dart';
import '/app_colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({required this.type, required this.text});

  final bool type;  // false = full background  // true = empty background
  final String text;

  @override
  Widget build(BuildContext context) {

    // Full Background
    if(!type){
      return SizedBox(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  print("Bouton $text");
                },
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  foregroundColor: AppColors.textColor,
                ),
                child: Center(
                    child: Text(text),
                ),
              )
            ],
          ),
        ),
      );

      // Empty background
    } else {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: (){
            print("Bouton $text");
          },
          style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyLarge,
              foregroundColor: AppColors.textColor,
              side: const BorderSide(width: 2, color: AppColors.accentColor)
          ),
          child: Text(text),
        ),
      );
    }
  }
}