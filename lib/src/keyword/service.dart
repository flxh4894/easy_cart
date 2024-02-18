import 'package:easy_cart/src/keyword/repository/repository.dart';
import 'package:get_it/get_it.dart';

class KeywordService {
  $KeywordRepository get repo => GetIt.instance.get<$KeywordRepository>();
}
