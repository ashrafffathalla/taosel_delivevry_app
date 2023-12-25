import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/hiva_helper.dart';
import '../constant/lang_code.dart';

class LanguageCubit extends Cubit<Locale> {
  String ? currentLocal;
   HiveHelper? hiveHelper;
  LanguageCubit(this.hiveHelper) : super( const Locale("ar")) {
    emitLocale();
  }

  static LanguageCubit get(context) => BlocProvider.of(context);


  bool langcode = true;
  emitLocale() async {
    langCode = await hiveHelper!.getData("lang") ?? "ar";
    emit(Locale(await hiveHelper!.getData("lang") ?? "ar"));

  }

  selectEngLanguage() async {
    if (langcode) {
      langcode = !langcode;
      await hiveHelper!.putData("lang", "en");
       langCode = 'en';
      emit(const Locale('en'));

    }
    else {
      langcode = !langcode;
      await hiveHelper!.putData("lang", "ar");
       langCode = 'ar';
      emit(const Locale('ar'));

    }
  }

  // void selectArabicLanguage() async {
  //   await hiveHelper.putData("lang", "ar");
  //   // langCode = 'ar';
  //   emit(const Locale('ar'));
  // }
}
