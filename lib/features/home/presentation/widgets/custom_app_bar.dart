import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          icon: Icon(Icons.apps),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            icon: Icon(Icons.local_mall, color: Colors.blueAccent),
          ),
        ),
      ],
      centerTitle: true,
      title: Column(
        children: [
          Text(
            'Store location',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '📍Egypt, naser city',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
