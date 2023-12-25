import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/size_config/size_config.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
            top: SizeConfig.defaultSize! * 8,
            bottom: SizeConfig.defaultSize! * 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      "assets/images/version.svg",
                      color: Colors.amber,
                    )
                ),
                const Text(
                  "Version 1.0",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),

          ],
        ),
      );
}
