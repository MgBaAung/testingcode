import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/domain/usecase/baste_usecase.dart';

class CustomerListUsecase extends CrudUseCase<CustomerModel> {
  CustomerListUsecase({required super.repository});

}
