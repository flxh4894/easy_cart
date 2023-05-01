import 'dart:developer';

import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/provider/detail_provider.dart';
import 'package:easy_cart/util/hash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  late Box<StoreModel> box;

  @override
  List<StoreModel> build() {
    log("Home provider init");
    box = Hive.box<StoreModel>(storeModelName);
    log(box.name);
    return box.values.toList();
  }

  // 리스트 순서 정렬
  void onReorder(int oldIndex, int newIndex) async {
    final updateList = [...state];
    final StoreModel item = updateList.removeAt(oldIndex);
    updateList.insert(newIndex, item);

    state = [...updateList];
    await box.clear();
    for (var element in state) {
      box.add(element);
    }
  }

  // DB 에서 스토어 추가
  void add(StoreModel model) async {
    model = model.copyWith(childKey: makeHash(model.hashCode));
    await box.add(model);
    state = [...state, model];
  }

  // DB 에서 스토어 삭제
  void delete(int idx) {
    box.deleteAt(idx);
    // 상세목록 삭제 (childKey 기반)
    state = [...state]..removeAt(idx);
  }

  // 이름 변경
  void rename(int idx, StoreModel model) {
    box.putAt(idx, model);
    final updateList = [...state]..[idx] = model;
    state = updateList;
  }

  // 쇼핑 완료로 변경
  void doneStore(StoreModel model) {
    final idx = box.values.toList().indexOf(model);
    final String doneAt = DateFormat('yyyy.MM.dd (E)').format(DateTime.now());
    model = model.copyWith(isDone: true, doneAt: doneAt);
    box.putAt(idx, model);
    state = [...state]..[idx] = model;
  }

  /// 각 스토어 장바구니 수량 업데이트
  /// Done / Total
  void updateCnt(int total, int done, String childKey) {
    StoreModel m = state.firstWhere((element) => element.childKey == childKey);
    final idx = state.indexOf(m);

    m = m.copyWith(totalCnt: total, doneCnt: done);
    final updateList = [...state];
    updateList[idx] = m;

    state = updateList;
    box.putAt(idx, m);
  }
}

@riverpod
List<StoreModel> storeList(StoreListRef ref) {
  return ref.watch(homeProvider).where((element) => !element.isDone).toList();
}

@riverpod
List<StoreModel> doneList(DoneListRef ref) {
  return ref
      .watch(homeProvider)
      .where((element) => element.isDone)
      .toList()
      .reversed
      .toList();
}
