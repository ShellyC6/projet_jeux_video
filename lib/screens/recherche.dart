import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';

class RecherchePage extends StatefulWidget {
  const RecherchePage({super.key});

  @override
  State<RecherchePage> createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: (){
            print("Bouton Close");
          },
          icon: SvgPicture.asset("res/svg/close.svg"),
        ),
        title: Text(
          'Recherche',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10, bottom: 10, right: 10, top:10),
        child: Column(
            children: <Widget>[
              const SearchBar(text: "Stray"),
              const SizedBox(height: 10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:  const [
                    Text(
                      "Nombre de résultats : 3",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Proxima Nova",
                        color: AppColors.textColor,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ]
              ),
              const SizedBox(height: 10),
              Apercu(detail: true),
              const SizedBox(height: 10),
              Apercu(detail: true),
              const SizedBox(height: 10),
              Apercu(detail: true),
            ]
        ),
      ),
    );
  }
}