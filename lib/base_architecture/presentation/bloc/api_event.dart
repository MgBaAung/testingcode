import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object?> get props => [];
}

class FetchDataEvent<T> extends ApiEvent {
  final String endpoint;
  final Map<String, dynamic>? queryParams;
  final T Function(dynamic json) parser;
  final bool isList;

  // New: Flag to instruct the BLoC/BaseBloc on how to handle the result
  final bool shouldAppend; // True for 'Load More', False for 'Initial/Refresh'

  const FetchDataEvent({
    required this.endpoint,
    this.queryParams,
    required this.parser,
    this.isList = false,
    this.shouldAppend = false, // Default is false (replace data)
  });


  @override
  List<Object?> get props => [
    endpoint,
    queryParams,
    parser,
    isList,
    shouldAppend,
  ];
}

class CreateDataEvent<TRequest, TResponse> extends ApiEvent {
  final String endpoint;
  final TRequest data;
  final TResponse Function(dynamic json) parser;

  const CreateDataEvent({
    required this.endpoint,
    required this.data,
    required this.parser,
  });

  @override
  List<Object?> get props => [endpoint, data, parser];
}

class UpdateDataEvent<TRequest, TResponse> extends ApiEvent {
  final String endpoint;
  final String id;
  final TRequest data;
  final TResponse Function(dynamic json) parser;

  const UpdateDataEvent({
    required this.endpoint,
    required this.id,
    required this.data,
    required this.parser,
  });

  @override
  List<Object?> get props => [endpoint, id, data, parser];
}

class DeleteDataEvent extends ApiEvent {
  final String endpoint;
  final String id;

  const DeleteDataEvent({required this.endpoint, required this.id});

  @override
  List<Object?> get props => [endpoint, id];
}

class RequestEmptyEvent<TRequest, TResponse> extends ApiEvent {
  final String endpoint;
  final TRequest data;
  final TResponse Function(dynamic json) parser;

  const RequestEmptyEvent({
    required this.endpoint,
    required this.data,
    required this.parser,
  });

  @override
  List<Object?> get props => [endpoint, data, parser];
}
