import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LicenceImage extends StatelessWidget {
  const LicenceImage({Key? key, required this.image}) : super(key: key);
  final dynamic image;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.orangeAccent,
            size: 30,
          ),
        ),
        title: Text(
          local!.licenseID,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.sp),
        child: Center(
          child: Image.network(
            image,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 10,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      CheckLocal.isDirectionRTL(context)
                          ? 'جاري تحميل الرخصه....'
                          : "Downloading license....",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
