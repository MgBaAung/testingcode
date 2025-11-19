import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/domain/usecase/baste_usecase.dart';

class AppointmentUsecase extends CrudUseCase<CustomerModel> {
  AppointmentUsecase({required super.repository});
}
