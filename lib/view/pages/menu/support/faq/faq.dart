import 'package:taoel_driver_app/view/pages/menu/support/faq/widget/question_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/localization/check_local.dart';
import '../../../../../core/size_config/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Stack(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          height: SizeConfig.screenHeight,
          width: double.infinity,
        ),
        CheckLocal.isDirectionRTL(context)
            ? Positioned(
                // top: -50,
                right: -110,
                width: MediaQuery.of(context).size.width * 1.5,
                child: SvgPicture.asset(
                    alignment: Alignment.topCenter,
                    "assets/images/HomeCurveAr.svg"))
            : Positioned(
                // top: -50,
                left: -110,
                width: MediaQuery.of(context).size.width * 1.5,
                child: SvgPicture.asset(
                  "assets/images/HomeCurve.svg",
                  alignment: Alignment.topCenter,
                ),
              ),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.close,
                    size: 25,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            toolbarHeight: SizeConfig.screenHeight! * 0.08,
            backgroundColor: Colors.white.withOpacity(0),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SvgPicture.asset(
                  "assets/images/logo.svg",
                ),
              )
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 6,
              ),
              Center(
                child: Text(
                  local!.faq,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 4,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  QuestionContainer(
                    icon: "assets/images/faq1.svg",
                    question: local.q1,
                    answer: local.a1,
                  ),
                  QuestionContainer(
                    icon: "assets/images/faq2.svg",
                    question: local.q2,
                    answer: local.a2,
                  ),
                  QuestionContainer(
                    icon: "assets/images/faq3.svg",
                    question: local.q3,
                    answer: local.a3,
                  ),
                  QuestionContainer(
                    icon: "assets/images/faq4.svg",
                    question: local.q4,
                    answer: local.a4,
                  ),
                  QuestionContainer(
                    icon: "assets/images/faq5.svg",
                    question: local.q5,
                    answer: local.a5,
                  ),
                  QuestionContainer(
                    icon: "assets/images/faq6.svg",
                    question: local.q6,
                    answer: local.a6,
                  ),
                ]),
              ))
            ],
          ),
        )
      ],
    );
  }
}
