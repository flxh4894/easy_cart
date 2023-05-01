// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L {
  L();

  static L? _current;

  static L get current {
    assert(_current != null,
        'No instance of L was loaded. Try to initialize the L delegate before accessing L.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L();
      L._current = instance;

      return instance;
    });
  }

  static L of(BuildContext context) {
    final instance = L.maybeOf(context);
    assert(instance != null,
        'No instance of L present in the widget tree. Did you add L.delegate in localizationsDelegates?');
    return instance!;
  }

  static L? maybeOf(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  /// `네`
  String get Yes {
    return Intl.message(
      '네',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `아니오`
  String get No {
    return Intl.message(
      '아니오',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `추가`
  String get Add {
    return Intl.message(
      '추가',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `장바구니 추가`
  String get AddStore {
    return Intl.message(
      '장바구니 추가',
      name: 'AddStore',
      desc: '',
      args: [],
    );
  }

  /// `장보기 완료`
  String get StoreDone {
    return Intl.message(
      '장보기 완료',
      name: 'StoreDone',
      desc: '',
      args: [],
    );
  }

  /// `취소`
  String get Cancel {
    return Intl.message(
      '취소',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `장바구니 추가`
  String get AddCart {
    return Intl.message(
      '장바구니 추가',
      name: 'AddCart',
      desc: '',
      args: [],
    );
  }

  /// `예) 이마트`
  String get AddCartInputHint {
    return Intl.message(
      '예) 이마트',
      name: 'AddCartInputHint',
      desc: '',
      args: [],
    );
  }

  /// `삭제할까요?`
  String get ItemDelete {
    return Intl.message(
      '삭제할까요?',
      name: 'ItemDelete',
      desc: '',
      args: [],
    );
  }

  /// `물건명을 입력해 주세요.`
  String get ItemInputHint {
    return Intl.message(
      '물건명을 입력해 주세요.',
      name: 'ItemInputHint',
      desc: '',
      args: [],
    );
  }

  /// `이름 변경`
  String get ECDropDownEnum_Rename {
    return Intl.message(
      '이름 변경',
      name: 'ECDropDownEnum_Rename',
      desc: '',
      args: [],
    );
  }

  /// `삭제`
  String get ECDropDownEnum_Delete {
    return Intl.message(
      '삭제',
      name: 'ECDropDownEnum_Delete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ko', countryCode: 'KR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L> load(Locale locale) => L.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
