import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
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
          'Mes likes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10, bottom: 10, right: 10, top:10),
        child: Column(
            children: const <Widget>[
              SizedBox(height: 10),
              Apercu(),
              SizedBox(height: 10),
              Apercu(),
              SizedBox(height: 10),
              Apercu(),
            ]
        ),
      ),
    );
  }
}