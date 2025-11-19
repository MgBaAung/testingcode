import 'package:testingapp/base_architecture/app_setting/utils/temporary_generate_id.dart';
import 'package:testingapp/base_architecture/core/master_object.dart';

class CustomerModel extends MasterObject<CustomerModel> {
  final String? name;
  final String? phone;
  final String? address;
  final String? gender;
  final DateTime? dob;
  final DateTime? appointmentDate;
  final String? image;

  CustomerModel({
    String? id,
    this.name,
    this.phone,
    this.address,
    this.gender,
    this.dob,
    this.appointmentDate,
    this.image,
  }) : super(id: id ?? "");
  @override
  List<Object?> get props => [id, name, phone, address, gender, dob];

  @override
  CustomerModel fromMap(dynamicData) {
    return CustomerModel(
      id: dynamicData['id'],
      name: dynamicData['name'],
      phone: dynamicData['phone'],
      address: dynamicData['address'],
      gender: dynamicData['gender'],
      dob: dynamicData['dob'],
      appointmentDate: dynamicData['appointmentDate'],
      image: dynamicData['image'],
    );
  }

  @override
  List<CustomerModel> fromMapList(List dynamicDataList) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(CustomerModel object) {
    return {
      'id': generateId,
      'name': object.name,
      'phone': object.phone,
      'address': object.address,
      'gender': object.gender,
      'dob': object.dob,
      'appointmentDate': object.appointmentDate,
      'image': object.image,
    };
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<CustomerModel> objectList) {
    throw UnimplementedError();
  }

  CustomerModel copyWith({
    required String name,
    required String phone,
    required String address,
    String? gender,
    DateTime? dob,
  }) {
    return CustomerModel(
      id: generateId,
      name: name,
      phone: phone,
      address: address,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      appointmentDate: appointmentDate,
      image: image,
    );
  }
}
