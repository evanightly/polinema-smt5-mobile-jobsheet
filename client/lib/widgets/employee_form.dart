import 'package:client/config/default_style.dart';
import 'package:client/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key, this.employee});

  final Employee? employee;

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final nameController = TextEditingController();
  final bankController = TextEditingController();
  final addressController = TextEditingController();

  _closeModal() => Navigator.pop(context);

  _saveEmployee() async {
    Employee newEmployee;

    if (widget.employee != null) {
      newEmployee = Employee(
        id: widget.employee!.id,
        name: nameController.text,
        bank: bankController.text,
        address: addressController.text,
      );
    } else {
      newEmployee = Employee.create(
        name: nameController.text,
        bank: bankController.text,
        address: addressController.text,
      );
    }

    await newEmployee.save();

    if (context.mounted) Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      nameController.text = widget.employee!.name!;
      bankController.text = widget.employee!.bank!;
      addressController.text = widget.employee!.address!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBarTitle =
        widget.employee == null ? 'New Employee' : 'Edit Employee';

    return MaterialApp(
      theme: defaultStyle,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _closeModal,
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(appBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: bankController,
                decoration: const InputDecoration(labelText: 'Bank'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _closeModal,
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _saveEmployee,
                    child: const Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
