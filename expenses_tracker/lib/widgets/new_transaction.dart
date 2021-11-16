import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function? addNewTransaction;

  const NewTransaction({
    required this.addNewTransaction,
    Key? key,
  }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
      // return stops the function excecution so the code below won't be
      //reached if the condition above it is true and called(In the case of this app, transactions won't be added)
    }

    widget.addNewTransaction!(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
            //what is done here is kinda a rule to tell flutter that we got an argument
            //here but i don't really care about it or using it. In those cases it's adviceable to use this method to solve those issues
          ),
          Row(children: [
            Expanded(
              child: Text(_selectedDate == null
                  ? 'No Date Chosen!'
                  : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
            ),
            TextButton(
              child: const Text('Choose Date'),
              onPressed: _presentDatePicker,
            ),
          ]),
          ElevatedButton(
            child: const Text('Add Transaction'),
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}
