
import 'package:hive/hive.dart';
import 'package:testingapp/base_architecture/core/master_object.dart';

abstract class BaseEntity<T extends MasterObject, E extends BaseEntity<T, E>> with HiveObjectMixin{
  T toModel();
  E fromModel(T model);
}
