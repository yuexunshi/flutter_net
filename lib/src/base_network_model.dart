/// It's a base class for all network models
abstract class BaseNetworkModel<T> {
  T fromJson(Map<String, dynamic> json);
}
