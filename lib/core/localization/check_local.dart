import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class CheckLocal {
  static bool isDirectionRTL(BuildContext context) {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(context).languageCode);
  }
}
