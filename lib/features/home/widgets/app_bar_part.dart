import 'package:flutter/material.dart';
import '../../../constants/color.dart';

PreferredSizeWidget appBarPart() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: AppBar(
        primary: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: primary,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 32),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-face_171337-2887.jpg'),
            ),
          )
        ],
      ),
    ),
  );
}
