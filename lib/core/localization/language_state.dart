

import 'dart:ui';

import 'package:equatable/equatable.dart';
class LocalizationStates extends Equatable{
  final Locale locale;

  LocalizationStates({required this.locale});

  factory LocalizationStates.initial()=>LocalizationStates(locale: Locale('ar'));

  LocalizationStates copyWith({required Locale locale}) => LocalizationStates(locale: locale?? this.locale);
  @override
  List<Object?> get props => [locale];

}