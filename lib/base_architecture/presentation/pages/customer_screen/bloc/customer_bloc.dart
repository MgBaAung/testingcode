import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/presentation/bloc/api_event.dart';
import 'package:testingapp/base_architecture/presentation/bloc/base_bloc.dart';

class CustomerBloc extends BaseBloc<CustomerModel> {
  CustomerBloc({required super.crudUsecase});

  void addCustomer(CustomerModel model) {
    add(
      CreateDataEvent<CustomerModel, CustomerModel>(
        endpoint: 'customer',
        data: model,
        parser: (json) => CustomerModel().fromMap(json as Map<String, dynamic>),
      ),
    );
  }
}


