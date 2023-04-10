import 'package:flutter/material.dart';
import '/app_colors.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton({required this.type, required this.text, required this.page, this.f});

  final bool type;  // false = full background  // true = empty background
  final String text;
  final Widget page;
  Function? f;

  @override
  Widget build(BuildContext context) {
    f ??= ()=>true;

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
                onPressed: () async {
                  if(await f!()==true) {
                    print("Bouton $text");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => page),
                    );
                  }
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
          onPressed: () async {
            if(await f!()==true) {
              print("Bouton $text");
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => page),
              );
            }
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