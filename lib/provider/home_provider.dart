import 'dart:developer';

import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/util/hash.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    return box.values.toList().reversed.toList();
  }

  // 리스트 순서 정렬
  void onReorder(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final updateList = [...state];
    final StoreModel item = updateList.removeAt(oldIndex);
    updateList.insert(newIndex, item);

    state = updateList;
    await box.clear();
    for (var element in state) {
      box.add(element);
    }
  }

  // DB 에서 스토어 추가
  void add(StoreModel model) async {
    model = model.copyWith(childKey: makeHash(model.hashCode));
    await box.add(model);
    state = [model, ...state];
  }

  // DB 에서 스토어 삭제
  void delete(int index) {
    box.deleteAt(index);
    final list = [...state]..removeAt(index);
    state = list;
  }

  void rename(int idx, StoreModel model) {
    box.putAt(idx, model);
    final updateList = [...state]..[idx] = model;
    state = updateList;
  }

  /// 각 스토어 장바구니 수량 업데이트
  /// Done / Total
  void updateCnt(int total, int done, String childKey) {
    StoreModel m = state.firstWhere((element) => element.childKey == childKey);
    final idx = state.indexOf(m);
    final boxIdx = box.values.toList().indexOf(m);

    m = m.copyWith(totalCnt: total, doneCnt: done);
    final updateList = [...state];
    updateList[idx] = m;

    state = updateList;
    box.putAt(boxIdx, m);
  }
}
