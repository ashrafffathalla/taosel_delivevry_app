import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionContainer extends StatefulWidget {
  String icon;
  String question;
  String answer;
  QuestionContainer(
      {required this.icon,
      required this.question,
      required this.answer,
      Key? key})
      : super(key: key);

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  bool supportCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: ExpansionTile(
        //backgroundColor: Theme.of(context).colorScheme.secondary,
        textColor: Theme.of(context).colorScheme.secondary,

        collapsedBackgroundColor: const Color(0xffC7C7C7),
        onExpansionChanged: (trailing) {
          setState(() {
            supportCollapsed = trailing;
          });
        },
        trailing: !supportCollapsed
            ? CheckLocal.isDirectionRTL(context)
                ? SvgPicture.asset("assets/images/arrowLeft.svg")
                : SvgPicture.asset("assets/images/arrowRight.svg")
            : SvgPicture.asset("assets/images/arrowDown.svg"),
        title: Container(
          height: SizeConfig.defaultSize! * 5,
          child: Row(children: [
            Expanded(flex: 1, child: SvgPicture.asset(widget.icon)),
            SizedBox(
              width: SizeConfig.defaultSize! * .6,
            ),
            Expanded(
                flex: 10,
                child: Text(widget.question,
                    style: CheckLocal.isDirectionRTL(context)
                        ? const TextStyle(fontSize: 15)
                        : const TextStyle(fontSize: 15))),
          ]),
        ),
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Column(children: [
              Text(
                widget.answer,
                textAlign: TextAlign.center,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
