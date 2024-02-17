enum ActionMode {
  done,
  modify;

  String get name {
    switch (this) {
      case ActionMode.done:
        return "완료";
      case ActionMode.modify:
        return "수정";
    }
  }
}
