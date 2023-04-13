import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class B2BEcommerceForm extends StatefulWidget {
  @override
  _B2BEcommerceFormState createState() => _B2BEcommerceFormState();
}

class _B2BEcommerceFormState extends State<B2BEcommerceForm> {
  final _formKey = GlobalKey<FormState>();

  String _businessName = '';
  String _businessAddress = '';
  String _businessPhoneNumber = '';
  String _businessEmailAddress = '';
  String _contactPersonName = '';
  String _contactPersonPhoneNumber = '';
  String _contactPersonEmailAddress = '';
  String _clothingCategory = '';
  int _quantity = 0;
  DateTime _preferredDeliveryDate = DateTime.now();
  String _paymentMethod = '';

  final _businessNameController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _businessPhoneNumberController = TextEditingController();
  final _businessEmailAddressController = TextEditingController();
  final _contactPersonNameController = TextEditingController();
  final _contactPersonPhoneNumberController = TextEditingController();
  final _contactPersonEmailAddressController = TextEditingController();
  final _clothingCategoryController = TextEditingController();
  final _quantityController = TextEditingController();
  final _preferredDeliveryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'B2B Ecommerce Form',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 41, 3, 79),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _businessNameController,
              decoration: InputDecoration(
                labelText: 'Business Name',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the business name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _businessAddressController,
              decoration: InputDecoration(
                labelText: 'Business Address',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the business address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _businessPhoneNumberController,
              decoration: InputDecoration(
                labelText: 'Business Phone Number',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the business phone number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _businessEmailAddressController,
              decoration: InputDecoration(
                labelText: 'Business Email Address',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the business email address';
                }
                if (value == null || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _contactPersonNameController,
              decoration: InputDecoration(
                labelText: 'Contact Person\'s Name',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the contact person\'s name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _contactPersonPhoneNumberController,
              decoration: InputDecoration(
                labelText: 'Contact Person\'s Phone Number',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Please enter the contact person's phone number";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _contactPersonEmailAddressController,
              decoration: InputDecoration(
                labelText: "Contact Person's Email Address",
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Please enter the contact person's email address";
                }
                if (value == null || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _clothingCategoryController,
              decoration: InputDecoration(
                labelText: 'Clothing Category',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the clothing category';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the quantity';
                }
                if (int.tryParse(value!) == null) {
                  return 'Please enter a valid quantity';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _preferredDeliveryDateController,
              decoration: InputDecoration(
                labelText: 'Preferred Delivery Date',
              ),
              onTap: () async {
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(new FocusNode());
                date = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ))!;
                _preferredDeliveryDateController.text =
                    '${date.day}/${date.month}/${date.year}';
                _preferredDeliveryDate = date;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the preferred delivery date';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Payment Method',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter the payment method';
                }
                return null;
              },
              onChanged: (value) {
                _paymentMethod = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _saveData();
                  Navigator.pop(context);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveData() async {
    final data = {
      'businessName': _businessNameController.text,
      'businessAddress': _businessAddressController.text,
      'businessPhoneNumber': _businessPhoneNumberController.text,
      'businessEmailAddress': _businessEmailAddressController.text,
      'contactPersonName': _contactPersonNameController.text,
      'contactPersonPhoneNumber': _contactPersonPhoneNumberController.text,
      'contactPersonEmailAddress': _contactPersonEmailAddressController.text,
      'clothingCategory': _clothingCategoryController.text,
      'quantity': int.parse(_quantityController.text),
      'preferredDeliveryDate': Timestamp.fromDate(_preferredDeliveryDate),
      'paymentMethod': _paymentMethod,
    };
    await FirebaseFirestore.instance.collection('b2bData').add(data);
  }
}
