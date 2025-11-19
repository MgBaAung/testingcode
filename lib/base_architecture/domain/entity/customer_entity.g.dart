// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerEntityAdapter extends TypeAdapter<CustomerEntity> {
  @override
  final int typeId = 1;

  @override
  CustomerEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerEntity(
      id: fields[0] as String?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      address: fields[3] as String?,
      gender: fields[4] as String?,
      dob: fields[5] as DateTime?,
      appointmentDate: fields[6] as DateTime?,
      image: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.appointmentDate)
      ..writeByte(7)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
