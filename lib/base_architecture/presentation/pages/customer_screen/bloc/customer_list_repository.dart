import 'package:testingapp/base_architecture/domain/entity/customer_entity.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/domain/repository/api_repository_with_local.dart';
import 'package:testingapp/base_architecture/core/api_response.dart';
import 'dart:developer';

class CustomerListRepository
    extends ApiRepositoryWithLocalStorage<CustomerModel, CustomerEntity> {
  CustomerListRepository({
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
    if (endPoint == "customer" && isList && queryParams != null) {
      try {
        final cacheEntitys = await localDataSource.getAll();
        log('Local cache has ${cacheEntitys.length} entries.');

        final String? appointmentDateFilter = queryParams['appointmentDate']
            ?.toString();
            
        final String nameFilter =
            queryParams['name']?.toString().toLowerCase() ?? '';

        final filtered = cacheEntitys.where((customer) {
          final String? customerApptDate = customer.appointmentDate
              ?.toIso8601String()
              .split('T')
              .first;
              
          final bool nameIsSet = nameFilter.isNotEmpty;

          if (nameIsSet) {
            final bool nameMatch =
                customer.name?.toLowerCase().contains(nameFilter) ?? false;
            log('Filtering by Name only: Name: ${customer.name} | Filter: $nameFilter | Match: $nameMatch');
            return nameMatch;
          } else {
            final bool dateMatch = appointmentDateFilter == null ||
                customerApptDate == appointmentDateFilter;
            log('Filtering by Date only: Cache Date: $customerApptDate | Filter Date: $appointmentDateFilter | Match: $dateMatch');
            return dateMatch;
          }
        });

        final finalFilteredList = filtered.toList();
        
        log('Final filtered list size: ${finalFilteredList.length}');

        return ApiResponse(success: true, data: finalFilteredList as T);
      } catch (cacheError) {
        log('Local cache error: $cacheError');
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