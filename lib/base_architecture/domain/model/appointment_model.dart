import 'package:testingapp/base_architecture/core/master_object.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';

class AppointmentModel extends MasterObject<AppointmentModel> {
  final CustomerModel customer;
  final DateTime appointmentDate;
  final String serviceType;
  final String? notes;

  const AppointmentModel({
    String? id,
    required this.customer,
    required this.appointmentDate,
    required this.serviceType,
    this.notes,
  }) : super(id: id ?? "");
  @override
  AppointmentModel fromMap(dynamicData) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  List<AppointmentModel> fromMapList(List dynamicDataList) {
    // TODO: implement fromMapList
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(AppointmentModel object) {
    // TODO: implement toMap
    throw UnimplementedError();
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<AppointmentModel> objectList) {
    // TODO: implement toMapList
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
    ...super.props, 
    customer, 
    appointmentDate, 
    serviceType, 
    notes
  ];
}
