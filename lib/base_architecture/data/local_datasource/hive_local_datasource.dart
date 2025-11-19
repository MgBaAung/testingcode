import 'package:hive/hive.dart';
import 'package:testingapp/base_architecture/core/base_entity.dart';
import 'package:testingapp/base_architecture/core/master_object.dart';
import 'package:testingapp/base_architecture/data/local_datasource/local_datasource.dart';
import 'package:testingapp/base_architecture/presentation/bloc/api_state.dart';

class HiveLocalDataSourceImpl<
  T extends MasterObject,
  E extends BaseEntity<T, E>
>
    extends LocalDataSource<T, E> {
  final Box<E> _box;

  final E Function() entityFactory;

  HiveLocalDataSourceImpl({required this.entityFactory, required Box<E> box})
    : _box = box;

  @override
  Future<void> clear() async {
    try {
      final box = _box;
      await box.clear();
    } catch (e) {
      throw ApiFailure('Failed to clear cache: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final box = _box;
      return box.delete(id);
    } catch (e) {
      throw ApiFailure('Failed to delete item from cache: $e');
    }
  }

  @override
  Future<List<T>> getAll() async {
    try {
      final box = _box;
      return box.values.map((e) => e.toModel()).toList();
    } catch (e) {
      throw ApiFailure('Failed to get all items from cache: $e');
    }
  }

  @override
  Future<T?> getById(String id) async {
    try {
      final box = _box;
      final entity = box.get(id);
      return entity?.toModel();
    } catch (e) {
      throw ApiFailure('Failed to get item by id from cache: $e');
    }
  }

  @override
  Future<void> save(T model) async {
    try {
      final box = _box;
      final entity = entityFactory().fromModel(model);
      return box.put(model.id, entity);
    } catch (e) {
      throw ApiFailure('Failed to save item to cache: $e');
    }
  }

  @override
  Future<List<T>> getPaginatedList(int page, int limit) async {
    try {
      final allEntities = _box.values.toList();

      allEntities.sort((a, b) {
        final keyA = a.key;
        final keyB = b.key;
        if (keyA is String && keyB is String) {
          return keyA.compareTo(keyB);
        }
        if (keyA is int && keyB is int) {
          return keyA.compareTo(keyB);
        }
        return 0;
      });

      final skipCount = page * limit;

      if (skipCount >= allEntities.length) {
        return [];
      }
      final paginatedEntities = allEntities
          .skip(skipCount)
          .take(limit)
          .toList();
      return paginatedEntities.map((e) => e.toModel()).toList();
    } catch (e) {
      throw ApiFailure('Failed to get paginated list from cache: $e');
    }
  }
}
