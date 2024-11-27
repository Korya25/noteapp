import 'package:flutter/material.dart';
import 'package:notesapp/screens/search_page.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  // Handle search icon press
  void _navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _navigateToSearchPage(context);
      },
      icon: const Icon(
        Icons.search,
        size: 30,
      ),
    );
  }
}
