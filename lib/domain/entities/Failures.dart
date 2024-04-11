
class Failures{
 String? errorMsg;
 Failures({required this.errorMsg});
}
class NetworkFailure extends Failures{
  NetworkFailure({required super.errorMsg});

}
class ServerFailure extends Failures{
  ServerFailure({required super.errorMsg});
}