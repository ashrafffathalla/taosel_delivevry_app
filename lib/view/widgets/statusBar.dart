import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/localization/check_local.dart';
class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return Flexible(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                      'assets/images/shop.svg'),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary,
                          borderRadius:
                          BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.01.sh),
                        child: Text(
                          "0ج.م",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp),
                        ),
                      )),
                ],
              ),
              Text(
                CheckLocal.isDirectionRTL(context)
                    ? "عنوان التوصيل ^"
                    : "Delivery address ^",
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: CircleAvatar(
                      radius: 18.sp, // Image radius
                      backgroundImage: const NetworkImage(
                        'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
