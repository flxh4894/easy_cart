import 'dart:developer';

import 'package:easy_cart/model/store_detail_model.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:easy_cart/util/hash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_provider.g.dart';

@riverpod
class StoreDetail extends _$StoreDetail {
  late Box<StoreDetailList> box;
  late String _childKey;
  @override
  List<StoreDetailModel> build({required String childKey}) {
    log("StoreDetailProvider Init");
    _childKey = childKey;
    box = Hive.box<StoreDetailList>(storeDetailListName);
    log(childKey);
    return box.get(_childKey)?.list ?? [];
  }

  ///
  /// Home 리스트 각 수량 업데이트
  ///
  void _updateHomeCnt() {
    // 완료 카운트
    final doneCnt = state.where((element) => element.isDone).length;
    ref.read(homeProvider.notifier).updateCnt(state.length, doneCnt, _childKey);
  }

  ///
  /// 추가
  ///
  Future<void> add(StoreDetailModel m) async {
    m = m.copyWith(hash: makeHash(m.hashCode));
    state = [m, ...state];
    updateState();
  }

  ///
  /// Update State to DB
  ///
  void updateState() {
    box.put(_childKey, StoreDetailList(list: state));
    _updateHomeCnt();
  }

  ///
  /// isDone
  ///
  void changeFlag(StoreDetailModel m) async {
    final idx = state.indexOf(m);
    m = m.copyWith(isDone: !m.isDone);
    final updateList = [...state];
    updateList[idx] = m;
    try {
      state = [...updateList];
      box.put(_childKey, StoreDetailList(list: state));
      _updateHomeCnt();
    } catch (e) {
      log(e.toString());
    }
  }

  // State 삭제
  void removeAt(int index) {
    final updateList = [...state];
    updateList.removeAt(index);
    state = updateList;
  }

  // State 삭제
  void delete() {
    log("삭제 진행합니다. $childKey");
    box.delete(childKey);
  }

  // State 추가
  void insert(int len, StoreDetailModel m) {
    final updateList = [...state];
    updateList.insert(len, m);

    state = updateList;
  }

  ///
  /// onReorder
  /// 리스트 순서 정렬
  ///
  void onReorder(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final updateList = [...state];
    final StoreDetailModel item = updateList.removeAt(oldIndex);
    updateList.insert(newIndex, item);
    try {
      state = updateList;
      box.put(_childKey, StoreDetailList(list: state));
    } catch (e) {
      log(e.toString());
    }
  }
}
