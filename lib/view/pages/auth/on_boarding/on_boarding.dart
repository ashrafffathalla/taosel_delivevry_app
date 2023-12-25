import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:taoel_driver_app/view/pages/auth/autth_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

import 'content_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    SizeConfig().init(context);
    List<UnbordingContent> contents = [
      UnbordingContent(
          title: local!.usability,
          image: 'assets/images/onboarding1.svg',
          description: local.usabilitydesc),
      UnbordingContent(
          title: local.time,
          image: 'assets/images/onboarding2.svg',
          description: local.timedesc),
      UnbordingContent(
          title: local.ourcars,
          image: 'assets/images/onboarding3.svg',
          description: local.ourcarsdesc),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            SizeConfig.defaultSize! * 28), // here the desired height
        child: AppBar(
          flexibleSpace: SvgPicture.asset(
            "assets/images/onBoarding-curve.svg",
            fit: BoxFit.cover,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthView()),
                  );
                },
                child: Text(
                  local.skip,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 115, 116, 117),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.defaultSize! * 40,
            child: PageView.builder(
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      SvgPicture.asset(
                        contents[i].image,
                        height: SizeConfig.defaultSize! * 20,
                        //width: SizeConfig.defaultSize! * 5,
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 4,
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 3,
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDots(index, context),
                )),
          ),
          Visibility(
            visible: currentIndex >= 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Align(
                alignment: CheckLocal.isDirectionRTL(context)
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight,
                child: FloatingActionButton(
                    child: Transform.rotate(
                        angle: CheckLocal.isDirectionRTL(context)
                            ? 180 * math.pi / 180
                            : 0 * math.pi / 180,
                        child: const Icon(Icons.double_arrow_rounded)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthView()),
                      );
                    }),
              ),
            ),
          ),
          /* ElevatedButton.icon(
              onPressed: () {
                BlocProvider.of<LanguageCubit>(context).selectEngLanguage();
              },
              icon: const Icon(Icons.language),
              label: const Text("Change Languagh"))*/
        ],
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: currentIndex == index ? 33 : 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? Theme.of(context).colorScheme.secondary
              : const Color(0xffb4b0cf)),
    );
  }
}
