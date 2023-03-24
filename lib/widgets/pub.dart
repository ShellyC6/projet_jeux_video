import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/app_colors.dart';
import 'my_text_button.dart';

class Pub extends StatelessWidget {
  const Pub({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            "res/img/actu.png",
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text(
                          "Titan Fall 2",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "Ultimate Edition",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50, top: 10, bottom: 10),
                          child : Text(
                            "Un super jeu que vous allez adoré, c'est absolument certain (même si j'y connais rien moi)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 35,
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
                                    print("Bouton En Savoir Plus");
                                  },
                                  style: TextButton.styleFrom(
                                    textStyle: Theme.of(context).textTheme.bodyLarge,
                                    foregroundColor: AppColors.textColor,
                                  ),
                                  child: const Center(
                                    child: Text("En savoir plus"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]
                    )
                ),
                Image.asset(
                  "res/img/jeu.png",
                  alignment: Alignment.bottomRight,
                )
              ],
            )
          )
        ]
    );
  }
}