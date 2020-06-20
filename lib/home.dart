import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  //order to save
  Order _order = Order();

  String _validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : null;
  }

  String _validateItemCount(String value) {
    //check if value is not null and convert to integer
    int _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
    return _valueAsInteger == 0 ? 'At least one item is needed' : null;
  }

  void _submitOrder() {
    if (_formStateKey.currentState.validate()) {
      _formStateKey.currentState.save();

      
            print ('Order Item: ${_order.item}');
      print ('Order Quantity: ${_order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Form(
              key: _formStateKey,
              autovalidate: true,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Item',
                        hintText: 'Espresso',
                      ),
                      validator: (value) => _validateItemRequired(value),
                      onSaved: (value) => _order.item = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: '3',
                      ),
                      validator: (value) => _validateItemCount(value),
                      onSaved: (value) => _order.quantity = int.tryParse(value),
                    ),
                    Divider(
                      height: 32.0,
                    ),
                    RaisedButton(
                      child: Text('Save'),
                      color: Colors.lightGreen,
                      onPressed: () => _submitOrder(),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Order {
  String item;
  int quantity;
}
