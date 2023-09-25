import 'package:client/config/default_style.dart';
import 'package:client/models/employee.dart';
import 'package:client/widgets/employee_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  final dio = Dio();

  List<Employee> employees = [];

  void _getEmployees() async {
    Response response = await dio.get('$serverUrl/employees');
    List<Employee> parsedEmployees = [];
    if (response.statusCode == 200 && response.data != null) {
      for (final employee in response.data) {
        parsedEmployees.add(Employee(
          id: employee['id'],
          name: employee['name'],
          bank: employee['bank'],
          address: employee['address'],
        ));
      }
      setState(() => employees = parsedEmployees);
    }
  }

  void _deleteEmployee(Employee employee) async {
    print(employee.id);
    print(employee.name);
    await employee.delete();
    _getEmployees();
  }

  void _onCreateForm() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmployeeForm(),
      ),
    );
    _getEmployees();
  }

  void _onEditForm(Employee employee) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmployeeForm(employee: employee),
      ),
    );
    _getEmployees();
  }

  @override
  void initState() {
    super.initState();
    _getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(
            onPressed: _getEmployees,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(onPressed: _onCreateForm, icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Bank')),
              DataColumn(label: Text('Address')),
              DataColumn(label: Text('Options')),
            ],
            rows: [
              if (employees.isNotEmpty)
                for (final employee in employees)
                  DataRow(
                    cells: [
                      DataCell(Text(employee.name!)),
                      DataCell(Text(employee.bank!)),
                      DataCell(Text(employee.address!)),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.blue,
                            onPressed: () => _onEditForm(employee),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () => _deleteEmployee(employee),
                          ),
                        ],
                      )),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
