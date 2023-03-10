import 'package:flutter/material.dart';
import '/app_colors.dart';

class Apercu extends StatefulWidget {
  const Apercu({super.key});

  @override
  State<Apercu> createState() => _ApercuState();
}

class _ApercuState extends State<Apercu> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
        child: Container(
          color: AppColors.contrastColor,
          child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                //color: AppColors.accentColor,
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                        child: Image.asset("res/jeu.png",height: 80,)
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nom du jeu",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Nom de l'éditeur",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Prix : 10,00€",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Proxima Nova",
                            color: AppColors.textColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
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
                      print("Bouton En savoir plus");
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 19,
                        fontFamily: "Proxima Nova",
                        color: AppColors.textColor,
                      ),
                      foregroundColor: AppColors.textColor,
                    ),
                    child: const Center(
                      child: Text(textAlign: TextAlign.center,"En savoir plus"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}