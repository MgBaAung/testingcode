import 'package:hive/hive.dart';
import 'package:testingapp/base_architecture/core/base_entity.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
part 'customer_entity.g.dart';

@HiveType(typeId: 1)
class CustomerEntity extends BaseEntity<CustomerModel, CustomerEntity> {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  String? address;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  DateTime? dob;

  @HiveField(6)
  DateTime? appointmentDate;

  @HiveField(7)
  String? image;

  CustomerEntity({
    required this.id,
    this.name,
    this.phone,
    this.address,
    this.gender,
    this.dob,
    this.appointmentDate,
    this.image,
  });

  @override
  CustomerEntity fromModel(CustomerModel model) {
    return CustomerEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      address: model.address,
      gender: model.gender,
      dob: model.dob,
      appointmentDate: model.appointmentDate,
      image: model.image,
    );
  }

  @override
  CustomerModel toModel() {
    return CustomerModel(
      id: id,
      name: name ?? "",
      phone: phone ?? "",
      address: address ?? "",
      gender: gender,
      dob: dob,
      appointmentDate: appointmentDate,
      image: image ?? "",
    );
  }

  static void register() {
    Hive.registerAdapter(CustomerEntityAdapter());
  }
}
