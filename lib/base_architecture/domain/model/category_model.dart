import 'package:testingapp/base_architecture/core/master_object.dart';

// ignore: must_be_immutable
class CategoryModel extends MasterObject<CategoryModel> {
  String? name;
  CategoryModel({String? id, this.name}) : super(id: (id).toString());

  @override
  List<Object?> get props => [id, name];

  @override
  CategoryModel fromMap(dynamicData) {
    return CategoryModel(id: dynamicData['id'], name: dynamicData['name']);
  }

  @override
  List<CategoryModel> fromMapList(List dynamicDataList) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(CategoryModel object) {
    return {
      'id':object.id,
      'name': object.name,
    };
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<CategoryModel> objectList) {
    throw UnimplementedError();
  }
}
