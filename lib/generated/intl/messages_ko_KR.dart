// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko_KR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko_KR';

  static String m0(count) => "아직 ${count}개의 물건이 남았습니다.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Add": MessageLookupByLibrary.simpleMessage("추가"),
        "AddCart": MessageLookupByLibrary.simpleMessage("장바구니 추가"),
        "AddCartInputHint": MessageLookupByLibrary.simpleMessage("예) 이마트"),
        "AddStore": MessageLookupByLibrary.simpleMessage("장바구니 추가"),
        "Cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "Cart_Badege_NoItem_Title":
            MessageLookupByLibrary.simpleMessage("물건을 추가해서 장보기를 시작해보세요!"),
        "Cart_Badege_Title": m0,
        "Cart_Done": MessageLookupByLibrary.simpleMessage("완료 목록"),
        "Cart_ING": MessageLookupByLibrary.simpleMessage("장바구니 목록"),
        "Confirm": MessageLookupByLibrary.simpleMessage("확인"),
        "Delete": MessageLookupByLibrary.simpleMessage("삭제"),
        "ECDropDownEnum_Delete": MessageLookupByLibrary.simpleMessage("삭제"),
        "ECDropDownEnum_Rename": MessageLookupByLibrary.simpleMessage("이름 변경"),
        "ItemDelete": MessageLookupByLibrary.simpleMessage("삭제할까요?"),
        "ItemInputHint": MessageLookupByLibrary.simpleMessage("물건명을 입력해 주세요."),
        "Modify": MessageLookupByLibrary.simpleMessage("수정"),
        "No": MessageLookupByLibrary.simpleMessage("아니오"),
        "Recent_Keyword": MessageLookupByLibrary.simpleMessage("최근 추가한 물품"),
        "Rename": MessageLookupByLibrary.simpleMessage("변경"),
        "StoreDone": MessageLookupByLibrary.simpleMessage("장보기 완료"),
        "Yes": MessageLookupByLibrary.simpleMessage("네")
      };
}
