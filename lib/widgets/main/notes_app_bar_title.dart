import 'package:flutter/material.dart';
import 'package:notesapp/widgets/icon/theme_ttoggle_button.dart';

class NotesAppBarTitle extends StatelessWidget {
  const NotesAppBarTitle({
    super.key,
    required this.textTitle,
    required this.textTitleStyle,
    required this.icon,
  });

  final String textTitle;
  final TextStyle textTitleStyle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textTitle,
          style: textTitleStyle,
        ),
        const SizedBox(
          width: 5,
        ),
        const ThemeToggleButton(),
        const Spacer(),
        icon,
      ],
    );
  }
}
