import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/services/category_service.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var _todoTitleController = TextEditingController();
  var _todoDescriptionController = TextEditingController();
  var _todoDateController = TextEditingController();

  var _selectedValue;

  var _categories = List<DropdownMenuItem>();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    var _categoryService = CategoryService();
    var categories = await _categoryService.readCategory();
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(category['name']),
          value: category['name'],
        ));
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Created Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: _todoTitleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Write a todo title',
                  ),
                ),
                TextField(
                  controller: _todoDescriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Write a todo description',
                  ),
                ),
                TextField(
                  controller: _todoDateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'Pick a date',
                    prefix: InkWell(
                      onTap: () {
                        _selectedTodoDate(context);
                      },
                      child: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  value: _selectedValue,
                  items: _categories,
                  hint: Text('Category'),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text("Save"),
                  textColor: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
