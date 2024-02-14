import 'package:easy_cart/src/cart/repository/repository.dart';
import 'package:get_it/get_it.dart';

class CartService {
  $CartRepository get repo => GetIt.instance.get<$CartRepository>();
}
