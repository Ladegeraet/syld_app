import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Store extends Equatable {
  final String name;
  final int zipCode;
  final Uri thumbnailUri;
  final String description;
  final String address;
  final String phone;
  final String email;
  final Uri web;

  Store({
    @required this.name,
    @required this.zipCode,
    @required this.description,
    @required this.address,
    @required this.phone,
    this.thumbnailUri,
    this.email,
    this.web,
  });

  @override
  List<Object> get props => [
        name,
        zipCode,
        description,
        address,
        phone,
        thumbnailUri,
        email,
        web,
      ];
}
