import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CustomAuthAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.indigo[700],
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
