import 'package:flutter/material.dart';
import './form_page.dart';

class FlashPage extends StatelessWidget{ 

  @override
  Widget build(BuildContext context){
    return new Material(
    color: Colors.blueAccent,
    child: new InkWell(
      onTap: () =>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>new FormPage())),
      child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Image.network("https://1.bp.blogspot.com/-G19TXmCqxDg/TVnnL7qUCxI/AAAAAAAAAKc/ubs7xrSvrlc/s320/numerosromanos.jpg"),
      new Text("Roman Numbers", style: new TextStyle(color: Colors.orange[100], fontSize: 40.0,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
       new Text("Convertor", style: new TextStyle(color: Colors.orange[100], fontSize: 40.0,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
      ],
    ),
    )
    );
  }

}
