import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class UnknownFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NoStoresFoundFailure extends Failure {
  @override
  List<Object> get props => [];
}
