import 'package:testingapp/base_architecture/core/master_object.dart';

// ignore: must_be_immutable
class OrderItemModel extends MasterObject<OrderItemModel> {
  List<Items>? items;

  OrderItemModel({this.items}) : super(id: "");

  @override
  OrderItemModel fromMap(dynamicData) {
    if (dynamicData['items'] != null) {
      items = [];
      items = <Items>[];
      dynamicData['items'].forEach((v) {
        items!.add(Items().fromMap(v));
      });
    }
    return OrderItemModel(items: items);
  }

  @override
  List<OrderItemModel> fromMapList(List dynamicDataList) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(OrderItemModel object) {
    final Map<String, dynamic> data = {};
    if (object.items != null) {
      data['items'] = object.items!.map((v) => v.toMap(v)).toList();
    }
    return data;
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<OrderItemModel> objectList) {
    throw UnimplementedError();
  }
}

// ignore: must_be_immutable
class Items extends MasterObject<Items> {
  String? productId;
  int? quantity;

  Items({this.productId, this.quantity}) : super(id: "");

  @override
  Items fromMap(dynamicData) {
    return Items(
      productId: dynamicData['productId'],
      quantity: dynamicData['quantity'],
    );
  }

  @override
  List<Items> fromMapList(List dynamicDataList) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(Items object) {
    return {'productId': object.productId, 'quantity': object.quantity};
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<Items> objectList) {
    throw UnimplementedError();
  }
}
