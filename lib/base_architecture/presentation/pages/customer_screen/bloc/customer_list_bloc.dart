import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/presentation/bloc/base_bloc.dart';
import 'package:testingapp/base_architecture/presentation/bloc/api_event.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/bloc/customer_list_usecase.dart'; // Usecase ကို သုံးဖို့

class CustomerListBloc extends BaseBloc<CustomerModel> {
  final CustomerListUsecase customerListUsecase;

  CustomerListBloc({required super.crudUsecase})
    : customerListUsecase = crudUsecase as CustomerListUsecase;

  void fetchPaginatedCustomers({
    required String appointmentDate,
    String? nameFilter,
  }) {
    add(
      FetchDataEvent<List<CustomerModel>>(
        endpoint: "customer",
        parser: (json) => List<CustomerModel>.from(
          (json as List).map((x) => CustomerModel().fromMap(x)),
        ),
        isList: true,
        queryParams: {
          'appointmentDate': appointmentDate,
          if (nameFilter != null && nameFilter.isNotEmpty) 'name': nameFilter,
        },
      ),
    );
  }
}
