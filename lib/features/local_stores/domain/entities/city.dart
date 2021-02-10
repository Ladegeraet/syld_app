import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class City extends Equatable {
  final String id;
  final String name;

  City({
    @required this.id,
    @required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
