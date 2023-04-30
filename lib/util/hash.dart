///
/// Hive 저장용 hash 만들기
///
String makeHash(int hashCode) =>
    (DateTime.now().microsecondsSinceEpoch + hashCode).hashCode.toString();
