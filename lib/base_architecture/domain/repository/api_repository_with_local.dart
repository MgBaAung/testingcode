import 'dart:developer';

import 'package:testingapp/base_architecture/core/api_response.dart';
import 'package:testingapp/base_architecture/core/base_entity.dart';
import 'package:testingapp/base_architecture/core/master_object.dart';
import 'package:testingapp/base_architecture/data/local_datasource/local_datasource.dart';
import 'package:testingapp/base_architecture/domain/repository/api_repository.dart';

class ApiRepositoryWithLocalStorage<
  T extends MasterObject<T>,
  E extends BaseEntity<T, E>
>
    extends ApiRepository<T> {
  final LocalDataSource<T, E> localDataSource;

  ApiRepositoryWithLocalStorage({
    required super.networkClient,
    required super.tokenManager,
    required this.localDataSource,
  });

  @override
  Future<ApiResponse<T>> get<T>(
    String endPoint,
    T Function(dynamic p1) parser, {
    Map<String, dynamic>? queryParams,
    bool isList = false,
  }) async {
    try {
      final apiResponse = await super.get(
        endPoint,
        parser,
        queryParams: queryParams,
        isList: isList,
      );

      if (apiResponse.success && apiResponse.data != null) {
        if (isList) {
          try {
            localDataSource.clear();
            final dataList = apiResponse.data! as List;
            for (var data in dataList) {
              await localDataSource.save(data);
            }
          } catch (e) {
            print('Local save error: $e');
          }
        }
      } else {
        try {
          final cacheEntitys = await localDataSource.getAll();
          if (cacheEntitys.isNotEmpty) {
            if (isList) {
              return ApiResponse(success: true, data: cacheEntitys as T);
            }
          }
        } catch (cacheError) {
          return ApiResponse(
            success: false,
            message:
                'API failed and cache access failed. Error: $cacheError, Cache error: $cacheError',
          );
        }
      }

      return apiResponse;
    } catch (e) {
      try {
        final cacheEntitys = await localDataSource.getAll();
        if (cacheEntitys.isNotEmpty) {
          if (isList) {
            return ApiResponse(success: true, data: cacheEntitys as T);
          }
        }
      } catch (cacheError) {
        return ApiResponse(
          success: false,
          message:
              'API failed and cache access failed. Error: $e, Cache error: $cacheError',
        );
      }
    }

    return const ApiResponse(success: false, message: 'Fail to call');
  }

  @override
  Future<ApiResponse<TResponse>> post<TRequest, TResponse>(
    String endpoint,
    TRequest? data,
    TResponse Function(dynamic p1) parser,
  ) async {
    final entity = data as T;

    try {
      log("save is error ");

      final apiResponse = await super.post(endpoint, data, parser);
      if (apiResponse.success && apiResponse.data != null) {
        await localDataSource.save(entity);
        return apiResponse;
      } else {
        try {
          await localDataSource.save(entity);
          return ApiResponse(success: true, data: entity as TResponse);
        } catch (e) {
          log("save is error ${e}");
          return ApiResponse(
            success: false,
            message: 'API failed and cache adding failed',
          );
        }
      }
    } catch (e) {
      try {
        await localDataSource.save(entity);
        return ApiResponse(success: true, data: entity as TResponse);
      } catch (e) {
        log("save is error ${e}");
        return ApiResponse(
          success: false,
          message: 'API failed and cache adding failed',
        );
      }
    }
  }

  @override
  Future<ApiResponse<TResponse>> put<TRequest, TResponse>(
    String endpoint,
    String id,
    TRequest data,
    TResponse Function(dynamic p1) parser,
  ) async {
    final entity = data as T;

    try {
      final apiResponse = await super.put(endpoint, id, data, parser);
      if (apiResponse.success && apiResponse.data != null) {
        await localDataSource.save(entity);
        return apiResponse;
      } else {
        await localDataSource.save(entity);
        return ApiResponse(success: true, data: entity as TResponse);
      }
    } catch (e) {
      try {
        await localDataSource.save(entity);
        return ApiResponse(success: true, data: entity as TResponse);
      } catch (cacheError) {
        return ApiResponse(
          success: false,
          message:
              'API failed and cache update failed. Error: $e, Cache error: $cacheError',
        );
      }
    }
  }

  @override
  Future<ApiResponse<EmptyResponse>> delete(String endpoint, String id) async {
    try {
      await localDataSource.delete(id);
      final apiResponse = await super.delete(endpoint, id);
      if (apiResponse.success && apiResponse.data != null) {
        await localDataSource.delete(id);
        return apiResponse;
      } else {
        await localDataSource.delete(id);
        return ApiResponse(success: true, message: "delete sucessfully");
      }
    } catch (e) {
      try {
        await localDataSource.delete(id);
        return ApiResponse(success: true);
      } catch (cacheError) {
        return ApiResponse(
          success: false,
          message:
              'API failed and cache delete failed. Error: $e, Cache error: $cacheError',
        );
      }
    }
  }
}
