import 'package:client/config/default_style.dart';
import 'package:dio/dio.dart';

class Employee {
  int? id;
  String? name;
  String? bank;
  String? address;
  final dio = Dio();

  Employee({this.id, this.name, this.bank, this.address});

  Employee.create({this.name, this.bank, this.address});

  Future<void> save() async {
    if (id == null) {
      await dio.post(
        '$serverUrl/employees',
        data: {
          'name': name,
          'bank': bank,
          'address': address,
        },
      );
    } else {
      await dio.put('$serverUrl/employees/$id', data: {
        'name': name,
        'bank': bank,
        'address': address,
      });
    }
  }

  Future<void> delete() async {
    await dio.delete('$serverUrl/employees/$id');
  }
}
