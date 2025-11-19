import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/presentation/bloc/api_event.dart';
import 'package:testingapp/base_architecture/presentation/bloc/base_bloc.dart';

class AppointmentBloc extends BaseBloc<CustomerModel> {
  AppointmentBloc({required super.crudUsecase});

  void fetchOneMonthCustomers(DateTime month) {
    add(
      FetchDataEvent<List<CustomerModel>>(
        endpoint: "customer",
        queryParams: {'monthYear': month},
        parser: (json) => (json as List<dynamic>)
            .map((e) => CustomerModel().fromMap(e as Map<String, dynamic>))
            .toList(),
        isList: true,
      ),
    );
  }
}
