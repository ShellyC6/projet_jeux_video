import 'package:flutter/material.dart';
import 'package:projet_jeux_video/screens/recherche.dart';
import '/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key, required this.text});

  final String text;
  final myController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.contrastColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: widget.myController,
              style: Theme.of(context).textTheme.bodyMedium,
              obscureText: false,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: widget.text,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                border: InputBorder.none,
                fillColor: AppColors.contrastColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){
                print("Bouton Recherche");
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => RecherchePage(texte: widget.myController.text,)),
                );
              },
              icon: SvgPicture.asset("res/svg/search.svg"),
              )
          ),
        ],
      ),
    );
  }
}