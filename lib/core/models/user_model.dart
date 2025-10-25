import 'address_model.dart';

class UserModel {
  final String name;
  final String lastName;
  final DateTime? birthdate;
  final List<AddressModel> address;

  UserModel({
    required this.name,
    required this.lastName,
    this.birthdate,
    required this.address,
  });

  factory UserModel.empty() =>
      UserModel(name: '', lastName: '', birthdate: DateTime.now(), address: []);
}
