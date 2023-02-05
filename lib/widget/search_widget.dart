import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState(text: text, onChanged: onChanged, hintText: hintText);
}

class _SearchWidgetState extends State<SearchWidget> {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  _SearchWidgetState({
        required this.text,
        required this.onChanged,
        required this.hintText,});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 35,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(FluentSystemIcons.ic_fluent_search_filled, color: style.color),
          suffixIcon: text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: onChanged,
      ),
    );
  }
}
