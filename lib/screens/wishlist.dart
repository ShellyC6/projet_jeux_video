import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: (){
            print("Bouton Close");
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset("res/svg/close.svg"),
        ),
        title: Text(
          'Ma liste de souhaits',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10, bottom: 10, right: 10, top:10),
        child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Apercu(detail: true, id: 0),
              SizedBox(height: 10),
              Apercu(detail: true, id: 0),
              SizedBox(height: 10),
              Apercu(detail: true, id: 0),
            ]
        ),
      ),
    );
  }
}