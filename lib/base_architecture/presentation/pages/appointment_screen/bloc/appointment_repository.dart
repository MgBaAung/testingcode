import 'dart:developer';

import 'package:testingapp/base_architecture/core/api_response.dart';
import 'package:testingapp/base_architecture/domain/entity/customer_entity.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/domain/repository/api_repository_with_local.dart';

class AppointmentRepository
    extends ApiRepositoryWithLocalStorage<CustomerModel, CustomerEntity> {
  AppointmentRepository({
    required super.networkClient,
    required super.tokenManager,
    required super.localDataSource,
  });

  @override
  Future<ApiResponse<T>> get<T>(
    String endPoint,
    T Function(dynamic p1) parser, {
    Map<String, dynamic>? queryParams,
    bool isList = false,
  }) async {
    if (endPoint == "customer" && isList) {
      try {
        final cacheEntitys = await localDataSource.getAll();
        

        if (queryParams != null && queryParams.containsKey('monthYear')) {
          final DateTime monthYear = queryParams['monthYear'] as DateTime;

          final startOfMonth = DateTime(monthYear.year, monthYear.month, 1);
          final endOfMonth = DateTime(monthYear.year, monthYear.month + 1, 0);

          final filteredCustomers = cacheEntitys.where((customer) {
            final apptDate = customer.appointmentDate!;

            return (apptDate.isAfter(startOfMonth) ||
                    apptDate.isAtSameMomentAs(startOfMonth)) &&
                (apptDate.isBefore(endOfMonth) ||
                    apptDate.isAtSameMomentAs(endOfMonth));
          }).toList();

          return ApiResponse(success: true, data: filteredCustomers as T);
        } else {
          return ApiResponse(success: true, data: cacheEntitys as T);
        }
      } catch (cacheError) {
        return ApiResponse(
          success: false,
          message: 'Failed to access local customer cache: $cacheError',
        );
      }
    }

    return super.get(
      endPoint,
      parser,
      queryParams: queryParams,
      isList: isList,
    );
  }
}
