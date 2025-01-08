import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HeadSearchBar extends StatefulWidget {
  const HeadSearchBar({super.key});

  @override
  _HeadSearchBarState createState() => _HeadSearchBarState();
}

class _HeadSearchBarState extends State<HeadSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 249, 1),
        borderRadius: BorderRadius.circular(99)
      ),
      child: Row(
        spacing: 6,
        children: [
          Icon(
            HugeIcons.strokeRoundedSearch01,
            color: Color.fromRGBO(147, 147, 147, 1),
            size: 21,
            weight: 6,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(147, 147, 147, 1),
                  fontSize: 14
                ),
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 14
              ),
            ),
          ),
          InkWell(
            child: Icon(
              HugeIcons.strokeRoundedCancel01,
              color: Color.fromRGBO(147, 147, 147, 1),
              size: 21,
              weight: 6,
            ),
            onTap: () {
              _controller.clear();
            },
          )
        ],
      )
    );
  } 
}