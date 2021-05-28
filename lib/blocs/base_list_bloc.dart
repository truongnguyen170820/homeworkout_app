
import 'package:flutter/material.dart';

enum ViewState { BUSY, FREE }

class BaseListBlock<T> {
  ViewState _viewState;
  int pageIndex = 1;
  bool isNextPage = false;
  final listData = List<T>();
  DateTime lastReload;
  bool cache = false;
  List<T> memCache;
  int countRetryReload = 0;

  setList(List<T> list, int limit) {
    lastReload = DateTime.now();
    countRetryReload = 0;
    if(cache) memCache = list;

    if (pageIndex == 1) {
      listData.clear();
    }
    if (list.length == limit)
      isNextPage = true;
    else
      isNextPage = false;
    listData.addAll(list);
  }

  int getListLength() {
    if (isNextPage) return listData.length + 1;
    return listData.length;
  }

  bool canLoadMore(int index, int length) {
    return (isNextPage && index == length - 1);
  }

  refreshPage() {
    pageIndex = 1;
  }

  increasePage() {
    pageIndex += 1;
  }

  requestFinished() {
    _viewState = ViewState.FREE;
  }

  requestStarted() {
    _viewState = ViewState.BUSY;
  }

  bool isRequesting() {
    return (_viewState == ViewState.BUSY);
  }
}
