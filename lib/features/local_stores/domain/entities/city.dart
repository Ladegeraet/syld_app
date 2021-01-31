import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class City extends Equatable {
  final String name;
  final List<int> zipCodes;

  City({
    @required this.name,
    @required this.zipCodes,
  });

  @override
  List<Object> get props => [name, zipCodes];
}
