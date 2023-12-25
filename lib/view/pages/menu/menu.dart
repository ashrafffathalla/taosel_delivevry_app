import 'package:flutter/material.dart';
import '../../../core/size_config/size_config.dart';
import 'menu_sections/menu_bottom.dart';
import 'menu_sections/menu_content.dart';
import 'menu_sections/menu_header.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(0)),
      child: Drawer(
        width: SizeConfig.defaultSize! * 28,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MenuHeader(context: context),
              const BuildMenuItem(),
              MenuBottom(context: context),
            ],
          ),
        ),
      ),
    );
  }
}
