import 'package:testingapp/base_architecture/core/master_object.dart';

// ignore: must_be_immutable
class OrderHistoryModel extends MasterObject<OrderHistoryModel> {
  String? orderDate;
  double? totalPrice;
  String? status;
  String? username;
  List<Items>? items;

  OrderHistoryModel({
    String? id,
    this.orderDate,
    this.totalPrice,
    this.status,
    this.username,
    this.items,
  }) : super(id: id??'');

  @override
  OrderHistoryModel fromMap(dynamicData) {
    items = <Items>[];

    if (dynamicData['items'] != null) {
      dynamicData['items'].forEach((v) {
        items!.add(Items().fromMap(v));
      });
    }
    return OrderHistoryModel(
      id: dynamicData['id'],
      orderDate: dynamicData['orderDate'],
      totalPrice: dynamicData['totalPrice'],
      status: dynamicData['status'],
      items: items,
    );
  }

  @override
  List<OrderHistoryModel> fromMapList(List dynamicDataList) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(OrderHistoryModel object) {
    throw UnimplementedError();
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<OrderHistoryModel> objectList) {
    throw UnimplementedError();
  }
}

// ignore: must_be_immutable
class Items extends MasterObject<Items> {
  int? quantity;
  double? priceAtTimeOfOrder;
  String? productId;
  String? productName;

  Items({
    String? id,
    this.quantity,
    this.priceAtTimeOfOrder,
    this.productId,
    this.productName,
  }) : super(id: "");

  @override
  Items fromMap(dynamicData) {
    return Items(
      id: dynamicData['id'],
      quantity: dynamicData['quantity'],
      priceAtTimeOfOrder: dynamicData['priceAtTimeOfOrder'],
      productId: dynamicData['productId'],
      productName: dynamicData['productName'],
    );
  }

  @override
  List<Items> fromMapList(List dynamicDataList) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(Items object) {
    throw UnimplementedError();
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<Items> objectList) {
    throw UnimplementedError();
  }
}
