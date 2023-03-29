import 'package:flutter/material.dart';
import 'package:projet_jeux_video/screens/jeu.dart';
import '/app_colors.dart';

class Apercu extends StatefulWidget {
  const Apercu({super.key, required this.detail});

  final bool detail;

  @override
  State<Apercu> createState() => _ApercuState();
}

class _ApercuState extends State<Apercu> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
        child: Stack(
          children : <Widget>[
            if(widget.detail)
              Image.asset(
                "res/img/apercu_recherche.png",
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              )
            else
              Image.asset(
                "res/img/apercu_description.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  //color: AppColors.accentColor,
                  child: Row(
                    children: <Widget>[
                      if(widget.detail)
                        Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                            child: Image.asset("res/img/jeu.png",height: 80,)
                        )
                      else
                        Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
                            child: Image.asset("res/img/jeu.png",height: 80,)
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
                          if(widget.detail)(const SizedBox(height: 10)),
                          if(widget.detail)(
                            const Text(
                              "Prix : 10,00€",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Proxima Nova",
                                color: AppColors.textColor,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if(widget.detail)
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
                        onPressed: () {
                          print("Bouton En savoir plus");
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) => JeuPage()),
                          );
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
                          child: Text(
                              textAlign: TextAlign.center, "En savoir plus"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          ),
        ],
      )
    );
  }
}