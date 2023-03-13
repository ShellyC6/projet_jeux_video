import 'package:flutter/material.dart';
import '/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, required this.text});

  final String text;

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
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: AppColors.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}