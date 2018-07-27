import 'package:flutter/material.dart';


import './convertor_page.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final valueController = TextEditingController();
  bool direction=true;

  @override
    void initState() {
      super.initState();
    }
   @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   return new Material(
     child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextFormField(

          decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.keyboard,
                color: Colors.blue[400],
              ),
              labelText: "Decimal number",
              labelStyle: TextStyle(fontSize: 18.0)),
          keyboardType: TextInputType.text,
          controller: valueController,
          validator:(value) {
            RegExp exp = new RegExp(".*\\d+.*");
            if(exp.hasMatch(value)){
              int num = int.parse(value);
              (num<1 && num >3999)?"Please enter number between 1 and 3999":null;
              direction=false;
            }
            if(value.isEmpty){
              "Please enter a Roman number";
            }
          },
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                 Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)=>
                 new ConvertionPage(direction:direction ,number: valueController.text)));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    ),
   ) ;
  }
}