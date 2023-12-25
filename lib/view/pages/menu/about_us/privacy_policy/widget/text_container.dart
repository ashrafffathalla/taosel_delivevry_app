import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/localization/check_local.dart';

class TextContainer extends StatelessWidget {
  String title;
  String description;
  TextContainer({required this.title, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 1,
          ),
          ReadMoreText(
            description,
            trimLines: 4,
            trimMode: TrimMode.Line,
            trimCollapsedText:CheckLocal.isDirectionRTL(context)? 'عرض المزيد':'Show more',
            moreStyle: TextStyle(
                color: Colors.blueAccent, decoration: TextDecoration.underline),
            trimExpandedText:CheckLocal.isDirectionRTL(context)? 'عرض الأقل':'Show less',
            lessStyle: TextStyle(
                color: Colors.blueAccent, decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
